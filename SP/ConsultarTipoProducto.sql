USE [Muebleria]
GO
/****** Object:  StoredProcedure [dbo].[spProductosExistentes]    Script Date: 5/4/2022 17:25:38 ******/
SET ANSI_NULLS ON
GO--Realiza la consulta de la informacion de los porductos que pertenezcan al tipo de producto que se le envie
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spProductosExistentes] (@idTipoProducto int)
 AS
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