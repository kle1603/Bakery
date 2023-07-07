--Register Account
CREATE PROCEDURE RegisterAccount
    @email VARCHAR(255),
    @username VARCHAR(50),
    @password CHAR(50)
AS
BEGIN
    -- Thêm dữ liệu vào bảng roles nếu chưa tồn tại
    IF NOT EXISTS (SELECT 1 FROM roles WHERE role_id = 'US')
    BEGIN
        INSERT INTO roles (role_id, role_name)
        VALUES ('US', 'User'); -- Vai trò người dùng (user)
    END

    -- Thêm khách hàng mới
    INSERT INTO customer (first_name, last_name, full_name, avatar)
    VALUES (NULL, NULL, NULL, NULL);

    -- Lấy ID khách hàng vừa được thêm
    DECLARE @customer_id INT
    SET @customer_id = SCOPE_IDENTITY();

    -- Thêm tài khoản mới và liên kết với vai trò người dùng (user)
    INSERT INTO account (customer_id, email, username, password, role_id)
    VALUES (@customer_id, @email, @username, @password, 'US');

    -- Tạo giỏ hàng mới cho khách hàng
    INSERT INTO cart (customer_id)
    VALUES (@customer_id);
END

EXEC RegisterAccount 
    @email = 'example@example.com',
    @username = 'example_user',
    @password = 'example_password';

--Login
GO
CREATE PROCEDURE CheckLogin
    @username NVARCHAR(50),
    @password NVARCHAR(50)
AS
BEGIN
    SELECT c.customer_id, c.first_name, c.last_name,
           a.username, r.role_name, a.email, r.role_id
    FROM account a
    INNER JOIN customer c ON a.customer_id = c.customer_id
    INNER JOIN roles r ON a.role_id = r.role_id
    WHERE a.username = @username AND a.password = @password;
END

EXEC CheckLogin @username = 'kle1603', @password = '1';

--Check Duplicate
GO
CREATE PROCEDURE CheckDuplicateUsername
    @username NVARCHAR(50),
    @isDuplicate BIT OUTPUT
AS
BEGIN  
    IF EXISTS (SELECT 1 FROM account WHERE username = @username)
        SET @isDuplicate = 1;
    ELSE
        SET @isDuplicate = 0;
END;

--Check Duplicate
GO
CREATE PROCEDURE CheckDuplicateEmail
    @Email VARCHAR(255),
    @IsDuplicate BIT OUTPUT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM account WHERE email = @Email)
        SET @IsDuplicate = 1;
    ELSE
        SET @IsDuplicate = 0;
END

--Save Google Data
GO
CREATE PROCEDURE SaveGoogleData
    @google_id NVARCHAR(50),
    @email VARCHAR(255),
    @fullname NVARCHAR(100),
    @given_name NVARCHAR(50),
    @family_name NVARCHAR(50),
    @picture NVARCHAR(MAX),
    @is_success BIT OUTPUT
AS
BEGIN
    SET @is_success = 0; -- Khởi tạo giá trị mặc định là false

    -- Kiểm tra nếu google_id đã tồn tại trong bảng "account"
    DECLARE @existing_customer_id INT;
    SELECT @existing_customer_id = customer_id FROM account WHERE google_id = @google_id;

    IF @existing_customer_id IS NULL
    BEGIN
        -- Thêm dữ liệu vào bảng roles nếu chưa tồn tại
        IF NOT EXISTS (SELECT 1 FROM roles WHERE role_id = 'US')
        BEGIN
            INSERT INTO roles (role_id, role_name)
            VALUES ('US', 'User'); -- Vai trò người dùng (user)
        END;

        -- Kiểm tra nếu email đã tồn tại trong bảng "account"
        SELECT @existing_customer_id = customer_id FROM account WHERE email = @email;

        IF @existing_customer_id IS NULL
        BEGIN
            -- Thêm khách hàng mới vào bảng "customer"
            INSERT INTO customer (first_name, last_name, full_name, avatar)
            VALUES (@given_name, @family_name, @fullname, @picture);

            -- Lấy ID khách hàng vừa được thêm
            SET @existing_customer_id = SCOPE_IDENTITY();

            -- Thêm tài khoản mới vào bảng "account" và liên kết với vai trò người dùng (user)
            INSERT INTO account (customer_id, email, username, password, role_id, google_id)
            VALUES (@existing_customer_id, @email, NULL, NULL, 'US', @google_id);

            SET @is_success = 1; -- Cập nhật giá trị true

            -- Tạo giỏ hàng mới cho khách hàng
            INSERT INTO cart (customer_id)
            VALUES (@existing_customer_id);
        END
        ELSE
        BEGIN
            -- Cập nhật thông tin khách hàng từ google_id
            UPDATE customer
            SET first_name = @given_name,
                last_name = @family_name,
                full_name = @fullname,
                avatar = @picture
            WHERE customer_id = @existing_customer_id;

            -- Cập nhật google_id và role_id trong tài khoản
            UPDATE account
            SET google_id = @google_id,
                role_id = 'US'
            WHERE customer_id = @existing_customer_id;

            SET @is_success = 1; -- Cập nhật giá trị true
        END;
    END
    ELSE
    BEGIN
        -- Cập nhật thông tin khách hàng từ google_id
        UPDATE customer
        SET first_name = @given_name,
            last_name = @family_name,
            full_name = @fullname,
            avatar = @picture
        WHERE customer_id = @existing_customer_id;

        SET @is_success = 1; -- Cập nhật giá trị true
    END;
