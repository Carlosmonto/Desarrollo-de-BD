-- Seleccionamos la base de datos
USE prueba;
-- Inserciones para tabla city
INSERT INTO city (`name`, description) VALUES
('Mocoa', 'Capital de Putumayo'),
('Villagarzón', 'Municipio cercano a Mocoa'),
('Puerto Asís', 'Municipio de Putumayo'),
('Sibundoy', 'Municipio en el Valle de Sibundoy'),
('Orito', 'Municipio productor de petróleo en Putumayo');

-- Inserciones para tabla document_type
INSERT INTO document_type (`name`, createdAt, updatedAt) VALUES
('Cédula de Ciudadanía', NOW(), NOW()),
('Pasaporte', NOW(), NOW()),
('Tarjeta de Identidad', NOW(), NOW()),
('Cédula de Extranjería', NOW(), NOW()),
('Registro Civil', NOW(), NOW());

-- Inserciones para tabla people
INSERT INTO people (firstName, middleName, lastName, document, document_type_id, hiringDate, address, city_id, createdAt, updatedAt) VALUES
('Juan', 'Carlos', 'Pérez', '123456789', 1, '2020-05-10', 'Calle 10 #5-20', 1, NOW(), NOW()),
('Ana', 'María', 'Gómez', '987654321', 2, '2021-03-15', 'Carrera 15 #8-30', 2, NOW(), NOW()),
('Pedro', NULL, 'Martínez', '456789123', 3, '2019-08-25', 'Avenida 1 #2-50', 3, NOW(), NOW()),
('Laura', 'Isabel', 'Torres', '789123456', 1, '2022-06-05', 'Calle 45 #20-10', 4, NOW(), NOW()),
('Carlos', NULL, 'Ramírez', '321654987', 4, '2023-01-12', 'Carrera 12 #14-40', 5, NOW(), NOW());

-- Inserciones para tabla people_phone
INSERT INTO people_phone (people_id, phone, createdAt) VALUES
(1, '3101234567', NOW()),
(2, '3157654321', NOW()),
(3, '3209876543', NOW()),
(4, '3121237894', NOW()),
(5, '3179874561', NOW());

-- Inserciones para tabla users
INSERT INTO users (email, `name`, `password`, createdAt, updatedAt, people_id) VALUES
('juan.perez@example.com', 'Juan Perez', 'password123', NOW(), NOW(), 1),
('ana.gomez@example.com', 'Ana Gomez', 'passAna2023', NOW(), NOW(), 2),
('pedro.martinez@example.com', 'Pedro Martinez', 'securePass!', NOW(), NOW(), 3),
('laura.torres@example.com', 'Laura Torres', 'laura1234', NOW(), NOW(), 4),
('carlos.ramirez@example.com', 'Carlos Ramirez', 'carlos456', NOW(), NOW(), 5);

-- Inserciones para tabla roles
INSERT INTO roles (`name`, `description`, createdAt, updatedAt) VALUES
('Admin', 'Administrador del sistema', NOW(), NOW()),
('Client', 'Cliente de la tienda', NOW(), NOW()),
('Supplier', 'Proveedor de productos', NOW(), NOW()),
('Employee', 'Empleado de la tienda', NOW(), NOW()),
('Manager', 'Gerente de tienda', NOW(), NOW());

-- Inserciones para tabla user_roles
INSERT INTO user_roles (user_id, role_id, createdAt, updatedAt) VALUES
(1, 1, NOW(), NOW()),
(2, 2, NOW(), NOW()),
(3, 3, NOW(), NOW()),
(4, 4, NOW(), NOW()),
(5, 5, NOW(), NOW());

-- Inserciones para tabla product_categories
INSERT INTO product_categories (`name`, `description`, createdAt, updatedAt) VALUES
('Electrónica', 'Productos electrónicos', NOW(), NOW()),
('Hogar', 'Artículos para el hogar', NOW(), NOW()),
('Deportes', 'Equipo deportivo', NOW(), NOW()),
('Ropa', 'Ropa y accesorios', NOW(), NOW()),
('Libros', 'Libros de diferentes géneros', NOW(), NOW());

-- Inserciones para tabla products
INSERT INTO products (`name`, `code`, price, salePrice, stock, category_id, `description`, createdAt, updatedAt) VALUES
('Televisor', 'ELEC-001', 1200.00, 1100.00, 50, 1, 'Televisor de 42 pulgadas', NOW(), NOW()),
('Lavadora', 'HOG-001', 800.00, 750.00, 20, 2, 'Lavadora automática', NOW(), NOW()),
('Bicicleta', 'DEP-001', 300.00, 290.00, 15, 3, 'Bicicleta de montaña', NOW(), NOW()),
('Camisa', 'ROP-001', 40.00, 35.00, 100, 4, 'Camisa de algodón', NOW(), NOW()),
('Libro de Cuentos', 'LIB-001', 15.00, 12.00, 200, 5, 'Libro de cuentos para niños', NOW(), NOW());

-- Inserciones para tabla product_details
INSERT INTO product_details (product_id, detail_name, detail_value, createdAt, updatedAt) VALUES
(1, 'Tamaño', '42 pulgadas', NOW(), NOW()),
(2, 'Capacidad', '15 kg', NOW(), NOW()),
(3, 'Material', 'Aluminio', NOW(), NOW()),
(4, 'Color', 'Azul', NOW(), NOW()),
(5, 'Idioma', 'Español', NOW(), NOW());

