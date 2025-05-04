/*Procedimiento para actualizar un producto
Se valida que exista el producto y de ser así se actualiza*/

CREATE PROCEDURE ActualizarProducto
	@CodProducto INT,
	@Descripcion VARCHAR(100),
	@Precio DECIMAL(10,0),
	@CodMarca SMALLINT,
	@CodCategoria SMALLINT
AS
BEGIN
	IF EXISTS (SELECT 1 FROM ELEProductos WHERE CodProducto = @CodProducto)
	BEGIN
		IF EXISTS (SELECT 1 FROM ELEMarcas WHERE CodMarca = @CodMarca)
		BEGIN
			IF EXISTS (SELECT 1 FROM ELECategorias WHERE CodCategoria = @CodCategoria)
			BEGIN
		
				BEGIN TRANSACTION;
		
				--Se actualiza el producto
				UPDATE ELEProductos
				SET Descripcion = @Descripcion, Precio = @Precio, CodMarca = @CodMarca, CodCategoria = @CodCategoria
				WHERE CodProducto = @CodProducto;

				COMMIT TRANSACTION;

				PRINT 'Producto actualizado con exito';
				RETURN 0; -- Indica éxito
			END
			ELSE
			BEGIN
				ROLLBACK TRANSACTION;
				PRINT 'Error, categoría no encontrada';
				RETURN 1; -- Indica error 
			END
		END
		ELSE
		BEGIN
			ROLLBACK TRANSACTION;
			PRINT 'Error, marca no encontrada';
			RETURN 1; -- Indica error 
		END
	END
	ELSE
	BEGIN
		ROLLBACK TRANSACTION;
		PRINT 'El producto no se encuentra registrado';
        RETURN 1; -- Indica error
	END
END;
GO