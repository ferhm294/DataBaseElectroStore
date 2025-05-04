/*Funcion para calcular el stock
total de un producto entre todas las tiendas*/

CREATE FUNCTION StockTotalPorProducto
(
    @CodProducto INT
)
RETURNS INT
BEGIN
    DECLARE @StockTotal INT;

    -- Se calcula la sumatoria de todo el inventario donde coincida el c�digo del producto sin importar el c�digo de la tienda
    SELECT @StockTotal = ISNULL(SUM(Saldo), 0)
    FROM ELETiendaProducto
    WHERE CodProducto = @CodProducto;

    RETURN @StockTotal;
END;
GO