USE Muebleria
GO
CREATE PROCEDURE [dbo].[SP_ValidarUsuario]
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