USE Muebleria
CREATE TABLE TipoPago (
	idTipoPago int IDENTITY PRIMARY KEY NOT NULL,
	tipoPago varchar(16) NOT NULL
)

CREATE TABLE TipoProducto (
	idTipoProducto int IDENTITY PRIMARY KEY NOT NULL,
	tipoProducto varchar(16) NOT NULL
)

CREATE TABLE TipoMaterial (
	idTipoMaterial int IDENTITY PRIMARY KEY NOT NULL,
	tipoMaterial varchar(16) NOT NULL
)

CREATE TABLE Dimensiones (
	idDimensiones int IDENTITY PRIMARY KEY NOT NULL,
	altura float NOT NULL,
	longitud float NOT NULL,
	profundidad float NOT NULL
)
CREATE TABLE Cliente(
	IdCliente int IDENTITY PRIMARY KEY NOT NULL,
	Nombre varchar(16) NOT NULL,
	Apellido varchar(16) NOT NULL,
	Tarjeta varchar(16) NOT NULL,
	CVC int NOT NULL,
	DireccionEntrega varchar(64) NOT NULL,
	Usuario varchar(16) NOT NULL,
	Contra varchar(16) NOT NULL
)

CREATE TABLE Factura (
	idFactura int IDENTITY PRIMARY KEY NOT NULL,
	idTipoPago int NOT NULL REFERENCES TipoPago(idTipoPago),
	idCliente int NOT NULL REFERENCES Cliente(idCliente),
	descuento int NOT NULL,
	fecha date NOT NULL
)

CREATE TABLE Producto (
	idProducto int IDENTITY PRIMARY KEY NOT NULL,
	idTipoMaterial int NOT NULL REFERENCES TipoMaterial(idTipoMaterial),
	idTipoProducto int NOT NULL REFERENCES TipoProducto(idTipoProducto),
	idDimensiones int NOT NULL REFERENCES Dimensiones(idDimensiones),
	precio money NOT NULL,
	nombre varchar(16) NOT NULL,
	imagen varbinary(max) NOT NULL,
	cuidados varchar(256) NOT NULL
)

CREATE TABLE Caracteristicas (
	idCaracteristicas int IDENTITY PRIMARY KEY NOT NULL,
	idProducto int NOT NULL REFERENCES Producto(idProducto),
	color varchar(16) NOT NULL
)

CREATE TABLE ProductoXFacturas (
	idProductoXFacturas int IDENTITY PRIMARY KEY NOT NULL,
	idProducto int NOT NULL REFERENCES Producto(idProducto),
	idFactura int NOT NULL REFERENCES Factura(idFactura),
	cantidad int NOT NULL,
	precioActual money NOT NULL
)



/* Funcion Consulta con parametros opcionales: 
Un cliente puede ver los productos existentes, consultar por tipo de mueble, 
o verlos todos, se debe mostrar la imagen del producto, las características, 
precio, y demás información*/

GO
ALTER PROCEDURE spProductosExistentes (@idTipoProducto int)
WITH ENCRYPTION AS
DECLARE @error varchar(2222)
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
RETURN 0

EXECUTE spProductosExistentes 2


