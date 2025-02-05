-- --------------------------
-- Schema ElectroStore
-- --------------------------
DROP SCHEMA IF EXISTS ElectroStore;
CREATE SCHEMA IF NOT EXISTS ElectroStore;
USE ElectroStore;

-- --------------------------
-- Tabla ElectroStore . Tienda
-- --------------------------
DROP TABLE IF EXISTS Tienda;
CREATE TABLE IF NOT EXISTS Tienda (
codTienda INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(50) NOT NULL,
telefono VARCHAR(20) NOT NULL,
correoElectronico  VARCHAR(150) NOT NULL,
direccion VARCHAR (200) NOT NULL,
PRIMARY KEY (codTienda));
-- No especifico Engine porque en la versión de MySQL 5.5 en adelante se pone por defecto el InnoDB

-- --------------------------
-- Tabla ElectroStore . Cargo
-- --------------------------
DROP TABLE IF EXISTS Cargo;
CREATE TABLE IF NOT EXISTS Cargo (
codCargo INT NOT NULL AUTO_INCREMENT,
descripcion VARCHAR(50) NOT NULL,
PRIMARY KEY (codCargo));
-- No especifico Engine porque en la versión de MySQL 5.5 en adelante se pone por defecto el InnoDB

-- --------------------------
-- Tabla ElectroStore . Cliente
-- --------------------------
DROP TABLE IF EXISTS Cliente;
CREATE TABLE IF NOT EXISTS Cliente (
codCliente INT NOT NULL AUTO_INCREMENT,
identificacion INT NOT NULL,
nombre VARCHAR(50) NOT NULL,
apellido1 VARCHAR(50) NOT NULL,
apellido2 VARCHAR(50) NULL,
telefono VARCHAR(20) NULL,
direccion VARCHAR(1000) NULL,
correoElectronico  VARCHAR(150) NOT NULL,
PRIMARY KEY (codCliente));
-- No especifico Engine porque en la versión de MySQL 5.5 en adelante se pone por defecto el InnoDB

-- --------------------------
-- Tabla ElectroStore . Categoria_Producto
-- --------------------------
DROP TABLE IF EXISTS Categoria_Producto;
CREATE TABLE IF NOT EXISTS Categoria_Producto (
codCategoria INT NOT NULL AUTO_INCREMENT,
descripcion VARCHAR(50) NOT NULL,
PRIMARY KEY (codCategoria));
-- No especifico Engine porque en la versión de MySQL 5.5 en adelante se pone por defecto el InnoDB

-- --------------------------
-- Tabla ElectroStore . Marca
-- --------------------------
DROP TABLE IF EXISTS Marca_Producto;
CREATE TABLE IF NOT EXISTS Marca_Producto (
codMarca INT NOT NULL AUTO_INCREMENT,
descripcion VARCHAR(100) NOT NULL,
PRIMARY KEY (codMarca));
-- No especifico Engine porque en la versión de MySQL 5.5 en adelante se pone por defecto el InnoDB

