USE [Muebleria]
GO
/****** Object:  StoredProcedure [dbo].[SP_Facturacion]    Script Date: 5/4/2022 17:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO--Inicia con la relacion de los productos con la facutura que corresponde a su venta y a la vez a 
--almacenar la cantidad de los productos vendidos y el repcio del mismo al momento de la venta
ALTER PROCEDURE [dbo].[SP_Facturacion]
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