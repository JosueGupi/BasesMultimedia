USE [Muebleria]
GO
/****** Object:  StoredProcedure [dbo].[SP_ValidarLogin]    Script Date: 5/4/2022 17:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO--valida que un usuario ingresado en la interfaz si exista en la base de datos
ALTER PROCEDURE [dbo].[SP_ValidarLogin]
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