-- Inserciones para tabla supplier
INSERT INTO supplier (`name`, address, phone, createdAt, updatedAt) VALUES
('Proveedor 1', 'Calle 10 #5-20', '3101234567', NOW(), NOW()),
('Proveedor 2', 'Carrera 20 #8-30', '3157654321', NOW(), NOW()),
('Proveedor 3', 'Avenida 15 #2-50', '3209876543', NOW(), NOW()),
('Proveedor 4', 'Calle 45 #20-10', '3121237894', NOW(), NOW()),
('Proveedor 5', 'Carrera 12 #14-40', '3179874561', NOW(), NOW());

-- Inserciones para tabla supplier_product
INSERT INTO supplier_product (product_id, supplier_id, purchasePrice, purchaseDate, expirationDate, createdAt, updatedAt) VALUES
(1, 1, 1000.00, '2023-01-10', '2025-01-10', NOW(), NOW()),
(2, 2, 700.00, '2023-02-15', '2025-02-15', NOW(), NOW()),
(3, 3, 250.00, '2023-03-05', '2025-03-05', NOW(), NOW()),
(4, 4, 30.00, '2023-04-10', '2025-04-10', NOW(), NOW()),
(5, 5, 10.00, '2023-05-20', '2025-05-20', NOW(), NOW());

-- Inserciones para tabla store
INSERT INTO store (`name`, address, nit, phone, openingDate, createdAt, updatedAt) VALUES
('Almacen Central', 'Calle 10 #5-20', '900123456', '3101234567', '2020-05-10', NOW(), NOW()),
('Almacen Norte', 'Carrera 20 #8-30', '900765432', '3157654321', '2021-06-15', NOW(), NOW()),
('Almacen Sur', 'Avenida 15 #2-50', '900987654', '3209876543', '2019-07-20', NOW(), NOW()),
('Almacen Este', 'Calle 45 #20-10', '900543210', '3121237894', '2022-08-25', NOW(), NOW()),
('Almacen Oeste', 'Carrera 12 #14-40', '900678901', '3179874561', '2023-01-12', NOW(), NOW());

-- Inserciones para tabla store_products
INSERT INTO store_products (store_id, product_id, stock, restockDate, createdAt, updatedAt) VALUES
(1, 1, 30, '2023-02-10', NOW(), NOW()),
(2, 2, 15, '2023-03-15', NOW(), NOW()),
(3, 3, 20, '2023-04-20', NOW(), NOW()),
(4, 4, 50, '2023-05-25', NOW(), NOW()),
(5, 5, 80, '2023-06-30', NOW(), NOW());

-- Inserciones para tabla payment_method
INSERT INTO payment_method (`name`, createdAt, updatedAt) VALUES
('Efectivo', NOW(), NOW()),
('Tarjeta de Crédito', NOW(), NOW()),
('Transferencia Bancaria', NOW(), NOW()),
('Paypal', NOW(), NOW()),
('Cheque', NOW(), NOW());

-- Inserciones para tabla invoices
INSERT INTO invoices (customer_id, invoiceDate, totalAmount, createdAt, updatedAt) VALUES
(1, '2023-07-15', 200.00, NOW(), NOW()),
(2, '2023-08-20', 300.00, NOW(), NOW()),
(3, '2023-09-10', 450.00, NOW(), NOW()),
(4, '2023-10-05', 150.00, NOW(), NOW()),
(5, '2023-11-12', 500.00, NOW(), NOW());

-- Inserciones para tabla invoice_details
INSERT INTO invoice_details (invoice_id, product_id, quantity, price, subtotal, createdAt, updatedAt) VALUES
    (1, 1, 2, 1100.00, 2200.00, NOW(), NOW()),
    (2, 2, 1, 750.00, 750.00, NOW(), NOW()),
    (3, 3, 3, 290.00, 870.00, NOW(), NOW()),
    (4, 4, 5, 35.00, 175.00, NOW(), NOW()),
    (5, 5, 10, 12.00, 120.00, NOW(), NOW());



-- Inserciones para tabla orders
INSERT INTO orders (customer_id, orderDate, totalAmount, createdAt, updatedAt) VALUES
(1, '2023-01-15', 250.00, NOW(), NOW()),
(2, '2023-02-20', 320.00, NOW(), NOW()),
(3, '2023-03-10', 410.00, NOW(), NOW()),
(4, '2023-04-05', 170.00, NOW(), NOW()),
(5, '2023-05-12', 550.00, NOW(), NOW());

-- Inserciones para tabla order_details
INSERT INTO order_details (order_id, product_id, quantity, price, subtotal, createdAt, updatedAt) VALUES
    (1, 1, 1, 1100.00, 1100.00, NOW(), NOW()),
    (2, 2, 2, 750.00, 1500.00, NOW(), NOW()),
    (3, 3, 3, 290.00, 870.00, NOW(), NOW()),
    (4, 4, 5, 35.00, 175.00, NOW(), NOW()),
    (5, 5, 10, 12.00, 120.00, NOW(), NOW());


-- Inserciones para tabla payments
INSERT INTO payments (invoice_id, payment_method_id, amount, paymentDate, createdAt, updatedAt) VALUES
(1, 1, 200.00, '2023-07-15', NOW(), NOW()),
(2, 2, 300.00, '2023-08-20', NOW(), NOW()),
(3, 3, 450.00, '2023-09-10', NOW(), NOW()),
(4, 4, 150.00, '2023-10-05', NOW(), NOW()),
(5, 5, 500.00, '2023-11-12', NOW(), NOW());

-- Inserciones para tabla payment_status_history
INSERT INTO payment_status_history (payment_id, status, changeDate) VALUES
(1, 'completed', NOW()),
(2, 'completed', NOW()),
(3, 'completed', NOW()),
(4, 'pending', NOW()),
(5, 'failed', NOW());
