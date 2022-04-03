USE Muebleria
GO
CREATE PROCEDURE [dbo].[SP_Facturacion]
	@inIdProducto INT,
	@outResultCode INT OUTPUT
	AS
	BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		SELECT 
			p.precio
			, p.imagen
			, p.cuidados
			, c.color
			, d.altura
			, d.longitud
			, d.profundidad
			, tp.tipoMaterial
		FROM Producto p
		INNER JOIN Caracteristicas c ON p.idProducto = c.idProducto
		INNER JOIN TipoMaterial tp ON tp.idTipoMaterial = p.idTipoMaterial
		INNER JOIN Dimensiones d ON d.idDimensiones = p.idDimensiones
		WHERE p.idProducto = @inIdProducto;

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

            SET @OutResultCode=50005;
	END CATCH
	SET NOCOUNT OFF
	END


	SELECT 
			p.precio
			, p.imagen
			, p.cuidados
			, c.color
			, d.altura
			, d.longitud
			, d.profundidad
			, tp.tipoMaterial
		FROM Producto p
		INNER JOIN Caracteristicas c ON p.idProducto = c.idProducto
		INNER JOIN TipoMaterial tp ON tp.idTipoMaterial = p.idTipoMaterial
		INNER JOIN Dimensiones d ON d.idDimensiones = p.idDimensiones
		WHERE p.idProducto = 3