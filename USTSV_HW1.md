https://www.richardtwatson.com/dm6e/Reader/ClassicModels.html
# SQL queries
ClassicModels is a fictitious company. Use the ClassicModels database to answer the following requests (SQL to create the database). Your instructor has the answers to all queries.
The latitude and longitude are specified for office and customer locations in the Offices and Customers tables, respectively. The SRID is set to 4326 to indicate the Spacial Reference System (SRS) is geographic (see Chapter 11 for more details on SRID and SRS).
You can access ClassicModels at richardtwatson.com with accountid=db1 and password=student.


<!-- /MarkdownTOC -->
- [Single entity](#Single-entity)
  - [1 Prepare a list of offices sorted by country, state, city](#Prepare-a-list-of-offices-sorted-by-country-state-city)
  - [2 How many employees are there in the company?](#How-many-employees-are-there-in-the-company)
  - [3 What is the total of payments received?](#What-is-the-total-of-payments-received)
  - [4 List the product lines that contain 'Cars'](#List-the-product-lines-that-contain-Cars)
  - [5 Report total payments for October 28, 2004](#Report-total-payments-for-October-28-2004)
  - [6 Report those payments greater than $100,000](#Report-those-payments-greater-than-100000-dollar)
  - [7 List the products in each product line](#List-the-products-in-each-product-line)
  - [8 How many products in each product line?](#How-many-products-in-each-product-line)
  - [9 What is the minimum payment received?](#What-is-the-minimum-payment-received)
  - [10 List all payments greater than twice the average payment](#List-all-payments-greater-than-twice-the-average-payment)
  - [11 What is the average percentage markup of the MSRP on buyPrice?](#What-is-the-average-percentage-markup-of-the-MSRP-on-buyPrice)
  - [12 How many distinct products does ClassicModels sell?](#How-many-distinct-products-does-ClassicModels-sell)
  - [13 Report the name and city of customers who don't have sales representatives?](#Report-the-name-and-city-of-customers-who-do-not-have-sales-representatives)
  - [14 What are the names of executives with VP or Manager in their title?](#What-are-the-names-of-executives-with-VP-or-Manager-in-their-title)
  - [15 Which orders have a value greater than $5,000?](#Which-orders-have-a-value-greater-than-5000)
  
- [One to many relationship](#One-to-many-relationship)
  - [1 Report the account representative for each customer](#Report-the-account-representative-for-each-customer)
  - [2 Report total payments for Atelier graphique](#Report-total-payments-for-Atelier-graphique)
  - [3 Report the total payments by date](#Report-the-total-payments-by-date)
  - [4 Report the products that have not been sold](#Report-the-products-that-have-not-been-sold)
  - [5 List the amount paid by each customer](#List-the-amount-paid-by-each-customer)
  - [6 How many orders have been placed by Herkku Gifts?](#How-many-orders-have-been-placed-by-Herkku-Gifts)
  - [7 Who are the employees in Boston?](#Who-are-the-employees-in-Boston)
  - [8 Report those payments greater than $100,000](#Report-those-payments-greater-than-100000-dollar)
  - [9 List the value of 'On Hold' orders](#List-the-value-of-On-Hold-orders)
  - [10 Report the number of orders 'On Hold' for each customer](#Report-the-number-of-orders-On-Hold-for-each-customer)

- [Many to many relationship](#Many-to-many-relationship)
  - [1 List products sold by order date](#List-products-sold-by-order-date)
  - [2 List the order dates in descending order for orders for the 1940 Ford Pickup Truck](#List-the-order-dates-in-descending-order-for-orders-for-the-1940-Ford-Pickup-Truck)
  - [3 List the names of customers and their corresponding order number where a particular order from that customer has a value greater than $25,000?](#List-the-names-of-customers-and-their-corresponding-order-number-where-a-particular-order-from-that-customer-has-a-value-greater-than-25000-dollar)
  - [4 Are there any products that appear on all orders?](#Are-there-any-products-that-appear-on-all-orders)
  - [5 List the names of products sold at less than 80% of the MSRP](#List-the-names-of-products-sold-at-less-than-eighty-percent-of-the-MSRP)
  - [6 Reports those products that have been sold with a markup of 100% or more](#Reports-those-products-that-have-been-sold-with-a-markup-of-1-or-more)
  - [7 List the products ordered on a Monday](#List-the-products-ordered-on-a-Monday)
  - [8 What is the quantity on hand for products listed on 'On Hold' orders?](#What-is-the-quantity-on-hand-for-products-listed-on-On-Hold-orders)
- [Regular expressions](#Regular-expressions)
  - [1 Find products containing the name 'Ford'](#Find-products-containing-the-name-Ford)
  - [2 List products ending in 'ship'](#List-products-ending-in-ship)
  - [3 Report the number of customers in Denmark, Norway, and Sweden](#Report-the-number-of-customers-in-Denmark-Norway-and-Sweden)
  - [4 What are the products with a product code in the range S700_1000 to S700_1499?](#What-are-the-products-with-a-product-code-in-the-range-S700-1000-to-S700-1499)
  - [5 Which customers have a digit in their name?](#Which-customers-have-a-digit-in-their-name)
  - [6 List the names of employees called Dianne or Diane](#List-the-names-of-employees-called-Dianne-or-Diane)
  - [7 List the products containing ship or boat in their product name](#List-the-products-containing-ship-or-boat-in-their-product-name)
  - [8 List the products with a product code beginning with S700](#List-the-products-with-a-produc-code-beginning-with-S700)
  - [9 List the names of employees called Larry or Barry](#List-the-names-of-employees-called-Larry-or-Barry)
  - [10 List the names of employees with non-alphabetic characters in their names](#List-the-names-of-employees-with-non-alphabetic-characters-in-their-names)
  - [11 List the vendors whose name ends in Diecast](#List-the-vendors-whose-name-ends-in-Diecast)
- [General queries](#General-queries)
  - [1 Who is at the top of the organization](#Who-is-at-the-top-of-the-organization)
  - [2 Who reports to William Patterson?](#Who-reports-to-William-Patterson)
  - [3 List all the products purchased by Herkku Gifts](#List-all-the-products-purchased-by-Herkku-Gifts)
  - [4 Compute the commission for each sales representative, assuming the commission is 5% of the value of an order](#Compute-the-commission-for-each-sales-representative)
  - [5 What is the difference in days between the most recent and oldest order date in the Orders file?](#What-is-the-difference-in-days-between-the-most-recent-and-oldest-order-date-in-the-Orders-file)
  - [6 Compute the average time between order date and ship date for each customer ordered by the largest difference](#Compute-the-average-time-between-order-date-and-ship-date-for-each-customer-ordered-by-the-largest-difference)
  - [7 What is the value of orders shipped in August 2004?](#What-is-the-value-of-orders-shipped-in-August-2004)
  - [8 Compute the total value ordered, total amount paid, and their difference for each customer for orders placed in 2004 and payments received in 2004](#Compute-the-total-value-ordered-total-amount-paid-and-their-difference-for-each-customer-for-orders-placed-in-2004-and-payments-received-in-2004)
  - [9 List the employees who report to those employees who report to Diane Murphy](#List-the-employees-who-report-to-those-employees-who-report-to-Diane-Murphy)
  - [10 What is the percentage value of each product in inventory sorted by the highest percentage first](#What-is-the-percentage-value-of-each-product-in-inventory-sorted-by-the-highest-percentage-first)
  - [11 Write a function to convert miles per gallon to liters per 100 kilometers](#Write-a-function-to-convert-miles-per-gallon-to-liters-per-100-kilometers)
  - [12 Write a procedure to increase the price of a specified product category by a given percentage](#Write-a-procedure-to-increase-the-price-of-a-specified-product-category-by-a-given-percentage)
  - [13 What is the value of orders shipped in August 2004](#What-is-the-value-of-orders-shipped-in-August-2004)
  - [14 What is the ratio the value of payments made to orders received for each month of 2004](#What-is-the-ratio-the-value-of-payments-made-to-orders-received-for-each-month-of-2004)
  - [15 What is the difference in the amount received for each month of 2004 compared to 2003?](#What-is-the-difference-in-the-amount-received-for-each-month-of-2004-compared-to-2003)
  - [16 Write a procedure to report the amount ordered in a specific month and year for customers containing a specified character string in their name](#Write-a-procedure-to-report-the-amount-ordered-in-a-specific-month-and-year-for-customers-containing-a-specified-character-string-in-their-name)
  - [17 Write a procedure to change the credit limit of all customers in a specified country by a specified percentage](Write-a-procedure-to-change-the-credit-limit-of-all-customers-in-a-specified-country-by-a-specified-percentage)
  - [18 Report the names of products that appear in the same order ten or more times](#Report-the-names-of-products-that-appear-in-the-same-order-ten-or-more-times)
  - [19 Compute the revenue generated by each customer based on their orders](#Compute-the-revenue-generated-by-each-customer-based-on-their-orders)
  - [20 Compute the profit generated by each customer based on their orders](#Compute-the-profit-generated-by-each-customer-based-on-their-orders)
  - [21 Compute the revenue generated by each sales representative based on the orders from the customers they serve](#Compute-the-revenue-generated-by-each-sales-representative-based-on-the-orders-from-the-customers-they-serve)
  - [22 Compute the profit generated by each sales representative based on the orders from the customers they serve](#Compute-the-profit-generated-by-each-sales-representative-based-on-the-orders-from-the-customers-they-serve)
  - [23 Compute the revenue generated by each product, sorted by product name](#Compute-the-revenue-generated-by-each-product)
  - [24 Compute the profit generated by each product line, sorted by profit descending](#Compute-the-profit-generated-by-each-product-line)
  - [25 Compute the ratio for each product of sales for 2003 versus 2004](#Compute-the-ratio-for-each-product-of-sales-for-2003-versus-2004)
  - [26 Compute the ratio of payments for each customer for 2003 versus 2004](#Compute-the-ratio-of-payments-for-each-customer-for-2003-versus-2004)
  - [27 Find the products sold in 2003 but not 2004](#Find-the-products-sold-in-2003-but-not-2004)
  - [28 Find the customers without payments in 2003](#Find-the-customers-without-payments-in-2003)


<!-- /MarkdownTOC -->
## Single entity

#### Prepare a list of offices sorted by country state city

```sql
SELECT DISTINCT officeCode
FROM classicmodels.offices
ORDER BY country, state, city;

```

#### How many employees are there in the company

```sql
SELECT COUNT(DISTINCT employeeNumber) as employee_num
FROM employees;
```

#### What is the total of payments received

```sql
SELECT ROUND(SUM(amount),2) as total_payment
FROM payments;
```
#### List the product lines that contain Cars

```sql
SELECT * FROM productlines
WHERE productline like '%Car%';
```
#### Report total payments for October 28 2004
```sql
SELECT SUM(amount) as total_payment 
FROM payments WHERE paymentDate = '2004-10-28';
```

#### Report those payments greater than 100000 dollar
```sql
SELECT * 
FROM payments WHERE amount > 100000;
```

#### List the products in each product line

```sql
SELECT DISTINCT productName, productLine
FROM products 
ORDER BY productLine;
```

#### How many products in each product line?
```sql
SELECT count(DISTINCT productName) as num_prod, productLine
FROM products 
GROUP BY productLine
ORDER BY productLine;
```

#### What is the minimum payment received

```sql
SELECT min(amount) as min_pay
FROM payments;
```
#### List all payments greater than twice the average payment

```sql
SELECT * FROM payments 
WHERE amount > 2* (SELECT AVG(amount) as avg_amount
FROM payments);
```
#### What is the average percentage markup of the MSRP on buyPrice
```sql
SELECT CONCAT(round(AVG(MSRP/buyPrice),2) * 100 , '%') AS avg_MSRP_on_buyPrice FROM products
```

#### How many distinct products does ClassicModels sell
```sql
SELECT COUNT(DISTINCT productCode ) AS Unique_prod FROM products;
```

#### Report the name and city of customers who do not have sales representatives
```sql
SELECT customerName, city
FROM customers 
WHERE salesRepEmployeeNumber is NULL;
```
#### What are the names of executives with VP or Manager in their title
```sql
SELECT concat(firstName, ' ', lastName)as Name, jobTitle 
FROM employees 
WHERE jobTitle LIKE '%VP%' or jobTitle LIKE '%Manager%';
```
#### Which orders have a value greater than 5000
```sql
SELECT orderNumber 
From orderdetails 
WHERE priceEach * quantityOrdered > 5000;
```
## One to many relationship
#### Report the account representative for each customer
```sql
SELECT customerName, Employees.firstName as representative
FROM customers JOIN employees on 
Customers.salesRepEmployeeNumber = employeeNumber;
```
#### Report total payments for Atelier graphique
```sql 
SELECT sum(amount) AS total_pay FROM 
payments, customers
WHERE customers.customerName = 'Atelier graphique'
AND payments.customerNumber = customers.customerNumber;
```
#### Report the total payments by date
```sql
SELECT ROUND(sum(amount),2) AS Daily_amount 
FROM payments
GROUP BY paymentDate;
```

#### Report the products that have not been sold
```sql 
SELECT * FROM 
products WHERE products.productCode 
NOT IN (SELECT productCode 
FROM orderdetails);
```
#### List the amount paid by each customer
```sql
SELECT ROUND(SUM(amount),2) AS amount, customerName
FROM customers JOIN payments
ON customers.customerNumber = payments.customerNumber
GROUP BY customers.customerNumber;
```
#### How many orders have been placed by Herkku Gifts
```sql
SELECT COUNT(DISTINCT o.orderNumber) as Order_num
FROM orders o JOIN customers c
ON c.customerNumber = o.customerNumber AND c.customerName = 'Herkku Gifts';
```

#### Who are the employees in Boston
```sql
SELECT Concat(firstName, lastName) AS name
FROM employees e, offices o
WHERE e.officeCode = o.officeCode
AND o.city = 'Boston';
```
#### Report those payments greater than 100000 dollar

```sql
SELECT DISTINCT p.checkNumber, p.paymentDate, p.amount, p.customerNumber, c.customerName
FROM payments p, orders o, customers c
WHERE p.customerNumber = o.customerNumber and p.customerNumber = c.customerNumber
AND p.amount > 100000 
ORDER BY amount;
```
#### List the value of On Hold orders
```sql
SELECT ROUND(SUM(od.quantityOrdered * od.priceEach),2) as Val, od.orderNumber
FROM orderdetails od, orders o
WHERE od.orderNumber = o.orderNumber AND o.status = 'On Hold'
GROUP BY od.orderNumber
ORDER BY od.orderNumber;
```
#### Report the number of orders On Hold for each customer
```sql
SELECT COUNT(DISTINCT orderNumber) as CNT, c.customerName
FROM orders o RIGHT JOIN customers c
ON c.customerNumber = o.customerNumber AND o.status = 'On Hold'
GROUP BY c.customerNumber
ORDER BY COUNT(DISTINCT orderNumber) DESC;
```
## Many to many relationship
#### List products sold by order date
```sql
FROM orderdetails od, orders o, products p
WHERE p.productCode = od.productCode AND od.orderNumber = o.orderNumber
GROUP BY 1, 2, 3
ORDER BY o.orderDate
```
#### List the order dates in descending order for orders for the 1940 Ford Pickup Truck
```sql
SELECT orderDate
FROM orderdetails od, orders o, products p
WHERE p.productCode = od.productCode AND od.orderNumber = o.orderNumber
AND productName = '1940 Ford Pickup Truck'
ORDER BY orderDate DESC;
```
#### List the names of customers and their corresponding order number where a particular order from that customer has a value greater than 25000 dollar
```sql
 
SELECT DISTINCT customerName, o.orderNumber 
FROM orderdetails od, orders o, customers c
WHERE c.customerNumber = o.customerNumber AND od.orderNumber = o.orderNumber
AND od.quantityOrdered * od.priceEach
```
#### Are there any products that appear on all orders
```sql
SELECT customerName, o.orderNumber , ROUND(SUM(od.quantityOrdered * od.priceEach ), 2) AS VAL
FROM orderdetails od, orders o, customers c
WHERE c.customerNumber = o.customerNumber AND od.orderNumber = o.orderNumber
GROUP BY o.orderNumber HAVING VAL > 25000
```
#### List the names of products sold at less than eighty percent of the MSRP
```sql
SELECT  DISTINCT p.productName, p.productCode
FROM orderdetails od, products p
WHERE od.productCode = p.productCode
and od.priceEach/p.MSRP < 0.8;
```
#### Reports those products that have been sold with a markup of 1 or more
```sql
SELECT  DISTINCT p.productName, p.productCode
FROM orderdetails od, products p
WHERE od.productCode = p.productCode
and od.priceEach > 2 *P.buyPrice;
```
#### List the products ordered on a Monday
```sql
SELECT  DISTINCT p.productName, p.productCode
FROM orderdetails od, products p, orders o
WHERE od.productCode = p.productCode AND od.orderNumber = o.orderNumber
AND WEEK(o.orderDate) = 0;
```
#### What is the quantity on hand for products listed on On Hold orders
```sql
SELECT p.quantityInStock as stock, p.productName
FROM orderdetails od, products p, orders o
WHERE od.productCode = p.productCode
AND od.orderNumber = o.orderNumber
AND o.status = 'On Hold';
```
### Regular expressions

#### Find products containing the name Ford
```sql
SELECT * FROM products
WHERE productName LIKE '%Ford%';
```
#### List products ending in ship
```sql
SELECT * FROM products
WHERE productName LIKE '%ship';
```
#### Report the number of customers in Denmark Norway and Sweden
```sql
SELECT COUNT(DISTINCT customerNumber) as customer_num
FROM customers c 
WHERE c.country = 'Sweden' or c.country = 'Denmark Norway';
```
#### What are the products with a product code in the range S700 1000 to S700 1499
```sql
SELECT p.productCode, p.productName FROM 
productS p,
(SELECT productCode, 
SUBSTRING(productCode, 
LOCATE('S', productCode) + 1, LOCATE('_', productCode) - LOCATE('S', productCode)) AS Num1,
SUBSTRING(productCode, 
LOCATE( '_', productCode) + 1, LENGTH(productCode) - LOCATE( '_', productCode) ) 
as Num2 FROM products) AS p2
WHERE p.productCode = p2.productCode and p2.Num2 BETWEEN 1000 AND 1499 AND p2.Num1 = 700;
```
#### Which customers have a digit in their name
```sql
SELECT * FROM 
customers
WHERE customerName REGEXP '[0-9]';
```
#### List the names of employees called Dianne or Diane
```sql
SELECT * 
FROM employees
WHERE firstName = 'Dianne' or firstName = 'Diane'
	or lastName = 'Dianne' or lastName = 'Diane';
```
#### List the products containing ship or boat in their product name
```sql
SELECT * 
FROM products
WHERE productName LIKE '%ship%' or productName LIKE '%boat%';
```
#### List the products with a product code beginning with S700
```sql
SELECT * 
FROM products
WHERE productCode LIKE 'S700%' ;
```
#### List the names of employees called Larry or Barry
```sql
SELECT * 
FROM employees
WHERE firstName = 'Larry' or firstName = 'Barry'
	or lastName = 'Larry' or lastName = 'Barry';
```
#### List the names of employees with non alphabetic characters in their names
```sql
SELECT CONCAT(firstName, ' ', lastName) as Name 
FROM employees
WHERE firstName NOT LIKE '%[^a-z]%'
AND lastName NOT LIKE '%[^a-z]%';
```
#### List the vendors whose name ends in Diecast
```sql
SELECT DISTINCT productVendor
FROM products 
WHERE productVendor LIKE '%Diecast';
```
## General queries
#### Who is at the top of the organization 
```sql
SELECT e1.employeeNumber, e1.lastName, e1.firstName
FROM employees e1 WHERE e1.reportsTo IS NULL;
```

#### Who reports to William Patterson
```sql
SELECT e1.employeeNumber, e1.lastName, e1.firstName
FROM employees e1, employees e2
WHERE e1.reportsTo= e2.employeeNumber
AND e2.firstName = 'William' AND e2.lastName = 'Patterson';
```
#### List all the products purchased by Herkku Gifts
```sql
SELECT p.productCode, p.productName
FROM products p,  orders o, customers c, orderdetails od
WHERE o.customerNumber = c.customerNumber AND o.orderNumber = od.orderNumber 
AND od.productCode = p.productCode AND c.customerName = 'Herkku Gifts';
```
#### Compute the commission for each sales representative
Assuming the commission is 5% of the value of an order. Sort by employee last name and first name
```sql
SELECT ROUND(SUM(quantityOrdered * priceEach)*0.05,2) as commission,
e.firstName, e.lastName From customers c, employees e,
orderdetails od, orders o WHERE o.orderNumber = od.orderNumber
AND e.employeeNumber = c.salesRepEmployeeNumber AND c.customerNumber= o.customerNumber
GROUP BY  e.firstName, e.lastName 
ORDER BY e.lastName, e.firstName;
```
#### what is the difference in days between the most recent and oldest order date in the Orders file
```sql 
SELECT DAY(MAX(orderDate) - MIN(orderDate)) AS day_diff
FROM orders;
```
#### Compute the average time between order date and ship date for each customer ordered by the largest difference
```sql
SELECT ROUND(AVG(DAY(shippedDate - orderDate)),0) AS day_diff, c.contactFirstName, c.contactLastName
FROM orders o, customers c, orderdetails od
WHERE o.orderNumber = od.orderNumber AND c.customerNumber = o.customerNumber
GROUP BY c.customerNumber
ORDER BY AVG(DAY(shippedDate - orderDate)) DESC;
```
#### What is the value of orders shipped in August 2004
```sql
SELECT ROUND(SUM(od.quantityOrdered * od.priceEach), 2) AS Val
FROM orderdetails od, orders o
WHERE od.orderNumber = o.orderNumber AND o.shippedDate BETWEEN '2004-08-01' AND '2004-08-31';
```
#### Compute the total value ordered total amount paid and their difference for each customer for orders placed in 2004 and payments received in 2004 
 Hint; Create views for the total paid and total ordered).
```sql
DROP VIEW IF EXISTS total_order;
CREATE VIEW total_order AS
SELECT SUM(od.quantityOrdered * od.priceEach) AS order_val, c.customerNumber
FROM orderdetails od, orders o, customers c, payments p
WHERE od.orderNumber = o.orderNumber AND c.customerNumber = o.customerNumber
AND YEAR(o.orderDate) = 2004
GROUP BY c.customerNumber;

DROP VIEW IF EXISTS total_pay;
CREATE VIEW total_pay AS
SELECT SUM(amount) AS pay_amount, p.customerNumber
FROM payments p 
WHERE YEAR(p.paymentDate) = 2004
GROUP BY customerNumber;

SELECT order_val - pay_amount AS diff, tp.customerNumber
FROM total_pay tp, total_order td
WHERE tp.customerNumber = tp.customerNumber
GROUP BY tp.customerNumber
```
#### List the employees who report to those employees who report to Diane Murphy
Use the CONCAT function to combine the employee's first name and last name into a single field for reporting
```sql
SELECT CONCAT(e1.firstName, ' ', e1.lastName) AS employee_Name
FROM employees e1, employees e2, employees e3
WHERE e1.reportsTo = e2.employeeNumber
AND e2.reportsTo = e3.employeeNumber
AND e3.firstName =  'Diane' AND e3.lastName = 'Murphy';
```
#### What is the percentage value of each product in inventory sorted by the highest percentage first
```sql
SELECT CONCAT(p1.quantityInStock / t1.invt* 100, '%') AS invt_percent, p1.productCode  
FROM products p1,
(SELECT SUM(quantityInstock) AS invt
FROM products) AS t1
ORDER BY p1.quantityInStock / t1.invt DESC;
```

#### Write a function to convert miles per gallon to liters per 100 kilometers
```sql
CREATE FUNCTION `Convert_mg_to_kl` (mg INT)
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE kl INT;
SET kl = 0;
SET kl = mg / 3.78541 * 1.60934 / 100;
RETURN kl;
END

```
#### Write a procedure to increase the price of a specified product category by a given percentage. 
You will need to create a product table with appropriate data to test your procedure. Alternatively, load the ClassicModels database on your personal machine so you have complete access. You have to change the DELIMITER prior to creating the procedure.
```sql
CREATE DEFINER=`root`@`localhost` PROCEDURE `increase_price`(IN product_name VARCHAR(70), percentage DECIMAL)
BEGIN
	UPDATE products
	SET buyPrice = buyPrice * (1 + percentage)
	WHERE productName = product_name;
END
```
#### What is the value of orders shipped in August 2004
```sql

SELECT ROUND(SUM(quantityOrdered * priceEach),2) AS od_shipped FROM(
SELECT YEAR(o.shippedDate) AS YR, od.quantityOrdered, od.priceEach
FROM orderdetails od, orders o
WHERE od.orderNumber = o.orderNumber) AS TB1
WHERE YR = 2004;
```
#### What is the ratio the value of payments made to orders received for each month of 2004
(i.e., divide the value of payments made by the orders received)
```sql
```
#### What is the difference in the amount received for each month of 2004 compared to 2003
```sql
```
#### Write a procedure to report the amount ordered in a specific month and year for customers containing a specified character string in their name
```sql
```
#### Write a procedure to change the credit limit of all customers in a specified country by a specified percentage
```sql
```
#### Report the names of products that appear in the same order ten or more times
Basket of goods analysis: A common retail analytics task is to analyze each basket or order to learn what products are often purchased together
```sql
```
#### Compute the revenue generated by each customer based on their orders
Also, show each customer's revenue as a percentage of total revenue. Sort by customer name.
```sql
```
#### Compute the profit generated by each customer based on their orders
Also, show each customer's profit as a percentage of total profit. Sort by profit descending.
```sql
```

#### Compute the revenue generated by each sales representative based on the orders from the customers they serve
```sql
```

#### Compute the profit generated by each sales representative based on the orders from the customers they serve
Sort by profit generated descending
```sql 
```
#### Compute the revenue generated by each product
Sorted by product name
```sql
```
#### Compute the profit generated by each product line 
Sorted by profit descending
```sql
```
#### Compute the ratio for each product of sales for 2003 versus 2004
```sql
```
#### Compute the ratio of payments for each customer for 2003 versus 2004
```sql
```
#### Find the products sold in 2003 but not 2004
```sql
```
#### Find the customers without payments in 2003
```sql
```
  
