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



