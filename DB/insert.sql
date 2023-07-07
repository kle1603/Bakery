-- Thêm dữ liệu vào bảng bread_type
INSERT INTO bread_type (bread_type_name)
VALUES ('Loaf'), ('Baguette'), ('Roll'), ('Croissant'), ('Bun');

-- Thêm dữ liệu vào bảng bread
INSERT INTO bread (bread_type_id, bread_name, units_in_stock, description)
VALUES
    (1, 'Sourdough Loaf', 20, 'Traditional sourdough bread.'),
    (2, 'French Baguette', 8, 'Classic French-style baguette.'),
    (3, 'Dinner Roll', 15, 'Soft and fluffy dinner rolls.'),
    (4, 'Plain Croissant', 12, 'Buttery and flaky croissant.'),
    (5, 'Hamburger Bun', 10, 'Soft bun for hamburgers.');

-- Thêm dữ liệu vào bảng bread_size
INSERT INTO bread_size (bread_id, bread_type_id, size_name, price, quantity)
VALUES
    (1, 1, 'Large', 12.00, 5),
    (1, 1, 'Medium', 10.00, 5),
    (1, 1, 'Small', 7.50, 10),
    (2, 2, 'Medium', 5.00, 8),
    (3, 3, 'Medium', 2.50, 15),
    (4, 4, 'Medium', 3.00, 12),
    (5, 5, 'Medium', 1.50, 10);

-- Thêm dữ liệu vào bảng image
INSERT INTO image (bread_id, image_url)
VALUES
    (1, 'https://example.com/sourdough.jpg'),
    (2, 'https://example.com/baguette.jpg'),
    (3, 'https://example.com/roll.jpg'),
    (4, 'https://example.com/croissant.jpg'),
    (5, 'https://example.com/bun.jpg');

-- Thêm dữ liệu vào bảng customer
INSERT INTO customer (first_name, last_name, address, phone_number)
VALUES
    ('John', 'Doe', '123 Main St, City', '123-456-7890'),
    ('Jane', 'Smith', '456 Elm St, Town', '987-654-3210');

-- Thêm dữ liệu vào bảng payment_method
INSERT INTO payment_method (payment_method_name)
VALUES ('Credit Card'), ('PayPal'), ('Cash');

-- Thêm dữ liệu vào bảng "order"
INSERT INTO "order" (customer_id, payment_method_id, order_date, total_amount, status)
VALUES
    (1, 1, GETDATE(), 50.00, 'Pending'),
    (2, 2, GETDATE(), 35.00, 'Completed');

-- Thêm dữ liệu vào bảng order_detail
INSERT INTO order_detail (order_id, bread_size_id, quantity)
VALUES
    (1, 1, 2), (1, 3, 1),
    (2, 4, 3), (2, 5, 2);

-- Thêm dữ liệu vào bảng roles
INSERT INTO roles (role_id, role_name)
VALUES ('AD', 'Administrator'), ('US', 'User');

-- Thêm dữ liệu vào bảng account
INSERT INTO account (customer_id, username, password, email, role_id)
VALUES
    (1, 'kan', '1', 'kan@gmail.com', 'AD'),
    (2, 'janesmith', 'password', 'jane.smith@example.com', 'US');