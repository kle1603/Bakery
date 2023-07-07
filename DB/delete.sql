select * from account
select * from customer
select * from cart
select * from cart_item
select * from roles
select * from bread_type
select * from cart
select * from bread
select * from cart
select * from cart_item
select * from [order]
select * from [order_detail]
select * from payment_method
select * from [image]

delete account
delete customer
delete cart
delete [order]
delete payment_method
delete order_detail
delete bread
delete bread_type
delete [image]
delete [order]
delete [order_detail]

DBCC CHECKIDENT ('account', RESEED, 0)
DBCC CHECKIDENT ('customer', RESEED, 0)
DBCC CHECKIDENT ('cart', RESEED, 0)
DBCC CHECKIDENT ('order', RESEED, 0)
DBCC CHECKIDENT ('bread_type', RESEED, 0)
DBCC CHECKIDENT ('bread', RESEED, 0)
DBCC CHECKIDENT ('image', RESEED, 0)
DBCC CHECKIDENT ('payment_method', RESEED, 0)
DBCC CHECKIDENT ('[order]', RESEED, 0)
DBCC CHECKIDENT ('[order_detail]', RESEED, 0)

DELETE FROM cart_item
WHERE bread_id = 1 AND cart_id = 1;

UPDATE cart_item SET quantity = 6 WHERE cart_id = 1 AND bread_id = 52;

SELECT order_id FROM [order] WHERE total_amount = 439.93 AND customer_id = 1;

SELECT order_id, order_date, total_amount FROM [order] WHERE customer_id = 1;

SELECT o.order_id, o.order_date, o.total_amount, SUM(dt.quantity) AS total_products FROM [order] AS o JOIN order_detail AS dt ON o.order_id = dt.order_id WHERE o.customer_id = 1 GROUP BY o.order_id, o.order_date, o.total_amount;


