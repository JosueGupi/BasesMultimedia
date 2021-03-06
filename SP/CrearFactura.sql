USE [Muebleria]
GO
/****** Object:  StoredProcedure [dbo].[SP_CrearFactura]    Script Date: 5/4/2022 17:18:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO--Crea la facura en la base de datos y retorna el indice de esa factura para saber a que asignarle la compra
ALTER PROCEDURE [dbo].[SP_CrearFactura]
	@inIdTipoPago INT,
	@inIdCliente INT,
	@Descuento INT,
	@outResultCode INT OUTPUT
	AS
	BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		INSERT INTO Factura(
			IdTipoPago
			, IdCliente
			, Descuento
			, Fecha
		)SELECT
			@inIdTipoPago
			, @inIdCliente
			, @Descuento
			, GETDATE();
		SELECT SCOPE_IDENTITY() FROM Factura;

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