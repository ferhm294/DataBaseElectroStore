/*Procedimiento para insertar una venta
Se valida la existencia del producto en el stock de la tienda y de ser posible se realiza la venta*/

CREATE PROCEDURE InsertarVenta
    @CodProducto INT,
    @Cantidad INT,
    @CodCliente INT,
    @CodEmpleado INT,
    @CodTienda INT,
    @FecCompra DATE,
    @FecEntrega DATE,
    @Descuento DECIMAL(10,0)
AS
BEGIN
    DECLARE @Saldo INT;

    -- Se obtiene el saldo del producto en la tienda
	SELECT @Saldo = Saldo FROM ELETiendaProducto WHERE CodProducto = @CodProducto AND CodTienda = @CodTienda;
    
    -- Se verifica si el producto existe y que la tienda tenga suficiente stock para la venta
    IF EXISTS (SELECT 1 FROM ELEProductos WHERE CodProducto = @CodProducto) AND @Saldo >= @Cantidad
    BEGIN
		IF EXISTS (SELECT 1 FROM ELEClientes WHERE CodCliente = @CodCliente)
		BEGIN
			IF EXISTS (SELECT 1 FROM ELEEmpleados WHERE CodEmpleado = @CodEmpleado)
			BEGIN
				BEGIN TRANSACTION;
        
				-- Generar el nuevo NumFactura, esto se puede evitar si se le habilita el autoincremental al PK de la tabla
				DECLARE @NumFactura INT;
				SELECT @NumFactura = ISNULL(MAX(NumFactura), 0) + 1 FROM ELEFacturaEnc;

				-- Se hace el insert en la tabla ELEFacturaEnc
				INSERT INTO ELEFacturaEnc (NumFactura, CodCliente, CodEmpleado, CodTienda, FecCompra, FecEntrega, Estado)
				VALUES (@NumFactura, @CodCliente, @CodEmpleado, @CodTienda, @FecCompra, @FecEntrega, 1); -- Estado '1' para pagada

				-- Generar el nuevo CodItem, esto se puede evitar si se le habilita el autoincremental al PK de la tabla
				DECLARE @CodItem INT;
				SELECT @CodItem = ISNULL(MAX(CodItem), 0) + 1 FROM ELEFacturasDet;
        
				-- Se hace el insert en la tabla ELEFacturasDet
				INSERT INTO ELEFacturasDet (CodItem, NumFactura, Cantidad, Descuento, CodProducto)
				VALUES (@CodItem, @NumFactura, @Cantidad, @Descuento, @CodProducto);
        
				-- Actualizar el saldo en stock
				UPDATE ELETiendaProducto
				SET Saldo = Saldo - @Cantidad
				WHERE CodTienda = @CodTienda AND CodProducto = @CodProducto;
        
				COMMIT TRANSACTION;
        
				PRINT 'Venta insertada con éxito';
				RETURN 0; -- Indica éxito
			END
			ELSE
			BEGIN
				ROLLBACK TRANSACTION;
				PRINT 'Error, empleado no encontrado';
				RETURN 1; -- Indica fallo
			END
		END
		ELSE
		BEGIN
			ROLLBACK TRANSACTION;
			PRINT 'Error, cliente no encontrado';
			RETURN 1; --Indica fallo
		END
    END
    ELSE
    BEGIN
        ROLLBACK TRANSACTION;
        PRINT 'Error, la tienda no cuenta con el producto disponible';
        RETURN 1; -- Indica fallo
    END
END;
GO