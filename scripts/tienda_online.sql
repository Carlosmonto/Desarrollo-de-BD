drop database if exists prueba;
 CREATE DATABASE prueba;

USE prueba;
CREATE TABLE IF NOT EXISTS ciudad (
    id_ciudad INT AUTO_INCREMENT PRIMARY KEY,
    ciudad VARCHAR(50),
    descripcicon TINYTEXT
);
CREATE TABLE IF NOT EXISTS compradores(
id_compradores INT AUTO_INCREMENT PRIMARY KEY,
nombres varchar(50),
apellido1 varchar(50),
apellido2 varchar(50),
nit varchar(15),
telefono VARCHAR(15),
createAt datetime,
updateAt datetime,
id_ciudad int,
FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad)
);

CREATE TABLE IF NOT EXISTS categoria_product (
    id_categoria_producto INT AUTO_INCREMENT PRIMARY KEY,
    categoria VARCHAR(35)
);

CREATE TABLE IF NOT EXISTS producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    producto VARCHAR(100),
    descripcion TEXT,
    categoria_producto INT, 
    precio DECIMAL(10,2),
    FOREIGN KEY (categoria_producto) REFERENCES categoria_product(id_categoria_producto)
);

CREATE TABLE IF NOT EXISTS provedores (
    id_provedores INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    contacto VARCHAR(100),
    telefono VARCHAR(15),
    email VARCHAR(100),
    direccion VARCHAR(80),
    id_ciudad INT,
    FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad)
);
CREATE TABLE IF NOT EXISTS pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_comprador INT,
    fecha_pedido DATETIME,
    total DECIMAL(10, 2),
    estado VARCHAR(20),
    FOREIGN KEY (id_comprador) REFERENCES compradores(id_compradores)
);
CREATE TABLE IF NOT EXISTS detalle_pedido (
    id_pedido INT,
    id_producto INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    subtotal DECIMAL(10, 2),
    PRIMARY KEY (id_pedido, id_producto),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);
CREATE TABLE IF NOT EXISTS metodo_pago (
    id_metodo_pago INT AUTO_INCREMENT PRIMARY KEY,
    metodo VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS pago (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_metodo_pago INT,
    fecha_pago DATETIME,
    total_pagado DECIMAL(10, 2),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_metodo_pago) REFERENCES metodo_pago(id_metodo_pago)
);
CREATE TABLE IF NOT EXISTS inventario (
    id_producto INT PRIMARY KEY,
    cantidad INT,
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);
CREATE TABLE IF NOT EXISTS envio (
    id_envio INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    direccion_entrega VARCHAR(150),
    fecha_envio DATETIME,
    fecha_entrega DATETIME,
    id_ciudad INT,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad)
);

CREATE TABLE IF NOT EXISTS producto_proveedor (
    id_producto INT,
    id_provedores INT,
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
    FOREIGN KEY (id_provedores) REFERENCES provedores(id_provedores),
    PRIMARY KEY (id_producto, id_provedores)
);
