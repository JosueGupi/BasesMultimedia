USE [Muebleria]
GO
/****** Object:  StoredProcedure [dbo].[SP_BorrarTablas]    Script Date: 5/4/2022 17:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[SP_BorrarTablas]
AS
BEGIN
	SET NOCOUNT ON

		--LIMPIAR TABLAS
		--Reiniciar index
		DELETE FROM dbo.Caracteristicas
		DBCC CHECKIDENT(Caracteristicas, RESEED,0)

		DELETE FROM dbo.ProductoXFacturas
		DBCC CHECKIDENT(ProductoXFacturas, RESEED,0)

		DELETE FROM dbo.Producto
		DBCC CHECKIDENT(Producto, RESEED,0)

		DELETE FROM dbo.Dimensiones
		DBCC CHECKIDENT(Dimensiones, RESEED,0)
		
		DELETE FROM dbo.TipoProducto
		DBCC CHECKIDENT(TipoProducto, RESEED,0)

		DELETE FROM dbo.TipoMaterial
		DBCC CHECKIDENT(TipoMaterial, RESEED,0)

		DELETE FROM dbo.Factura
		DBCC CHECKIDENT(Factura, RESEED,0)

		DELETE FROM dbo.TipoPago
		DBCC CHECKIDENT(TipoPago, RESEED,0)

		DELETE FROM dbo.Cliente
		DBCC CHECKIDENT(Cliente, RESEED,0)
		

	SET NOCOUNT OFF
END