END;
GO


--Lấy thông tin từ google id
GO
CREATE PROCEDURE GetCustomerByGoogleID
    @google_id NVARCHAR(50)
AS
BEGIN
    SELECT c.*, a.username, a.password, a.email, a.role_id, a.facebook_id, a.google_id
    FROM customer c
    JOIN account a ON c.customer_id = a.customer_id
    WHERE a.google_id = @google_id;
END;

EXEC GetCustomerByGoogleID '101471301006291907036';


--Select product
GO
CREATE PROCEDURE GetProductData
AS
BEGIN
    -- Lấy thông tin của sản phẩm từ bảng bread, bread_type và image
    SELECT b.bread_name, bt.bread_type_name, b.description, b.price, b.quantity, i.image_url
    FROM bread AS b
    INNER JOIN bread_type AS bt ON b.bread_type_id = bt.bread_type_id
    INNER JOIN image AS i ON b.bread_id = i.bread_id;
END;


--Phân trang động
GO
CREATE PROCEDURE GetProductList
    @PageNumber INT,
    @PageSize INT,
    @Search NVARCHAR(255) = NULL,
	@TotalProducts INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @SqlQuery NVARCHAR(MAX);

    SET @SqlQuery = N'
    SELECT
        bt.bread_type_id,
        bt.bread_type_name,
        b.bread_id,
        b.bread_name,
        b.description,
        b.price,
		b.quantity,
        i.image_url
    FROM
        bread b
        INNER JOIN bread_type bt ON b.bread_type_id = bt.bread_type_id
        INNER JOIN image i ON b.bread_id = i.bread_id
    WHERE
        i.image_id IN (
            SELECT MIN(image_id)
            FROM image
            GROUP BY bread_id
        )';

    IF @Search IS NOT NULL
    BEGIN
        SET @SqlQuery += N' AND b.bread_name LIKE ''%' + @Search + '%''';
    END;

    SET @SqlQuery += N'
    ORDER BY
        b.bread_id
    OFFSET (@PageNumber - 1) * @PageSize ROWS
    FETCH NEXT @PageSize ROWS ONLY;

	 SELECT @TotalProducts = COUNT(*)
    FROM
    (
        ' + @SqlQuery + N'
    ) AS SubQuery;';

    EXEC sp_executesql @SqlQuery,
        N'@PageNumber INT, @PageSize INT, @TotalProducts INT OUTPUT',
        @PageNumber = @PageNumber,
        @PageSize = @PageSize,
        @TotalProducts = @TotalProducts OUTPUT;
END;


GO
DECLARE @TotalProducts INT;
EXEC GetProductList
    @PageNumber = 1,
    @PageSize = 9,
    @Search = 'w',
    @TotalProducts = @TotalProducts OUTPUT;

SELECT @TotalProducts AS TotalProducts;


--Thêm vào Cart Item và lấy ra dữ liệu phù hợp
DECLARE @customerId INT = 1;
DECLARE @breadId INT = 3;

EXEC AddToCartItem @customerId, @breadId;
EXEC AddToCartItem 1, 2;



--Add to cart
GO
CREATE PROCEDURE AddToCartItem
	@customerId INT,
	@breadId INT
