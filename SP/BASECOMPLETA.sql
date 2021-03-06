USE [Muebleria]
GO
/****** Object:  Table [dbo].[Caracteristicas]    Script Date: 5/4/2022 17:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Caracteristicas](
	[idCaracteristicas] [int] IDENTITY(1,1) NOT NULL,
	[idProducto] [int] NOT NULL,
	[color] [varchar](16) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCaracteristicas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 5/4/2022 17:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](16) NOT NULL,
	[Apellido] [varchar](16) NOT NULL,
	[Tarjeta] [varchar](16) NOT NULL,
	[CVC] [int] NOT NULL,
	[DireccionEntrega] [varchar](64) NOT NULL,
	[Usuario] [varchar](16) NOT NULL,
	[Contra] [varchar](16) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dimensiones]    Script Date: 5/4/2022 17:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dimensiones](
	[idDimensiones] [int] IDENTITY(1,1) NOT NULL,
	[altura] [float] NOT NULL,
	[longitud] [float] NOT NULL,
	[profundidad] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idDimensiones] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Errores]    Script Date: 5/4/2022 17:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Errores](
	[Name] [varchar](max) NOT NULL,
	[Numero] [int] NOT NULL,
	[Estado] [int] NOT NULL,
	[Severidad] [int] NOT NULL,
	[Linea] [int] NOT NULL,
	[Procedimientos] [varchar](max) NOT NULL,
	[Mensaje] [varchar](max) NOT NULL,
	[Fecha] [date] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 5/4/2022 17:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[idFactura] [int] IDENTITY(1,1) NOT NULL,
	[idTipoPago] [int] NOT NULL,
	[idCliente] [int] NOT NULL,
	[descuento] [int] NOT NULL,
	[fecha] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 5/4/2022 17:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[idTipoMaterial] [int] NOT NULL,
	[idTipoProducto] [int] NOT NULL,
	[idDimensiones] [int] NOT NULL,
	[precio] [money] NOT NULL,
	[nombre] [varchar](16) NOT NULL,
	[imagen] [varbinary](max) NOT NULL,
	[cuidados] [varchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductoXFacturas]    Script Date: 5/4/2022 17:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductoXFacturas](
	[idProductoXFacturas] [int] IDENTITY(1,1) NOT NULL,
	[idProducto] [int] NOT NULL,
	[idFactura] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precioActual] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idProductoXFacturas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMaterial]    Script Date: 5/4/2022 17:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMaterial](
	[idTipoMaterial] [int] IDENTITY(1,1) NOT NULL,
	[tipoMaterial] [varchar](16) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoMaterial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoPago]    Script Date: 5/4/2022 17:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoPago](
	[idTipoPago] [int] IDENTITY(1,1) NOT NULL,
	[tipoPago] [varchar](16) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoProducto]    Script Date: 5/4/2022 17:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoProducto](
	[idTipoProducto] [int] IDENTITY(1,1) NOT NULL,
	[tipoProducto] [varchar](16) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Caracteristicas]  WITH CHECK ADD FOREIGN KEY([idProducto])
REFERENCES [dbo].[Producto] ([idProducto])
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD FOREIGN KEY([idTipoPago])
REFERENCES [dbo].[TipoPago] ([idTipoPago])
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([idDimensiones])
REFERENCES [dbo].[Dimensiones] ([idDimensiones])
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([idTipoMaterial])
REFERENCES [dbo].[TipoMaterial] ([idTipoMaterial])
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([idTipoProducto])
REFERENCES [dbo].[TipoProducto] ([idTipoProducto])
GO
ALTER TABLE [dbo].[ProductoXFacturas]  WITH CHECK ADD FOREIGN KEY([idFactura])
REFERENCES [dbo].[Factura] ([idFactura])
GO
ALTER TABLE [dbo].[ProductoXFacturas]  WITH CHECK ADD FOREIGN KEY([idProducto])
REFERENCES [dbo].[Producto] ([idProducto])
GO
/****** Object:  StoredProcedure [dbo].[SP_BorrarTablas]    Script Date: 5/4/2022 17:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_BorrarTablas]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultaEspecifica]    Script Date: 5/4/2022 17:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  --Recibe el id de un producto y reliza la consulta de toda la informacion
  --necesaria para representarlo
CREATE PROCEDURE [dbo].[SP_ConsultaEspecifica]
	@inIdProducto INT,
	@outResultCode INT OUTPUT
	AS
	BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		SELECT 
			p.precio
			, p.imagen
			, p.cuidados
			, c.color
			, d.altura
			, d.longitud
			, d.profundidad
			, tp.tipoMaterial
		FROM Producto p
		INNER JOIN Caracteristicas c ON p.idProducto = c.idProducto
		INNER JOIN TipoMaterial tp ON tp.idTipoMaterial = p.idTipoMaterial
		INNER JOIN Dimensiones d ON d.idDimensiones = p.idDimensiones
		WHERE p.idProducto = @inIdProducto;

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
GO
/****** Object:  StoredProcedure [dbo].[SP_CrearFactura]    Script Date: 5/4/2022 17:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CrearFactura]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_Facturacion]    Script Date: 5/4/2022 17:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
GO
/****** Object:  StoredProcedure [dbo].[SP_ValidarLogin]    Script Date: 5/4/2022 17:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ValidarLogin]
	@inUsuario VARCHAR(16),
	@inContraseña VARCHAR(16),
	@outResultCode INT OUTPUT
	AS
	BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		SELECT IdCliente
			, Nombre
			, Apellido
			, Tarjeta
			, CVC
			, DireccionEntrega
			, Usuario
			, Contra 
		FROM dbo.Cliente 
		WHERE Usuario = @inUsuario 
		AND Contra = @inContraseña;
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
GO
/****** Object:  StoredProcedure [dbo].[SP_ValidarUsuario]    Script Date: 5/4/2022 17:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ValidarUsuario]
	@inNombre VARCHAR(16),
	@inApellido VARCHAR(16),
	@inTarjeta VARCHAR(16),
	@inCVC INT,
	@inDireccion VARCHAR(16),
	@inUsuario VARCHAR(16),
	@inContraseña VARCHAR(16),
	@outResultCode INT OUTPUT
	AS
	BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		IF NOT EXISTS (SELECT IdCliente FROM Cliente WHERE Usuario = @inUsuario)
		BEGIN
			INSERT INTO Cliente (
				Nombre
				, Apellido
				, Tarjeta
				, CVC
				, DireccionEntrega
				, Usuario
				, Contra
			)
			VALUES(
				@inNombre
				, @inApellido
				, @inTarjeta
				, @inCVC
				, @inDireccion
				, @inUsuario
				, @inContraseña
			);

			SELECT
				IdCliente
				, Nombre
				, Apellido
				, Tarjeta
				, CVC
				, DireccionEntrega
				, Usuario
				, Contra
			FROM Cliente
			WHERE IdCliente= (SELECT MAX(IdCliente) FROM Cliente);
			
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

        SELECT 50005;
	END CATCH
	SET NOCOUNT OFF
	END
GO
/****** Object:  StoredProcedure [dbo].[spProducto]    Script Date: 5/4/2022 17:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spProducto] @flag int, @idProducto int, @idTipoMaterial int, @idTipoProducto int,
							 @idDimensiones int, @precio money, @nombre varchar(16), @imagen varbinary(MAX),
							 @color varchar(16), @cuidados varchar(256)
AS
DECLARE @error varchar(2222)
DECLARE @aux int 
IF(SELECT COUNT(idProducto) FROM Producto WHERE idProducto = @idProducto) = 0  -- obtener existencia
	AND @idProducto IS NOT NULL
	BEGIN
		SET @error = 'El producto no existe.'
		PRINT(@error)
		SELECT @error
		RETURN 1
	END
BEGIN TRY 
	IF @flag = 1 -- CREATE
	BEGIN
		BEGIN TRY
			INSERT INTO Producto (idTipoMaterial,idTipoProducto,idDimensiones,precio,nombre,imagen,cuidados)
						VALUES (@idTipoMaterial,@idTipoProducto,@idDimensiones,@precio,@nombre,@imagen,@cuidados)
			SELECT @aux = SCOPE_IDENTITY() -- obtener id del elemento recién ingresado
			INSERT INTO Caracteristicas (idProducto,color)
						VALUES (@aux,@color)
			SET @error = 'Producto ingresado correctamente.'
			SELECT @error
		END TRY
		BEGIN CATCH
			SET @error = 'Error al ingresar el Producto.'
			SELECT @error
			RETURN 1
		END CATCH
	END
	IF @flag = 2 -- READ
	BEGIN
		SELECT P.idProducto, nombre, precio, imagen, cuidados, color, tipoMaterial, altura, longitud, profundidad, tipoProducto
		FROM Producto AS P
		INNER JOIN Caracteristicas
			ON P.idProducto = Caracteristicas.idProducto
		INNER JOIN TipoProducto
			ON P.idTipoProducto = TipoProducto.idTipoProducto
		INNER JOIN TipoMaterial
			ON P.idTipoMaterial = TipoMaterial.idTipoMaterial
		INNER JOIN Dimensiones
			ON P.idDimensiones = Dimensiones.idDimensiones
		WHERE P.idProducto = ISNULL(@idProducto,P.idProducto) 
		AND   P.idTipoMaterial = ISNULL(@idTipoMaterial,P.idTipoMaterial)
		AND   P.idTipoProducto = ISNULL(@idTipoProducto,P.idTipoProducto)
		AND   P.idDimensiones = ISNULL(@idDimensiones,P.idDimensiones)
		AND   precio = ISNULL(@precio,precio)
		AND   nombre = ISNULL(@nombre,nombre)
		AND   color = ISNULL(@color,color)
		AND   cuidados = ISNULL(@cuidados,cuidados)
		SET @error = 'Consulta finalizada.'
		SELECT @error
	END
	IF @flag = 3 -- UPDATE
	BEGIN
		UPDATE Producto 
		SET   idTipoMaterial = ISNULL(@idTipoMaterial,idTipoMaterial),
			  idTipoProducto = ISNULL(@idTipoProducto,idTipoProducto),
			  idDimensiones = ISNULL(@idDimensiones,idDimensiones),
			  precio = ISNULL(@precio,precio),
			  nombre = ISNULL(@nombre,nombre),
			  cuidados = ISNULL(@cuidados,cuidados),
			  imagen = @imagen
		WHERE idProducto = @idProducto
		UPDATE Caracteristicas 
		SET   color = ISNULL(@color,color)
		WHERE idProducto = @idProducto
		SET @error = 'El producto se ha actualizado correctamente.'
		SELECT @error
	END
	IF @flag = 4 -- DELETE
	BEGIN
		DELETE FROM Caracteristicas
		WHERE idProducto = @idProducto
		DELETE FROM Producto 
		WHERE idProducto = @idProducto
		SET @error = 'El producto se ha eliminado correctamente.'
		SELECT @error
	
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
PRINT(@error)
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spProductosExistentes]    Script Date: 5/4/2022 17:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spProductosExistentes] (@idTipoProducto int)
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
GO
