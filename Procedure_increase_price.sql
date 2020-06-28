CREATE DEFINER=`root`@`localhost` PROCEDURE `increase_price`(IN product_name VARCHAR(70), percentage DECIMAL)
BEGIN
	UPDATE products
	SET buyPrice = buyPrice * (1 + percentage)
	WHERE productName = product_name;
    

END