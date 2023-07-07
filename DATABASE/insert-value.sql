-- Thêm dữ liệu vào bảng bread_type
INSERT INTO bread_type (bread_type_name)
VALUES ('T-Shirt'), ('Jeans'), ('Dress'), ('Jacket');

-- Thêm dữ liệu vào bảng bread (chủ đề quần áo)
INSERT INTO bread (bread_type_id, bread_name, description, price, quantity)
VALUES
    (1, 'Basic T-Shirt', 'A simple and comfortable t-shirt for everyday wear.', 19.99, 50),
    (2, 'Slim Fit Jeans', 'Stylish and trendy slim fit jeans for a modern look.', 49.99, 30),
    (3, 'Little Black Dress', 'An elegant and versatile dress for special occasions.', 79.99, 20),
    (4, 'Leather Jacket', 'A cool and durable leather jacket for a bold style.', 129.99, 10),
    (1, 'V-Neck T-Shirt', 'A classic V-neck t-shirt for a casual yet stylish look.', 24.99, 40),
    (2, 'Distressed Jeans', 'Fashionable distressed jeans with a worn-in look.', 59.99, 25),
    (3, 'Floral Print Dress', 'A beautiful dress with a floral print pattern.', 89.99, 15),
    (4, 'Bomber Jacket', 'A cool and trendy bomber jacket for a fashionable outfit.', 119.99, 10),
    (1, 'Crew Neck T-Shirt', 'A comfortable crew neck t-shirt for everyday wear.', 19.99, 50),
    (2, 'Skinny Jeans', 'Trendy and form-fitting skinny jeans for a sleek appearance.', 54.99, 35),
    (3, 'Maxi Dress', 'An elegant and long dress for formal occasions.', 99.99, 18),
    (4, 'Denim Jacket', 'A classic denim jacket that never goes out of style.', 89.99, 12),
    (1, 'Striped Polo Shirt', 'A stylish polo shirt with a striped design.', 34.99, 30),
    (2, 'Bootcut Jeans', 'Flattering bootcut jeans for a timeless silhouette.', 64.99, 22),
    (3, 'Sleeveless Dress', 'A chic sleeveless dress for a modern and sophisticated look.', 79.99, 16),
    (4, 'Puffer Jacket', 'A warm and cozy puffer jacket for cold weather.', 99.99, 8),
    (1, 'Graphic T-Shirt', 'A trendy t-shirt with a unique graphic print.', 29.99, 45),
    (2, 'Ripped Jeans', 'Stylish ripped jeans for an edgy and urban look.', 69.99, 28),
    (3, 'Midi Dress', 'A stylish midi dress that is perfect for any occasion.', 69.99, 20),
    (4, 'Parka Jacket', 'A versatile and insulated parka jacket for outdoor adventures.', 149.99, 10),
    (1, 'Polo Shirt', 'A classic and timeless polo shirt for a preppy style.', 39.99, 35),
    (2, 'Flared Jeans', 'Flattering flared jeans for a retro-inspired look.', 59.99, 30),
    (3, 'Lace Dress', 'An elegant lace dress for a feminine and romantic vibe.', 89.99, 15),
    (4, 'Blazer Jacket', 'A sophisticated and tailored blazer jacket for a polished look.', 119.99, 12),
    (1, 'Long Sleeve T-Shirt', 'A comfortable and versatile long sleeve t-shirt.', 24.99, 45),
    (2, 'Straight Leg Jeans', 'Classic straight leg jeans for a timeless appeal.', 49.99, 32),
    (3, 'Wrap Dress', 'A flattering wrap dress that suits all body types.', 79.99, 18),
    (4, 'Peacoat', 'A stylish and warm peacoat for a refined winter look.', 139.99, 10),
    (1, 'Henley Shirt', 'A casual and stylish henley shirt for a laid-back vibe.', 34.99, 28),
    (2, 'High-Waisted Jeans', 'Trendy high-waisted jeans for a flattering silhouette.', 59.99, 26),
    (3, 'Shift Dress', 'A versatile and comfortable shift dress for any occasion.', 69.99, 22),
    (4, 'Faux Fur Jacket', 'A glamorous faux fur jacket for a luxurious and cozy feel.', 129.99, 8),
    (1, 'Button-Up Shirt', 'A classic button-up shirt for a smart and polished look.', 39.99, 30),
    (2, 'Wide-Leg Jeans', 'Fashionable wide-leg jeans for a retro-inspired outfit.', 64.99, 24),
    (3, 'A-Line Dress', 'A timeless A-line dress that flatters any figure.', 79.99, 18),
    (4, 'Biker Jacket', 'A stylish and edgy biker jacket for a rebellious style.', 109.99, 10),
    (1, 'Pullover Hoodie', 'A cozy and casual pullover hoodie for a relaxed look.', 44.99, 35),
    (2, 'Boyfriend Jeans', 'Relaxed and comfortable boyfriend jeans for a laid-back style.', 54.99, 30),
    (3, 'Bodycon Dress', 'A figure-hugging bodycon dress for a sexy and confident look.', 69.99, 20),
    (4, 'Trench Coat', 'A timeless trench coat that adds sophistication to any outfit.', 129.99, 12),
    (1, 'Sweater', 'A warm and cozy sweater for chilly days.', 49.99, 40),
    (2, 'Jeggings', 'Combining the comfort of leggings with the look of jeans.', 39.99, 30),
    (3, 'Off-Shoulder Dress', 'A trendy off-shoulder dress for a flirty and feminine style.', 69.99, 18),
    (4, 'Raincoat', 'A practical and waterproof raincoat for rainy days.', 89.99, 10),
    (1, 'Hooded Sweatshirt', 'A comfortable and versatile hooded sweatshirt.', 44.99, 35),
    (2, 'Cargo Pants', 'Stylish and functional cargo pants for a utilitarian look.', 59.99, 25),
    (3, 'Midi Skirt', 'A versatile midi skirt that can be dressed up or down.', 49.99, 20),
    (4, 'Vest', 'A lightweight and sleeveless vest for layering.', 39.99, 15),
    (1, 'Striped Sweater', 'A stylish sweater with a classic striped pattern.', 54.99, 30),
    (2, 'Capri Pants', 'Comfortable and trendy capri pants for a relaxed summer look.', 44.99, 25),
    (3, 'Wrap Skirt', 'A feminine and flattering wrap skirt for a chic outfit.', 49.99, 20),
    (4, 'Fleece Jacket', 'A cozy and warm fleece jacket for outdoor activities.', 69.99, 15),
    (1, 'Cropped Sweater', 'A trendy cropped sweater for a fashionable and youthful style.', 39.99, 25),
    (2, 'Wide-Leg Pants', 'Fashion-forward wide-leg pants for a statement-making look.', 59.99, 20),
    (3, 'Pleated Skirt', 'A sophisticated pleated skirt for an elegant and polished appearance.', 59.99, 15),
    (4, 'Biker Vest', 'A stylish and edgy biker vest for a rebellious and cool vibe.', 79.99, 10),
    (1, 'Cardigan', 'A versatile and cozy cardigan for layering.', 39.99, 35),
    (2, 'Chino Pants', 'Classic and timeless chino pants for a refined and casual style.', 49.99, 30),
    (3, 'Denim Skirt', 'A versatile denim skirt that can be dressed up or down.', 39.99, 25),
    (4, 'Faux Leather Jacket', 'A fashionable faux leather jacket for an edgy and stylish look.', 99.99, 10),
    (1, 'Cowl Neck Sweater', 'A chic cowl neck sweater for a sophisticated and cozy outfit.', 49.99, 30),
    (2, 'Cropped Pants', 'Stylish and trendy cropped pants for a modern and casual look.', 44.99, 25),
    (3, 'Pencil Skirt', 'A classic and versatile pencil skirt for a polished and professional appearance.', 49.99, 20),
    (4, 'Quilted Jacket', 'A lightweight and quilted jacket for a stylish and comfortable outerwear option.', 89.99, 10),
    (1, 'Turtleneck Sweater', 'A cozy turtleneck sweater for a warm and stylish winter look.', 54.99, 30),
    (2, 'Pleated Pants', 'Elegant and sophisticated pleated pants for a polished and feminine style.', 59.99, 25),
    (3, 'Flared Skirt', 'A flattering flared skirt for a feminine and romantic ensemble.', 49.99, 20),
    (4, 'Hooded Parka', 'A versatile and insulated hooded parka for protection against the elements.', 129.99, 10);

