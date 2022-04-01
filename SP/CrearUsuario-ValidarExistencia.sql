USE Muebleria
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
			SELECT
				@inNombre
				, @inApellido
				, @inTarjeta
				, @inCVC
				, @inDireccion
				, @inUsuario
				, @inContraseña 
			
		END
	END TRY
	BEGIN CATCH
		IF @@Trancount>0 
                    
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