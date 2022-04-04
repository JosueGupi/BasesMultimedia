USE Muebleria




/* Funcion Consulta con parametros opcionales: 
Un cliente puede ver los productos existentes, consultar por tipo de mueble, 
o verlos todos, se debe mostrar la imagen del producto, las características, 
precio, y demás información*/

GO
CREATE PROCEDURE spProductosExistentes (@idTipoProducto int)
WITH ENCRYPTION AS
DECLARE @error varchar(2222)
BEGIN TRY
	BEGIN
		SELECT P.idProducto, 
			nombre, 
			precio, 
			imagen, 
			cuidados, 
			color, 
			tipoMaterial, 
			altura, 
			longitud, 
			profundidad
		FROM Producto AS P
		INNER JOIN Caracteristicas
			ON P.idProducto = Caracteristicas.idProducto
		INNER JOIN TipoProducto
			ON P.idTipoProducto = TipoProducto.idTipoProducto
		INNER JOIN TipoMaterial
			ON P.idTipoMaterial = TipoMaterial.idTipoMaterial
		INNER JOIN Dimensiones
			ON P.idDimensiones = Dimensiones.idDimensiones
		WHERE P.idTipoProducto = ISNULL(@idTipoProducto,P.idTipoProducto)
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
RETURN 0

EXECUTE spProductosExistentes 2


