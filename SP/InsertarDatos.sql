INSERT INTO TipoPago (tipoPago)
	        VALUES   ('Tarjeta'),
					 ('Paypal'),
					 ('Sinpe Móvil')

INSERT INTO TipoProducto (tipoProducto)
	        VALUES   ('Habitación'),
					 ('Sala'),
					 ('Cocina'),
					 ('Comedor')

INSERT INTO TipoMaterial (tipoMaterial)
	        VALUES   ('Pino'),
					 ('Velvet'),
					 ('Vinil'),
					 ('Madera rústica'),
					 ('Lino'),
					 ('Terciopelo'),
					 ('Granito'),
					 ('Aquaclean')

INSERT INTO Dimensiones (altura, longitud, profundidad) -- metros
	        VALUES   (2.35,1.5,0.6),
					 (1.95,2.15,0.5),
					 (0.6,0.5,0.5),
					 (0.8,1.5,0.6),
					 (1.4,1.35,1.9),
					 (1.0,1.0,0.5),
					 (0.8,1.6,0.7)


/*
DECLARE @imagenAlimento VARBINARY(MAX);
SET @imagenAlimento = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\muebleCocina.jpgSINGLE_BLOB) AS Imagen)
EXECUTE spProducto 1,NULL,1,3,2,350000,'Mueble de cocina',@imagenAlimento,'Negro','Utilizar un paño suave para limpiarlos y darles brillo, utilizar productos en aerosol.'

EXECUTE spProducto 2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL

SELECT * FROM Producto

*/

INSERT INTO Cliente (Nombre, Apellido, Tarjeta, CVC, DireccionEntrega, Usuario, Contra)
		    VALUES ('Fabián','Medina',58954147,125,'San Carlos','fabian','fabian1234'),
				   ('Diego','García',89652214,698,'San Pablo','diego','diego1234')

/*
Facturas:

DECLARE @idFactura1 int, @precioActual money
INSERT INTO Factura (idTipoPago, idCliente, descuento, fecha)
		    VALUES  (1,1,10,'03/04/2022')
SELECT @idFactura1 = SCOPE_IDENTITY()
INSERT INTO ProductoXFacturas (idProducto,idFactura,cantidad,precioActual)
			VALUES (6,@idFactura1,2,40000.00)

DECLARE @idFactura2 int, @precioActual money
INSERT INTO Factura (idTipoPago, idCliente, descuento, fecha)
		    VALUES  (1,2,10,'02/04/2022')
SELECT @idFactura2 = SCOPE_IDENTITY()
INSERT INTO ProductoXFacturas (idProducto,idFactura,cantidad,precioActual)
			VALUES (1,@idFactura2,1,220000.00)

DECLARE @idFactura3 int, @precioActual money
INSERT INTO Factura (idTipoPago, idCliente, descuento, fecha)
		    VALUES  (1,1,10,'02/01/2022')
SELECT @idFactura3 = SCOPE_IDENTITY()
INSERT INTO ProductoXFacturas (idProducto,idFactura,cantidad,precioActual)
			VALUES (10,@idFactura3,1,120000.00)

*/