AS
BEGIN
	DECLARE @success BIT = 0; -- Khởi tạo biến địa phương để lưu trạng thái thành công

	DECLARE @breadQuantity INT; -- Biến để lưu trữ số lượng của sản phẩm trong bảng bread

	-- Lấy số lượng của sản phẩm trong bảng bread
	SELECT @breadQuantity = quantity
	FROM bread
	WHERE bread_id = @breadId;

	-- Kiểm tra xem sản phẩm đã tồn tại trong cart_item hay chưa
	IF EXISTS (SELECT 1 FROM cart_item WHERE cart_id = (SELECT cart_id FROM cart WHERE customer_id = @customerId) AND bread_id = @breadId)
	BEGIN
		-- Nếu đã tồn tại, tăng giá trị quantity lên 1 đơn vị nếu chưa vượt quá quantity của sản phẩm
		UPDATE cart_item
		SET quantity = quantity + 1
		WHERE cart_id = (SELECT cart_id FROM cart WHERE customer_id = @customerId) AND bread_id = @breadId
			AND quantity < @breadQuantity;
			
		SET @success = 1; -- Gán giá trị thành công
	END
	ELSE
	BEGIN
		-- Nếu chưa tồn tại và quantity chưa vượt quá quantity của sản phẩm, thêm vào bảng cart_item với giá trị quantity là 1
		IF @breadQuantity > 0
		BEGIN
			INSERT INTO cart_item (cart_id, bread_id, quantity)
			VALUES ((SELECT cart_id FROM cart WHERE customer_id = @customerId), @breadId, 1);
			SET @success = 1; -- Gán giá trị thành công
		END
	END

	RETURN @success; -- Trả về giá trị thành công
END;


EXEC AddToCartItem @customerId = 1, @breadId = 1;

select * from cart_item
select * from cart

DECLARE @result BIT;
EXEC @result = AddToCartItem @customerId = 1, @breadId = 2;
SELECT @result;

--Get cart
GO
CREATE PROCEDURE GetCartItems
    @customerId INT
AS
BEGIN
    SELECT ci.quantity, b.bread_id, b.bread_type_id, b.bread_name, b.description, b.price, b.quantity AS available_quantity, i.image_id, i.image_url
    FROM cart_item ci
    JOIN bread b ON ci.bread_id = b.bread_id
    JOIN image i ON ci.bread_id = i.bread_id
    JOIN cart c ON ci.cart_id = c.cart_id
    WHERE c.customer_id = @customerId;
END;

EXEC GetCartItems @customerId = 1;


--Lấy cart item
GO
CREATE PROCEDURE GetCartItemByCustomerId
    @customer_id INT
AS
BEGIN
    SELECT b.quantity AS available_quantity, ci.bread_id, ci.quantity, b.bread_name, b.price, i.image_url, ci.cart_id
    FROM cart_item ci
    INNER JOIN cart c ON ci.cart_id = c.cart_id
    INNER JOIN customer cust ON c.customer_id = cust.customer_id
    INNER JOIN bread b ON ci.bread_id = b.bread_id
    INNER JOIN image i ON b.bread_id = i.bread_id
    WHERE cust.customer_id = @customer_id;
END;

EXEC GetCartItemByCustomerId @customer_id = 1;


--Thêm order và xóa cart
GO


CREATE PROCEDURE InsertOrderDetailsFromCart
    @customerId INT,
    @totalAmount MONEY
AS
BEGIN
    -- Kiểm tra số lượng trong cart_item có lớn hơn số lượng trong bread không
    IF EXISTS (
        SELECT ci.bread_id
        FROM cart_item ci
        INNER JOIN bread b ON ci.bread_id = b.bread_id
        WHERE ci.quantity > b.quantity
    )
    BEGIN
		return
    END
    ELSE
    BEGIN
        -- Tạo một bản ghi mới trong bảng "order"
        DECLARE @orderId INT
        DECLARE @currentDate DATETIME = GETDATE()
        INSERT INTO [order] (customer_id, order_date, total_amount, status)
        VALUES (@customerId, @currentDate, @totalAmount, 'Pending')
        SET @orderId = SCOPE_IDENTITY()

        -- Chuyển dữ liệu từ bảng cart_item vào bảng order_detail
        INSERT INTO order_detail (order_id, bread_id, quantity)
        SELECT @orderId, ci.bread_id, ci.quantity
        FROM cart_item ci
        INNER JOIN cart c ON ci.cart_id = c.cart_id
        WHERE c.customer_id = @customerId

        -- Cập nhật số lượng trong bảng bread
        UPDATE bread
        SET bread.quantity = bread.quantity - ci.quantity
        FROM bread
        INNER JOIN cart_item ci ON bread.bread_id = ci.bread_id
        INNER JOIN cart c ON ci.cart_id = c.cart_id
        WHERE c.customer_id = @customerId

        -- Xóa dữ liệu từ bảng cart_item
        DELETE FROM cart_item
        WHERE cart_id IN (SELECT cart_id FROM cart WHERE customer_id = @customerId)
    END
