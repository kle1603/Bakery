-- Tạo cơ sở dữ liệu
CREATE DATABASE bakery_db;
GO

-- Sử dụng cơ sở dữ liệu
USE bakery_db;
GO

-- Bảng bread_type
CREATE TABLE bread_type (
    bread_type_id INT PRIMARY KEY IDENTITY(1, 1),
    bread_type_name NVARCHAR(50) NOT NULL
);
GO

-- Bảng bread
CREATE TABLE bread (
    bread_id INT PRIMARY KEY IDENTITY(1, 1),
    bread_type_id INT,
    bread_name NVARCHAR(50),
    description NVARCHAR(MAX),
    price MONEY,
    quantity INT,
    FOREIGN KEY (bread_type_id) REFERENCES bread_type(bread_type_id)
);
GO

-- Bảng image
CREATE TABLE image (
    image_id INT PRIMARY KEY IDENTITY(1, 1),
    bread_id INT,
    image_url NVARCHAR(MAX),
    FOREIGN KEY (bread_id) REFERENCES bread(bread_id)
);
GO

-- Bảng customer
CREATE TABLE customer (
    customer_id INT PRIMARY KEY IDENTITY(1, 1),
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
	full_name NVARCHAR(100),
	avatar NVARCHAR(MAX)
);
GO

-- Bảng payment_method
CREATE TABLE payment_method (
    payment_method_id INT PRIMARY KEY IDENTITY(1, 1),
    payment_method_name NVARCHAR(50)
);
GO

-- Bảng "order"
CREATE TABLE "order" (
    order_id INT PRIMARY KEY IDENTITY(1, 1),
    customer_id INT,
    payment_method_id INT,
    order_date DATETIME,
    total_amount MONEY,
	last_name NVARCHAR(50),
	first_name NVARCHAR(50),
	address NVARCHAR(100),
	phone_number NVARCHAR(20),
    status NVARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_method(payment_method_id)
);
GO

-- Bảng order_detail
CREATE TABLE order_detail (
    order_id INT,
    bread_id INT,
    quantity INT,
    PRIMARY KEY (order_id, bread_id),
    FOREIGN KEY (order_id) REFERENCES "order"(order_id),
    FOREIGN KEY (bread_id) REFERENCES bread(bread_id)
);
GO

-- Bảng roles
CREATE TABLE roles (
    role_id CHAR(10) PRIMARY KEY,
    role_name NVARCHAR(50)
);
GO

-- Bảng account
CREATE TABLE account (
    account_id INT PRIMARY KEY IDENTITY(1, 1),
    customer_id INT,
    username NVARCHAR(50),
    password NVARCHAR(50),
    email VARCHAR(255),
    role_id CHAR(10),
    facebook_id NVARCHAR(50),
    google_id NVARCHAR(50),
    FOREIGN KEY (role_id) REFERENCES roles(role_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);
GO

-- Bảng cart
CREATE TABLE cart (
    cart_id INT PRIMARY KEY IDENTITY(1, 1),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- Bảng cart_item
CREATE TABLE cart_item (
    cart_id INT,
    bread_id INT,
    quantity INT,
    PRIMARY KEY (cart_id, bread_id),
    FOREIGN KEY (cart_id) REFERENCES cart(cart_id),
    FOREIGN KEY (bread_id) REFERENCES bread(bread_id)
);
GO

