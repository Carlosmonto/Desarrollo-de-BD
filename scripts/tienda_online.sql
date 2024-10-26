DROP DATABASE IF EXISTS prueba;
CREATE DATABASE prueba;

-- Seleccionamos la base de datos
USE prueba;

-- Tabla: Ciudades
CREATE TABLE IF NOT EXISTS city (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255),
    description TINYTEXT
);

-- Tabla: Tipos de Documento
CREATE TABLE IF NOT EXISTS document_type (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    createdAt DATETIME,
    updatedAt DATETIME
);

-- Tabla: Personas
CREATE TABLE IF NOT EXISTS people (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(255),
    middleName VARCHAR(255),
    lastName VARCHAR(255),
    document VARCHAR(255),
    document_type_id INT,
    hiringDate DATE,
    address VARCHAR(150),
    city_id INT,
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (document_type_id) REFERENCES document_type(id),
    FOREIGN KEY (city_id) REFERENCES city(id)
);

-- Tabla: Teléfonos de Personas
CREATE TABLE IF NOT EXISTS people_phone (
    id INT AUTO_INCREMENT PRIMARY KEY,
    people_id INT,
    phone VARCHAR(15),
    createdAt DATETIME,
    FOREIGN KEY (people_id) REFERENCES people(id)
);

-- Tabla: Usuarios
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255),
    `name` VARCHAR(255),
    `password` VARCHAR(255),
    createdAt DATETIME,
    updatedAt DATETIME,
    people_id INT,
    FOREIGN KEY (people_id) REFERENCES people(id)
);

-- Tabla: Roles
CREATE TABLE IF NOT EXISTS roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255),
    `description` TINYTEXT,
    createdAt DATETIME,
    updatedAt DATETIME
);

-- Relación entre Usuarios y Roles
CREATE TABLE IF NOT EXISTS user_roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    role_id INT,
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (role_id) REFERENCES roles(id)
);

-- Tabla: Categorías de Productos
CREATE TABLE IF NOT EXISTS product_categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255),
    `description` TINYTEXT,
    createdAt DATETIME,
    updatedAt DATETIME
);

-- Tabla: Productos
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255),
    `code` VARCHAR(255),
    price DECIMAL(10, 2),
    salePrice DECIMAL(10, 2),
    stock INT,
    category_id INT,
    `description` TEXT,
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (category_id) REFERENCES product_categories(id)
);

-- Tabla: Detalles adicionales de productos
CREATE TABLE IF NOT EXISTS product_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    detail_name VARCHAR(255),
    detail_value VARCHAR(255),
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Tabla: Proveedores
CREATE TABLE IF NOT EXISTS supplier (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255),
    address VARCHAR(255),
    phone VARCHAR(20),
    createdAt DATETIME,
    updatedAt DATETIME
);

-- Relación entre Proveedores y Productos
CREATE TABLE IF NOT EXISTS supplier_product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    supplier_id INT,
    purchasePrice DECIMAL(10, 2),
    purchaseDate DATE,
    expirationDate DATE,
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(id)
);

-- Tabla: Almacenes
CREATE TABLE IF NOT EXISTS store (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255),
    address VARCHAR(255),
    nit VARCHAR(20),
    phone VARCHAR(20),
    openingDate DATE,
    createdAt DATETIME,
    updatedAt DATETIME
);

-- Relación entre Productos y Almacenes
CREATE TABLE IF NOT EXISTS store_products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    store_id INT,
    product_id INT,
    stock BIGINT,
    restockDate DATETIME,
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (store_id) REFERENCES store(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Tabla: Facturas
CREATE TABLE IF NOT EXISTS invoices (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    invoiceDate DATETIME,
    totalAmount DECIMAL(10, 2),
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (customer_id) REFERENCES users(id)
);

-- Tabla: Detalle de Facturas
CREATE TABLE IF NOT EXISTS invoice_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    invoice_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    subtotal DECIMAL(10, 2),
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (invoice_id) REFERENCES invoices(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Tabla: Órdenes
CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    orderDate DATETIME,
    totalAmount DECIMAL(10, 2),
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (customer_id) REFERENCES users(id)
);

-- Tabla: Detalle de Órdenes
CREATE TABLE IF NOT EXISTS order_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    subtotal DECIMAL(10, 2),
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Tabla: Métodos de Pago
CREATE TABLE IF NOT EXISTS payment_method (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    createdAt DATETIME,
    updatedAt DATETIME
);

-- Tabla: Pagos
CREATE TABLE IF NOT EXISTS payments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    invoice_id INT,
    payment_method_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    paymentDate DATETIME,
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (invoice_id) REFERENCES invoices(id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_method(id)
);

-- Tabla: Historial de Estado de Pagos
CREATE TABLE IF NOT EXISTS payment_status_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    payment_id INT,
    status ENUM('pending', 'completed', 'failed') NOT NULL,
    changeDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (payment_id) REFERENCES payments(id)
);