END
GO

EXECUTE InsertOrderDetailsFromCart @customerId = 12, @totalAmount = 299.93



--Update dữ liệu order 
CREATE PROCEDURE UpdateOrder
    @customerId INT,
    @orderId INT,
    @firstName NVARCHAR(50),
    @lastName NVARCHAR(50),
    @address NVARCHAR(100),
    @phoneNumber NVARCHAR(20),
    @paymentMethodId INT
AS
BEGIN
    -- Kiểm tra và thêm payment method nếu chưa tồn tại
    IF NOT EXISTS (SELECT * FROM payment_method WHERE payment_method_id = @paymentMethodId)
    BEGIN
        IF @paymentMethodId = 1
        BEGIN
            INSERT INTO payment_method (payment_method_name)
            VALUES ('Banking');
        END
        ELSE IF @paymentMethodId = 2
        BEGIN
            INSERT INTO payment_method (payment_method_name)
            VALUES ('Cash');
        END
    END

    -- Kiểm tra customerId và orderId trong bảng order
    IF EXISTS (SELECT * FROM [order] WHERE order_id = @orderId AND customer_id = @customerId)
    BEGIN
        -- Cập nhật dữ liệu trong bảng order
        UPDATE [order]
        SET
            first_name = @firstName,
            last_name = @lastName,
            address = @address,
            phone_number = @phoneNumber,
            payment_method_id = @paymentMethodId
        WHERE
            order_id = @orderId AND
            customer_id = @customerId;
    END
END

EXEC UpdateOrder
    @customerId = 1,
    @orderId = 6,
    @firstName = 'Khang',
    @lastName = 'Le',
    @address = '66 Nguyen Ngoc Phuong p19 Binh Thanh',
    @phoneNumber = '0934600600',
    @paymentMethodId = 1;



--Xóa product. Trước đó kiểm tra xem có tồn tại ở các bảng khác hay chưa
CREATE PROCEDURE DeleteBreadById
    @breadId INT,
    @isDeleted BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Kiểm tra xem breadId có tồn tại trong bảng bread hay không
    IF (SELECT COUNT(*) FROM bread WHERE bread_id = @breadId) = 0
    BEGIN
        SET @isDeleted = 0; -- Nếu không tồn tại thì không xóa
        RETURN;
    END

    -- Kiểm tra xem breadId có tồn tại trong bảng order_detail hay không
    IF EXISTS (SELECT 1 FROM order_detail WHERE bread_id = @breadId)
    BEGIN
        SET @isDeleted = 0; -- Nếu tồn tại thì không xóa
        RETURN;
    END

    -- Kiểm tra xem breadId có tồn tại trong bảng cart_item hay không
    IF EXISTS (SELECT 1 FROM cart_item WHERE bread_id = @breadId)
    BEGIN
        SET @isDeleted = 0; -- Nếu tồn tại thì không xóa
        RETURN;
    END
    
    -- Xóa dữ liệu trong bảng image
    DELETE FROM image WHERE bread_id = @breadId;

    -- Xóa dữ liệu trong bảng bread
    DELETE FROM bread WHERE bread_id = @breadId;

    SET @isDeleted = 1; -- Đánh dấu xóa thành công
END
GO




DECLARE @isDeleted BIT;

-- Gán giá trị mặc định cho @isDeleted
SET @isDeleted = 0;

-- Gọi stored procedure DeleteBreadById và truyền tham số
EXEC DeleteBreadById 
    @breadId = 16,
    @isDeleted = @isDeleted OUTPUT;

-- In ra kết quả xóa
IF @isDeleted = 1
    PRINT 'Bread with id <breadId_to_delete> has been deleted successfully.';
ELSE
    PRINT 'Failed to delete bread with id <breadId_to_delete>.';

-- In ra giá trị của @isDeleted
PRINT '@isDeleted: ' + CAST(@isDeleted AS NVARCHAR(10));