-- --------------------------
-- Tabla ElectroStore . Producto
-- --------------------------
DROP TABLE IF EXISTS Producto;
CREATE TABLE IF NOT EXISTS Producto (
codProducto INT NOT NULL AUTO_INCREMENT,
descripcion VARCHAR(100) NOT NULL,
precio DECIMAL(10,2),
codMarca INT NOT NULL,
codCategoria INT NOT NULL,
PRIMARY KEY (codProducto),
CONSTRAINT fk_Categoria_Producto
	FOREIGN KEY (codCategoria)
    REFERENCES ElectroStore.Categoria_Producto (codCategoria)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
CONSTRAINT fk_marca_producto
	FOREIGN KEY (codMarca)
    REFERENCES ElectroStore.Marca_Producto (codMarca)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
-- No especifico Engine porque en la versión de MySQL 5.5 en adelante se pone por defecto el InnoDB

-- --------------------------
-- Tabla ElectroStore . Inventario
-- --------------------------
DROP TABLE IF EXISTS Inventario;
CREATE TABLE IF NOT EXISTS Inventario (
codInventario INT NOT NULL AUTO_INCREMENT,
cantidad INT NOT NULL,
codProducto INT NOT NULL,
codTienda INT NOT NULL,
PRIMARY KEY (codInventario),
CONSTRAINT fk_Producto
	FOREIGN KEY (codProducto)
    REFERENCES ElectroStore.Producto(codProducto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
CONSTRAINT fk_Tienda
	FOREIGN KEY (codTienda)
    REFERENCES ElectroStore.Tienda(codTienda)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
-- No especifico Engine porque en la versión de MySQL 5.5 en adelante se pone por defecto el InnoDB

-- --------------------------
-- Tabla ElectroStore . Empleado
-- --------------------------
DROP TABLE IF EXISTS Empleado;
CREATE TABLE IF NOT EXISTS Empleado (
codEmpleado INT NOT NULL AUTO_INCREMENT,
identificacion INT NOT NULL,
nombre VARCHAR(50) NOT NULL,
apellido1 VARCHAR(50) NOT NULL,
apellido2 VARCHAR(50) NULL,
telefono VARCHAR(20) NOT NULL,
fechaContrato DATE NOT NULL,
codTienda INT NOT NULL,
codCargo INT NOT NULL,
PRIMARY KEY (codEmpleado),
CONSTRAINT fk_tienda_empleado
	FOREIGN KEY (codTienda)
    REFERENCES Tienda (codTienda)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
CONSTRAINT fk_cargo_empleado
	FOREIGN KEY (codCargo)
    REFERENCES Cargo (codCargo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
-- No especifico Engine porque en la versión de MySQL 5.5 en adelante se pone por defecto el InnoDB

-- --------------------------
-- Tabla ElectroStore . Factura
-- --------------------------
DROP TABLE IF EXISTS Factura;
CREATE TABLE IF NOT EXISTS Factura (
numFactura INT NOT NULL AUTO_INCREMENT,
fecha_emision DATE NOT NULL,
fecha_entrega DATE NOT NULL,
estado VARCHAR(50) NOT NULL,
descuento DECIMAL(10,2) NOT NULL,
codCliente INT NOT NULL,
codEmpleado INT NOT NULL,
codTienda INT NOT NULL,
PRIMARY KEY (numFactura),
CONSTRAINT fk_cliente_factura
	FOREIGN KEY (codCliente)
    REFERENCES Cliente (codCliente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
CONSTRAINT fk_empleado_factura
	FOREIGN KEY (codEmpleado)
    REFERENCES Empleado (codEmpleado)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
CONSTRAINT fk_tienda_factura
	FOREIGN KEY (codTienda)
    REFERENCES Tienda (codTienda)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
-- No especifico Engine porque en la versión de MySQL 5.5 en adelante se pone por defecto el InnoDB
-- En esta tabla no se agrega el total de la factura ya que no es una buena práctica almacenar resultados de cálculos, se calculará el total cuando se cree el view de la factura

-- --------------------------
-- Tabla ElectroStore . Items_Factura
-- --------------------------
DROP TABLE IF EXISTS Items_Factura;
CREATE TABLE IF NOT EXISTS Items_Factura (
numItem INT NOT NULL AUTO_INCREMENT,
cantidad_factura INT NOT NULL,
codProducto INT NOT NULL,
numFactura INT NOT NULL,
PRIMARY KEY (numItem),
CONSTRAINT fk_producto_items_factura
	FOREIGN KEY (codProducto)
    REFERENCES Producto (codProducto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
CONSTRAINT fk_numero_factura
	FOREIGN KEY (numFactura)
    REFERENCES Factura (numFactura)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
-- No especifico Engine porque en la versión de MySQL 5.5 en adelante se pone por defecto el InnoDB
