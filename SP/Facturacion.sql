USE Muebleria
GO
CREATE PROCEDURE [dbo].[SP_Facturacion]
	@inIdProducto INT,
	@inIdFactura INT,
	@inCantidad INT,
	@outResultCode INT OUTPUT
	AS
	BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		INSERT INTO ProductoXFacturas(
			IdProducto
			, idFactura
			, Cantidad
			, precioActual
		)SELECT
			@inIdProducto
			, @inIdFactura
			, @inCantidad
			, p.Precio
		FROM Producto p
		WHERE idProducto = @inIdProducto;

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


	SELECT * FROM Factura;
	SELECT * FROM ProductoXFacturas;