-- Thêm dữ liệu vào bảng image (hình ảnh cho quần áo)
INSERT INTO image (bread_id, image_url)
VALUES
	(1, 'https://picsum.photos/640/640?r=1'),
	(2, 'https://picsum.photos/640/640?r=2'),
	(3, 'https://picsum.photos/640/640?r=3'),
	(4, 'https://picsum.photos/640/640?r=4'),
	(5, 'https://picsum.photos/640/640?r=5'),
	(6, 'https://picsum.photos/640/640?r=6'),
	(7, 'https://picsum.photos/640/640?r=7'),
	(8, 'https://picsum.photos/640/640?r=8'),
	(9, 'https://picsum.photos/640/640?r=9'),
	(10, 'https://picsum.photos/640/640?r=10'),
	(11, 'https://picsum.photos/640/640?r=11'),
	(12, 'https://picsum.photos/640/640?r=12'),
	(13, 'https://picsum.photos/640/640?r=13'),
	(14, 'https://picsum.photos/640/640?r=14'),
	(15, 'https://picsum.photos/640/640?r=15'),
	(16, 'https://picsum.photos/640/640?r=16'),
	(17, 'https://picsum.photos/640/640?r=17'),
	(18, 'https://picsum.photos/640/640?r=18'),
	(19, 'https://picsum.photos/640/640?r=19'),
	(20, 'https://picsum.photos/640/640?r=20'),
	(21, 'https://picsum.photos/640/640?r=21'),
	(22, 'https://picsum.photos/640/640?r=22'),
	(23, 'https://picsum.photos/640/640?r=23'),
	(24, 'https://picsum.photos/640/640?r=24'),
	(25, 'https://picsum.photos/640/640?r=25'),
	(26, 'https://picsum.photos/640/640?r=26'),
	(27, 'https://picsum.photos/640/640?r=27'),
	(28, 'https://picsum.photos/640/640?r=28'),
	(29, 'https://picsum.photos/640/640?r=29'),
	(30, 'https://picsum.photos/640/640?r=30'),
	(31, 'https://picsum.photos/640/640?r=31'),
	(32, 'https://picsum.photos/640/640?r=32'),
	(33, 'https://picsum.photos/640/640?r=33'),
	(34, 'https://picsum.photos/640/640?r=34'),
	(35, 'https://picsum.photos/640/640?r=35'),
	(36, 'https://picsum.photos/640/640?r=36'),
	(37, 'https://picsum.photos/640/640?r=37'),
	(38, 'https://picsum.photos/640/640?r=38'),
	(39, 'https://picsum.photos/640/640?r=39'),
	(40, 'https://picsum.photos/640/640?r=40'),
	(41, 'https://picsum.photos/640/640?r=41'),
	(42, 'https://picsum.photos/640/640?r=42'),
	(43, 'https://picsum.photos/640/640?r=43'),
	(44, 'https://picsum.photos/640/640?r=44'),
	(45, 'https://picsum.photos/640/640?r=45'),
	(46, 'https://picsum.photos/640/640?r=46'),
	(47, 'https://picsum.photos/640/640?r=47'),
	(48, 'https://picsum.photos/640/640?r=48'),
	(49, 'https://picsum.photos/640/640?r=49'),
	(50, 'https://picsum.photos/640/640?r=50'),
	(51, 'https://picsum.photos/640/640?r=51'),
	(52, 'https://picsum.photos/640/640?r=52'),
	(53, 'https://picsum.photos/640/640?r=53'),
	(54, 'https://picsum.photos/640/640?r=54'),
	(55, 'https://picsum.photos/640/640?r=55'),
	(56, 'https://picsum.photos/640/640?r=56'),
	(57, 'https://picsum.photos/640/640?r=57'),
	(58, 'https://picsum.photos/640/640?r=58'),
	(59, 'https://picsum.photos/640/640?r=59'),
	(60, 'https://picsum.photos/640/640?r=60'),
	(61, 'https://picsum.photos/640/640?r=61'),
	(62, 'https://picsum.photos/640/640?r=62'),
	(63, 'https://picsum.photos/640/640?r=63'),
	(64, 'https://picsum.photos/640/640?r=64'),
	(65, 'https://picsum.photos/640/640?r=65'),
	(66, 'https://picsum.photos/640/640?r=66'),
	(67, 'https://picsum.photos/640/640?r=67'),
	(68, 'https://picsum.photos/640/640?r=68'),
	(69, 'https://picsum.photos/640/640?r=69'),
	(70, 'https://picsum.photos/640/640?r=70'),
	(71, 'https://picsum.photos/640/640?r=71'),
	(72, 'https://picsum.photos/640/640?r=72'),
	(73, 'https://picsum.photos/640/640?r=73'),
	(74, 'https://picsum.photos/640/640?r=74'),
	(75, 'https://picsum.photos/640/640?r=75'),
	(76, 'https://picsum.photos/640/640?r=76'),
	(77, 'https://picsum.photos/640/640?r=77'),
	(78, 'https://picsum.photos/640/640?r=78'),
	(79, 'https://picsum.photos/640/640?r=79'),
	(80, 'https://picsum.photos/640/640?r=80')

