--Trigger để tự động tạo tài khoản cho khách hàng khi thêm mới một bản ghi vào bảng "customer":
CREATE TRIGGER trg_CreateAccount
ON customer
AFTER INSERT
AS
BEGIN
    INSERT INTO account (customer_id, role_id)
    SELECT customer_id, 'US'
    FROM inserted;
END;

INSERT INTO customer (first_name, last_name, address, phone_number)
VALUES ('Nam', 'Ngu', 'FPT', '113'), -- Thêm mới khách hàng John Doe

SELECT * FROM account;
SELECT * FROM customer;

UPDATE customer
SET first_name = 'Kan', last_name = 'Le'
WHERE customer_id = 1;

--Trigger để tự động update số lượng tồn kho phù hợp với số lượng ở mỗi kích thước
GO
CREATE TRIGGER trg_UpdateBreadStock
ON bread_size
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    -- Cập nhật giá trị units_in_stock trong bảng bread
    UPDATE bread
    SET units_in_stock = ISNULL((
            SELECT SUM(quantity)
            FROM bread_size
            WHERE bread_id = bread.bread_id
            GROUP BY bread_id
        ), 0)
    WHERE bread.bread_id IN (
            SELECT bread_id
            FROM inserted
        )
        OR bread.bread_id IN (
            SELECT bread_id
            FROM deleted
        );
END;

SELECT * FROM bread;
SELECT * FROM bread_size;

INSERT INTO bread_size (bread_id, bread_type_id, size_name, price, quantity)
VALUES (1, 1, 'Large', 10.99, 20);

UPDATE bread_size
SET quantity = 15
WHERE bread_size_id = 1; -- Cập nhật số lượng cho kích thước có bread_size_id = 1

DELETE FROM bread_size
WHERE bread_size_id = 1; -- Xóa kích thước có bread_size_id = 1


--Trigger tính total_amount ở bảng order dựa trên bảng order_detail và bread_size
GO
CREATE TRIGGER calculate_total_amount
ON order_detail
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    -- Tính tổng giá trị đơn hàng cho các đơn hàng trong bảng order
    UPDATE o
    SET total_amount = (
        SELECT SUM(bs.price * od.quantity)
        FROM "order" o
        JOIN order_detail od ON o.order_id = od.order_id
        JOIN bread_size bs ON od.bread_size_id = bs.bread_size_id
        WHERE o.order_id = inserted.order_id
        GROUP BY o.order_id
    )
    FROM "order" o
    JOIN inserted ON o.order_id = inserted.order_id;

    -- Cập nhật tổng giá trị đơn hàng cho các đơn hàng bị xóa từ bảng order_detail
    UPDATE o
    SET total_amount = (
        SELECT SUM(bs.price * od.quantity)
        FROM "order" o
        JOIN order_detail od ON o.order_id = od.order_id
        JOIN bread_size bs ON od.bread_size_id = bs.bread_size_id
        WHERE o.order_id = deleted.order_id
        GROUP BY o.order_id
    )
    FROM "order" o
    JOIN deleted ON o.order_id = deleted.order_id;
END;
GO

SELECT * FROM "order";
SELECT * FROM "order_detail";
SELECT * FROM "bread_size";

INSERT INTO order_detail (order_id, bread_size_id, quantity)
VALUES (2, 2, 4);

UPDATE order_detail
SET quantity = 3
WHERE order_id = 3 AND bread_size_id = 1;

DELETE FROM order_detail
WHERE order_id = 1 AND bread_size_id = 1;

--Trigger tự động xóa ảnh khi một sản phẩm bị xóa
GO
CREATE TRIGGER trg_delete_related_images
ON bread
AFTER DELETE
AS
BEGIN
    DELETE FROM image
    WHERE bread_id IN (SELECT bread_id FROM deleted);
END;
GO

--Trigger để cập nhật trạng thái đơn hàng tự động khi có sự thay đổi
CREATE TRIGGER trg_update_order_status
ON order_detail
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    UPDATE "order"
    SET status = 'In Progress'
    WHERE order_id IN (
        SELECT DISTINCT order_id
        FROM inserted
    );

    UPDATE "order"
    SET status = 'Completed'
    WHERE order_id NOT IN (
        SELECT DISTINCT order_id
        FROM order_detail
    );
END;
GO






