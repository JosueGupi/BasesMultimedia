USE Muebleria




/* Funcion Consulta con parametros opcionales: 
Un cliente puede ver los productos existentes, consultar por tipo de mueble, 
o verlos todos, se debe mostrar la imagen del producto, las caracter�sticas, 
precio, y dem�s informaci�n*/

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