-- Thêm dữ liệu vào bảng customer
INSERT INTO customer (first_name, last_name, address, phone_number, full_name, avatar)
VALUES
    ('John', 'Doe', '123 Main St, City', '1234567890', 'John Doe', 'https://example.com/avatars/john.jpg'),
    ('Jane', 'Smith', '456 Elm St, City', '9876543210', 'Jane Smith', 'https://example.com/avatars/jane.jpg');

-- Thêm dữ liệu vào bảng payment_method
INSERT INTO payment_method (payment_method_name)
VALUES
    ('Credit Card'),
    ('PayPal');

-- Thêm dữ liệu vào bảng "order"
INSERT INTO "order" (customer_id, payment_method_id, order_date, total_amount, status)
VALUES
    (1, 1, '2023-06-24 10:00:00', 15.99, 'Pending'),
    (2, 2, '2023-06-25 14:30:00', 12.49, 'Completed');

-- Thêm dữ liệu vào bảng order_detail
INSERT INTO order_detail (order_id, bread_id, quantity)
VALUES
    (1, 1, 2),
    (1, 3, 1),
    (2, 2, 1),
    (2, 5, 3);

-- Thêm dữ liệu vào bảng roles
INSERT INTO roles (role_id, role_name)
VALUES
    ('AD', 'Admin'),
    ('US', 'User');

-- Thêm dữ liệu vào bảng account
INSERT INTO account (customer_id, username, password, email, role_id)
VALUES
    (1, 'johndoe', 'password', 'johndoe@example.com', 'US'),
    (2, 'janesmith', 'password', 'janesmith@example.com', 'US');
