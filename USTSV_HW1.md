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
- [Correlated subqueries](#Correlated-subqueries)
  - [1 Who reports to Mary Patterson](#Who-reports-to-Mary-Patterson)
  - [2 Which payments in any month and year are more than twice the average for that month and year](#Which-payments-in-any-month-and-year-are-more-than-twice-the-average-for-that-month-and-year)
  - [3 The percentage value of each product stock on hand as a percentage of the stock on hand for product line to which it belongs](#The-percentage-value-of-each-product-stock-on-hand-as-a-percentage-of-the-stock-on-hand-for-product-line-to-which-it-belongs)
  - [4 For orders containing more than two products, report those products that constitute more than 50% of the value of the order](#For-orders-containing-more-than-two-products-and-report-those-products-that-constitute-more-than-50-percent-of-the-value-of-the-order)
- [Spatial data](#Spatial-data)
  - [1 Which customers are in the Southern Hemisphere](#Which-customers-are-in-the-Southern-Hemisphere)
  - [2 Which US customers are south west of the New York office](#Which-US-customers-are-south-west-of-the-New-York-office)
  - [3 Which customers are closest to the Tokyo office](#Which-customers-are-closest-to-the-Tokyo-office)
  - [4 Which French customer is furthest from the Paris office](#Which-French-customer-is-furthest-from-the-Paris-office)
  - [5 Who is the northernmost customer](#Who-is-the-northernmost-customer)
  - [6 What is the distance between the Paris and Boston offices](#What-is-the-distance-between-the-Paris-and-Boston-offices)

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
ORDER BY CNT DESC;
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
ORDER BY day_diff DESC;
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
SELECT ROUND(SUM(p.amount)/SUM(od.quantityOrdered * od.priceEach), 2)AS Ratio,   Month(o.orderDate) AS Month 
FROM orderdetails od, orders o, payments p
WHERE YEAR(o.orderDate) = 2004 AND YEAR(p.paymentDate) = 2004
AND MONTH(o.orderDate) = MONTH(p.paymentDate) AND o.customerNumber = p.customerNumber
AND od.orderNumber = o.orderNumber
GROUP BY MONTH(o.orderDate)
ORDER BY Month;
```
#### What is the difference in the amount received for each month of 2004 compared to 2003
```sql
SELECT ROUND(SUM(od1.quantityOrdered * od1.priceEach) - SUM(od2.quantityOrdered * od2.priceEach), 2) AS diff,   Month(o1.orderDate) AS Month 
FROM orderdetails od1, orders o1, orderdetails od2, orders o2
WHERE YEAR(o1.orderDate) = 2004 AND YEAR(o2.orderDate) = 2003
AND MONTH(o1.orderDate) = MONTH(o2.orderDate) 
AND od1.orderNumber = o1.orderNumber AND od2.orderNumber = o2.orderNumber
GROUP BY MONTH(o1.orderDate)
ORDER BY Month;
```
#### Write a procedure to report the amount ordered in a specific month and year for customers containing a specified character string in their name
```sql
CREATE DEFINER=`root`@`localhost` PROCEDURE `order_report_procedure`(IN NM VARCHAR(70), M INT, Y INT)
BEGIN
	SELECT ROUND(SUM(od.quantityOrdered * priceEach), 2) AS od_Amt , customerName, Y AS od_Year, M AS od_Month
    FROM orderdetails od, orders o, customers c
    WHERE od.orderNumber = o.orderNumber AND o.customerNumber = c.customerNumber
    AND LOCATE(NM, c.customerName) != 0  AND YEAR(o.orderDate) = Y AND MONTH(o.orderDate) = M
    GROUP BY c.customerNumber;

END
CALL order_report_procedure('o', 1, 2003);
```
#### Write a procedure to change the credit limit of all customers in a specified country by a specified percentage
```sql
CREATE DEFINER=`root`@`localhost` PROCEDURE `credit_limit_procedure`(percentage DECIMAL, cty VARCHAR(50))
BEGIN
	UPDATE customers
    SET creditLimit = creditLimit * (1 + percentage)
    WHERE country = cty;
END
```
#### Report the names of products that appear in the same order ten or more times
Basket of goods analysis: A common retail analytics task is to analyze each basket or order to learn what products are often purchased together
```sql
SELECT DISTINCT productName FROM(
SELECT DISTINCT pd.productName, od1.productCode, od1.orderNumber, COUNT( od1.productCode) as prod_count 
FROM orderdetails od1
INNER JOIN orderdetails od ON od.orderNumber = od1.orderNumber
INNER JOIN products pd ON pd.productCode = od1.productCode
GROUP BY od1.productCode, od1.orderNumber
HAVING COUNT(od1.productCode) >= 10 ) AS TB1;
```
#### Compute the revenue generated by each customer based on their orders
Also, show each customer's revenue as a percentage of total revenue. Sort by customer name.
```sql
SELECT DISTINCT c.customerNumber, c.customerName, CONCAT(ROUND(SUM(od.quantityOrdered * od.priceEach) /tb1.total_revenue * 100, 2) , '%') AS percent_revenue
FROM customers c, orderdetails od, orders o, 
(SELECT SUM(od.quantityOrdered * od.priceEach) AS total_revenue
FROM orderdetails od) as tb1
WHERE c.customerNumber = o.customerNumber AND od.orderNumber = o.orderNumber
GROUP BY c.customerNumber, c.customerName
ORDER BY c.customerName;
```
#### Compute the profit generated by each customer based on their orders
Also, show each customer's profit as a percentage of total profit. Sort by profit descending.
```sql
SELECT DISTINCT c.customerNumber, c.customerName, CONCAT(ROUND(SUM(od.quantityOrdered * (od.priceEach - pd.buyPrice))/tb1.total_revenue * 100, 2) , '%') AS percent_revenue
FROM customers c, orderdetails od, orders o, products pd,
(SELECT SUM(od.quantityOrdered * (od.priceEach - pd.buyPrice)) AS total_revenue
FROM orderdetails od, products pd WHERE pd.productCode = od.productCode) as tb1
WHERE c.customerNumber = o.customerNumber 
AND od.orderNumber = o.orderNumber
AND pd.productCode = od.productCode
GROUP BY c.customerNumber, c.customerName
ORDER BY percent_revenue DESC;
```

#### Compute the revenue generated by each sales representative based on the orders from the customers they serve
```sql
SELECT DISTINCT c.salesRepEmployeeNumber, ROUND(SUM(od.quantityOrdered * od.priceEach ), 2) AS revenue
FROM customers c, orderdetails od, orders o
WHERE c.customerNumber = o.customerNumber 
AND od.orderNumber = o.orderNumber
GROUP BY c.salesRepEmployeeNumber
ORDER BY revenue DESC;
```

#### Compute the profit generated by each sales representative based on the orders from the customers they serve
Sort by profit generated descending
```sql 

SELECT DISTINCT c.salesRepEmployeeNumber, ROUND(SUM(od.quantityOrdered * (od.priceEach - pd.buyPrice) ), 2) AS profit
FROM customers c, orderdetails od, orders o, products pd
WHERE c.customerNumber = o.customerNumber 
AND od.orderNumber = o.orderNumber
AND pd.productCode = od.productCode
GROUP BY c.salesRepEmployeeNumber
ORDER BY profit DESC;
```
#### Compute the revenue generated by each product
Sorted by product name
```sql
SELECT DISTINCT pd.productCode,pd.productName, ROUND(SUM(od.quantityOrdered * od.priceEach ) , 2) AS revenue
FROM  orderdetails od, orders o, products pd
WHERE  od.orderNumber = o.orderNumber
AND pd.productCode = od.productCode
GROUP BY pd.productCode, pd.productName
ORDER BY pd.productName DESC;
```
#### Compute the profit generated by each product line 
Sorted by profit descending
```sql
SELECT DISTINCT pd.productCode,pd.productName, ROUND(SUM(od.quantityOrdered * (od.priceEach - pd.buyPrice) ), 2) AS profit
FROM  orderdetails od, orders o, products pd
WHERE  od.orderNumber = o.orderNumber
AND pd.productCode = od.productCode
GROUP BY pd.productCode, pd.productName
ORDER BY profit DESC;
```
#### Compute the ratio for each product of sales for 2003 versus 2004
```sql
SELECT CONCAT(ROUND(tb1.sales /tb2.sales *100, 2), '%') AS ratio, tb1.productCode, tb1.productName 
FROM 
(SELECT SUM(od.quantityOrdered * od.priceEach) AS sales, od.productCode, pd.productName
FROM orderdetails od, orders o, products pd
WHERE YEAR(o.orderDate) = 2003
AND o.orderNumber = od.orderNumber
AND od.productCode = pd.productCode
GROUP BY od.productCode, pd.productName
) AS tb1, 
(SELECT SUM(od.quantityOrdered * od.priceEach) AS sales, od.productCode, pd.productName
FROM orderdetails od, orders o, products pd
WHERE YEAR(o.orderDate) = 2004
AND o.orderNumber = od.orderNumber
AND od.productCode = pd.productCode
GROUP BY od.productCode, pd.productName) AS tb2;
```
#### Compute the ratio of payments for each customer for 2003 versus 2004
```sql
SELECT CONCAT(ROUND(tb1.pay/tb2.pay * 100, 2), '%') AS ratio, tb1.customerNumber, tb1.customerName
FROM (
SELECT SUM(p.amount) AS pay, c.customerNumber, c.customerName 
FROM payments p, customers c, orders o
WHERE YEAR(p.paymentDate) = 2003 AND YEAR(o.orderDate) = 2003
AND o.customerNumber = c.customerNumber
AND p.customerNumber = c.customerNumber
GROUP BY c.customerName, c.customerNumber) tb1,
(SELECT SUM(p.amount) AS pay, c.customerNumber, c.customerName 
FROM payments p, customers c, orders o
WHERE YEAR(p.paymentDate) = 2004 AND YEAR(o.orderDate) = 2004
AND o.customerNumber = c.customerNumber
AND p.customerNumber = c.customerNumber
GROUP BY c.customerName, c.customerNumber) tb2
WHERE tb1.customerNumber = tb2.customerNumber
ORDER BY ratio DESC;
```
#### Find the products sold in 2003 but not 2004
```sql
SELECT DISTINCT pd.productCode, pd.productName
FROM products pd, orderdetails od, orders o
WHERE YEAR(o.orderDate) = 2003
AND pd.productCode = od.productCode
AND o.orderNumber = od.orderNumber
AND pd.productCode NOT IN 
(SELECT DISTINCT pd.productCode
FROM products pd, orderdetails od, orders o
WHERE YEAR(o.orderDate) = 2004
AND pd.productCode = od.productCode
AND o.orderNumber = od.orderNumber
AND pd.productCode
```
#### Find the customers without payments in 2003
```sql
SELECT DISTINCT c.customerNumber, c.customerName
FROM customers c
WHERE 
c.customerNumber
NOT IN
(SELECT DISTINCT c.customerNumber
FROM customers c, payments p
WHERE YEAR(p.paymentDate) = 2003
AND c.customerNumber = p.customerNumber );
```
## Correlated subqueries
#### Who reports to Mary Patterson
```sql
SELECT CONCAT(e1.firstName, ' ', e1.lastName) AS Name 
FROM employees e1, employees e2
WHERE e1.reportsTo = e2.employeeNumber
AND e2.firstName = 'Mary' AND e2.lastName = 'Patterson';
```

#### Which payments in any month and year are more than twice the average for that month and year
(i.e. compare all payments in Oct 2004 with the average payment for Oct 2004)? Order the results by the date of the payment. You will need to use the date functions.
```sql
SELECT checkNumber, amount, ROUND(tb1.pay, 2) AS pay_amount, YEAR(paymentDate) AS YR, MONTH(paymentDate) AS MT
FROM payments p, 
(SELECT YEAR(paymentDate) AS YR, MONTH(paymentDate) AS MT, AVG(amount) AS pay
FROM payments 
GROUP BY YEAR(paymentDate), MONTH(paymentDate)) AS tb1
WHERE amount > 2 * tb1.pay 
AND YEAR(p.paymentDate) = tb1.YR AND MONTH(p.paymentDate)  = tb1.MT
GROUP BY YEAR(paymentDate), MONTH(paymentDate)
ORDER BY YEAR(paymentDate) ASC, MONTH(paymentDate) ASC;
```
#### The percentage value of each product stock on hand as a percentage of the stock on hand for product line to which it belongs
Order the report by product line and percentage value within product line descending. Show percentages with two decimal places
```sql
```
#### For orders containing more than two products and report those products that constitute more than 50 percent of the value of the order
```sql
```

## Spatial data
The Offices and Customers tables contain the latitude and longitude of each office and customer in officeLocation and customerLocation, respectively, in POINT format. Conventionally, latitude and longitude and reported as a pair of points, with latitude first.

#### Which customers are in the Southern Hemisphere
```sql
``` 
#### Which US customers are south west of the New York office
```sql
```
#### Which customers are closest to the Tokyo office 
(i.e., closer to Tokyo than any other office)
```sql
```
#### Which French customer is furthest from the Paris office
```sql
```
#### Who is the northernmost customer
```sql
```
#### What is the distance between the Paris and Boston offices
To be precise for long distances, the distance in kilometers, as the crow flies, between two points when you have latitude and longitude, is (ACOS(SIN(lat1*PI()/180)*SIN(lat2*PI()/180)+COS(lat1*PI()/180)*COS(lat2*PI()/180)* COS((lon1-lon2)*PI()/180))*180/PI())*60*1.8532

```sql
```





