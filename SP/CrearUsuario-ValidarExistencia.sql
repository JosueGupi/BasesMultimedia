USE Muebleria
GO
ALTER PROCEDURE [dbo].[SP_ValidarUsuario]
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

	SELECT * FROM Cliente