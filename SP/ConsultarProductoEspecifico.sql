USE [Muebleria]
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultaEspecifica]    Script Date: 5/4/2022 17:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  --Recibe el id de un producto y reliza la consulta de toda la informacion
  --necesaria para representarlo
ALTER PROCEDURE [dbo].[SP_ConsultaEspecifica]
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