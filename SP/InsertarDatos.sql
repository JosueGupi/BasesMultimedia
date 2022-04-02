INSERT INTO TipoPago (tipoPago)
	        VALUES   ('Tarjeta'),
					 ('Paypal'),
					 ('Sinpe Móvil')

SELECT * FROM TipoPago

INSERT INTO TipoProducto (tipoProducto)
	        VALUES   ('Habitación'),
					 ('Sala'),
					 ('Cocina'),
					 ('Comedor')

INSERT INTO TipoMaterial (tipoMaterial)
	        VALUES   ('Pino'),
					 ('Velvet'),
					 ('Vinil'),
					 ('Micro fibra'),
					 ('Lino'),
					 ('Terciopelo'),
					 ('Granito')

SELECT * FROM TipoMaterial
SELECT * FROM TipoProducto

INSERT INTO Dimensiones (altura, longitud, profundidad) -- metros
	        VALUES   (2.35,1.5,0.6),
					 (2.05,1.4,0.6),
					 (0.6,0.5,0.5),
					 (0.8,1.5,0.6)

SELECT * FROM Dimensiones

/*INSERT INTO Producto (idTipoMaterial, idTipoProducto, idDimensiones, precio, nombre, imagen, cuidados) -- metros
	        VALUES   (1,2,1,120000,'Biblioteca','ruta imagen','Utilizar un paño suave para limpiarlos y darles brillo, utilizar productos en aerosol.'),
	                 (1,3,2,350000,'Mueble de cocina','ruta imagen','Utilizar un paño suave para limpiarlos y darles brillo, utilizar productos en aerosol.')
		    */

SELECT * FROM Producto

INSERT INTO Caracteristicas (idProducto, color)
	        VALUES   (1,'Café'),
					 (2,'Blanco'),
					 (2,'Negro')

SELECT * FROM Caracteristicas

SELECT COUNT(tipoProducto) FROM TipoProducto
SELECT tipoProducto FROM TipoProducto

SELECT* FROM Producto p INNER JOIN TipoProducto TP on p.idTipoProducto = TP.idTipoProducto