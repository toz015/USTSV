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
