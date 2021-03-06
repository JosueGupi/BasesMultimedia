USE [Muebleria]
GO
/****** Object:  StoredProcedure [dbo].[spProducto]    Script Date: 5/4/2022 17:24:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO--Funcion CRUD para prodcutos, dependiendo de la bandera que se le envia sabe cual de los procedimientos debe de realizar
ALTER PROCEDURE [dbo].[spProducto] @flag int, @idProducto int, @idTipoMaterial int, @idTipoProducto int,
							 @idDimensiones int, @precio money, @nombre varchar(16), @imagen varbinary(MAX),
							 @color varchar(16), @cuidados varchar(256)
AS
DECLARE @error varchar(2222)
DECLARE @aux int 
IF(SELECT COUNT(idProducto) FROM Producto WHERE idProducto = @idProducto) = 0  -- obtener existencia
	AND @idProducto IS NOT NULL
	BEGIN
		SET @error = 'El producto no existe.'
		PRINT(@error)
		SELECT @error
		RETURN 1
	END
BEGIN TRY 
	IF @flag = 1 -- CREATE
	BEGIN
		BEGIN TRY
			INSERT INTO Producto (idTipoMaterial,idTipoProducto,idDimensiones,precio,nombre,imagen,cuidados)
						VALUES (@idTipoMaterial,@idTipoProducto,@idDimensiones,@precio,@nombre,@imagen,@cuidados)
			SELECT @aux = SCOPE_IDENTITY() -- obtener id del elemento recién ingresado
			INSERT INTO Caracteristicas (idProducto,color)
						VALUES (@aux,@color)
			SET @error = 'Producto ingresado correctamente.'
			SELECT @error
		END TRY
		BEGIN CATCH
			SET @error = 'Error al ingresar el Producto.'
			SELECT @error
			RETURN 1
		END CATCH
	END
	IF @flag = 2 -- READ
	BEGIN
		SELECT P.idProducto, nombre, precio, imagen, cuidados, color, tipoMaterial, altura, longitud, profundidad, tipoProducto
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
		SELECT @error
	END
	IF @flag = 3 -- UPDATE
	BEGIN
		UPDATE Producto 
		SET   idTipoMaterial = ISNULL(@idTipoMaterial,idTipoMaterial),
			  idTipoProducto = ISNULL(@idTipoProducto,idTipoProducto),
			  idDimensiones = ISNULL(@idDimensiones,idDimensiones),
			  precio = ISNULL(@precio,precio),
			  nombre = ISNULL(@nombre,nombre),
			  cuidados = ISNULL(@cuidados,cuidados),
			  imagen = @imagen
		WHERE idProducto = @idProducto
		UPDATE Caracteristicas 
		SET   color = ISNULL(@color,color)
		WHERE idProducto = @idProducto
		SET @error = 'El producto se ha actualizado correctamente.'
		SELECT @error
	END
	IF @flag = 4 -- DELETE
	BEGIN
		DELETE FROM Caracteristicas
		WHERE idProducto = @idProducto
		DELETE FROM Producto 
		WHERE idProducto = @idProducto
		SET @error = 'El producto se ha eliminado correctamente.'
		SELECT @error
	
	END
END TRY
BEGIN CATCH               
    INSERT INTO dbo.Errores    VALUES (
        SUSER_SNAME(),
        ERROR_NUMBER(),
        ERROR_STATE(),
        ERROR_SEVERITY(),
        ERROR_LINE(),
        ERROR_PROCEDURE(),
        ERROR_MESSAGE(),
        GETDATE()
    );
END CATCH
PRINT(@error)
RETURN 0