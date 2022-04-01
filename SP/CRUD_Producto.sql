-- Agregar Funcion o procedimientoLos productos se deben de poder agregar al inventario (CRUD)
-- Flag: 1. CREATE 2. READ 3. UPDATE 4. DELETE 

GO -- DROP PROCEDURE spProducto
CREATE PROCEDURE spProducto (@flag int, @idProducto int, @idTipoMaterial int, @idTipoProducto int,
							 @idDimensiones int, @precio money, @nombre varchar(16), @imagen varbinary(MAX),
							 @color varchar(16), @cuidados varchar(256))
WITH ENCRYPTION AS
DECLARE @error varchar(2222)
DECLARE @aux int 
IF(SELECT COUNT(idProducto) FROM Producto WHERE idProducto = @idProducto) = 0  -- obtener existencia
	AND @idProducto IS NOT NULL
	BEGIN
		SET @error = 'El producto no existe.'
		PRINT(@error)
		RETURN 1
	END
IF @flag = 1 -- CREATE
BEGIN
	BEGIN TRY
		INSERT INTO Producto (idTipoMaterial,idTipoProducto,idDimensiones,precio,nombre,imagen,cuidados)
					VALUES (@idTipoMaterial,@idTipoProducto,@idDimensiones,@precio,@nombre,@imagen,@cuidados)
		SELECT @aux = SCOPE_IDENTITY() -- obtener id del elemento recién ingresado
		INSERT INTO Caracteristicas (idProducto,color)
					VALUES (@aux,@color)
		SET @error = 'Producto ingresado correctamente.'
	END TRY
	BEGIN CATCH
		SET @error = 'Error al ingresar el Producto.'
		RETURN 1
	END CATCH
END
IF @flag = 2 -- READ
BEGIN
	SELECT P.idProducto, nombre, precio, imagen, cuidados, color, tipoMaterial, altura, longitud, profundidad
	FROM Producto AS P
	INNER JOIN Caracteristicas
		ON P.idProducto = Caracteristicas.idProducto
	INNER JOIN TipoProducto
		ON P.idTipoProducto = TipoProducto.idTipoProducto
	INNER JOIN TipoMaterial
		ON P.idTipoMaterial = TipoMaterial.idTipoMaterial
	INNER JOIN Dimensiones
		ON P.idDimensiones = Dimensiones.idDimensiones
	WHERE P.idProducto = ISNULL(@idProducto,P.idProducto) 
	AND   P.idTipoMaterial = ISNULL(@idTipoMaterial,P.idTipoMaterial)
	AND   P.idTipoProducto = ISNULL(@idTipoProducto,P.idTipoProducto)
	AND   P.idDimensiones = ISNULL(@idDimensiones,P.idDimensiones)
	AND   precio = ISNULL(@precio,precio)
	AND   nombre = ISNULL(@nombre,nombre)
	AND   color = ISNULL(@color,color)
	AND   cuidados = ISNULL(@cuidados,cuidados)
	SET @error = 'Consulta finalizada.'
END
IF @flag = 3 -- UPDATE
BEGIN
	UPDATE Producto 
	SET   idTipoMaterial = ISNULL(@idTipoMaterial,idTipoMaterial),
	      idTipoProducto = ISNULL(@idTipoProducto,idTipoProducto),
	      idDimensiones = ISNULL(@idDimensiones,idDimensiones),
	      precio = ISNULL(@precio,precio),
	      nombre = ISNULL(@nombre,nombre),
	      cuidados = ISNULL(@cuidados,cuidados) 
	WHERE idProducto = @idProducto
	UPDATE Caracteristicas 
	SET   color = ISNULL(@color,color)
	WHERE idProducto = @idProducto
	SET @error = 'El producto se ha actualizado correctamente.'
END
IF @flag = 4 -- DELETE
BEGIN
	DELETE FROM Caracteristicas
	WHERE idProducto = @idProducto
	DELETE FROM Producto 
	WHERE idProducto = @idProducto
	SET @error = 'El producto se ha eliminado correctamente.'
END
PRINT(@error)
RETURN 0


/*
EXECUTE spProducto 1,1,1,3,2,350000,'Mueble de cocina','ruta imagen','Negro','Utilizar un paño suave para limpiarlos y darles brillo, utilizar productos en aerosol.'
EXECUTE spProducto 1,NULL,NULL,3,2,350000,'Mueble de cocina','ruta imagen','Negro','Utilizar un paño suave para limpiarlos y darles brillo, utilizar productos en aerosol.'
EXECUTE spProducto 1,NULL,1,3,2,350000,'Mueble de cocina','ruta imagen','Negroooo','Utilizar un paño suave para limpiarlos y darles brillo, utilizar productos en aerosol.'
EXECUTE spProducto 1,NULL,1,3,2,NULL,'Mueble de cocina','ruta imagen','Negro','Utilizar un paño suave para limpiarlos y darles brillo, utilizar productos en aerosol.'
EXECUTE spProducto 2,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL
EXECUTE spProducto 2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL
EXECUTE spProducto 2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Negro',NULL
EXECUTE spProducto 3,1,NULL,NULL,NULL,NULL,NULL,NULL,'Amarillo',NULL
EXECUTE spProducto 2,1,NULL,NULL,NULL,NULL,NULL,NULL,'Amarillo',NULL
EXECUTE spProducto 2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Amarillo',NULL
EXECUTE spProducto 2,170,NULL,NULL,NULL,NULL,NULL,NULL,'Amarillo',NULL
EXECUTE spProducto 4,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL
SELECT * FROM Producto
SELECT * FROM Caracteristicas

*/
