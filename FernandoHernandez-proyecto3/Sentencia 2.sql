/*Función para calcular el monto total de compras
de un cliente en un rango de fechas específico*/

CREATE FUNCTION MontoTotalComprasCliente
(
    @Identificacion VARCHAR,
    @FecInicio DATE,
    @FecFin DATE
)
RETURNS DECIMAL(10,0)
BEGIN
    DECLARE @MontoTotal DECIMAL(10,0);

    -- Calcular la sumatoria del total de compras del cliente en el rango de fechas especificado
    SELECT @MontoTotal = ISNULL(SUM(Total), 0)
    FROM ELEFacturaEnc enc
	JOIN ELEClientes c ON enc.CodCliente = c.CodCliente
    WHERE c.Identificacion = @Identificacion AND enc.FecCompra >= @FecInicio AND enc.FecCompra <= @FecFin;

    RETURN @MontoTotal;
END;
GO