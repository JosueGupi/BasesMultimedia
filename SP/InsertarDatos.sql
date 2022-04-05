INSERT INTO TipoPago (tipoPago)
	        VALUES   ('Tarjeta'),
					 ('Paypal'),
					 ('Sinpe M�vil')

INSERT INTO TipoProducto (tipoProducto)
	        VALUES   ('Habitaci�n'),
					 ('Sala'),
					 ('Cocina'),
					 ('Comedor')

INSERT INTO TipoMaterial (tipoMaterial)
	        VALUES   ('Pino'),
					 ('Velvet'),
					 ('Vinil'),
					 ('Madera r�stica'),
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

INSERT INTO Cliente (Nombre, Apellido, Tarjeta, CVC, DireccionEntrega, Usuario, Contra)
		    VALUES ('Fabi�n','Medina',58954147,125,'San Carlos','fabian','fabian1234'),
				   ('Diego','Garc�a',89652214,698,'San Pablo','diego','diego1234')






