https://www.richardtwatson.com/dm6e/Reader/ClassicModels.html
# SQL queries
ClassicModels is a fictitious company. Use the ClassicModels database to answer the following requests (SQL to create the database). Your instructor has the answers to all queries.
The latitude and longitude are specified for office and customer locations in the Offices and Customers tables, respectively. The SRID is set to 4326 to indicate the Spacial Reference System (SRS) is geographic (see Chapter 11 for more details on SRID and SRS).
You can access ClassicModels at richardtwatson.com with accountid=db1 and password=student.


<!-- /MarkdownTOC -->
- [Single entity](#Single-entity)
  - [1 Prepare a list of offices sorted by country, state, city](#Prepare-a-list-of-offices-sorted-by-country-state-city)
  - [2 How many employees are there in the company?](#How-many-employees-are-there-in-the-company?)
  - [3 What is the total of payments received?](#What-is-the-total-of-payments-received?)
  - [4 List the product lines that contain 'Cars'](#List-the-product-lines-that-contain-'Cars')
  - [5 Report total payments for October 28, 2004](#Report-total-payments-for-October-28-2004)
  - [6 Report those payments greater than $100,000](#Report-those-payments-greater-than-$100000)
  - [7 List the products in each product line](#List-the-products-in-each-product-line)
  - [8 How many products in each product line?](#How-many-products-in-each-product-line?)
  - [9 What is the minimum payment received?](#What-is-the-minimum-payment-received?)
  - [10 List all payments greater than twice the average payment](#List-all-payments-greater-than-twice-the-average-payment)
  - [11 What is the average percentage markup of the MSRP on buyPrice?](#What-is-the-average-percentage-markup-of-the-MSRP-on-buyPrice?)
  - [12 How many distinct products does ClassicModels sell?](#How-many-distinct-products-does-ClassicModels-sell?)
  - [13 Report the name and city of customers who don't have sales representatives?](#Report-the-name-and-city-of-customers-who-don't-have-sales-representatives?)
  - [14 What are the names of executives with VP or Manager in their title?](#What-are-the-names-of-executives-with-VP-or-Manager-in-their-title-)
  - [15 Which orders have a value greater than $5,000?](#Which-orders-have-a-value-greater-than--5-000-)
  
- [One to many relationship](#One-to-many-relationship)
  - [Report the account representative for each customer](#Report-the-account-representative-for-each-customer)




<!-- /MarkdownTOC -->
### Single entity


#### Prepare a list of offices sorted by country, state, city

```sql
SELECT DISTINCT officeCode
FROM classicmodels.offices
ORDER BY country, state, city;

```

#### How many employees are there in the company?

```sql
SELECT COUNT(DISTINCT employeeNumber) as employee_num
FROM employees;
```

#### What is the total of payments received?

```sql
SELECT ROUND(SUM(amount),2) as total_payment
FROM payments;
```
#### List the product lines that contain 'Cars'

```sql
SELECT * FROM productlines
WHERE productline like '%Car%';
```
#### Report total payments for October 28, 2004
```sql
SELECT SUM(amount) as total_payment 
FROM payments WHERE paymentDate = '2004-10-28';
```

#### Report those payments greater than $100000
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

#### What is the minimum payment received?

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
#### What is the average percentage markup of the MSRP on buyPrice?
```sql
SELECT CONCAT(round(AVG(MSRP/buyPrice),2) * 100 , '%') AS avg_MSRP_on_buyPrice FROM products
```

#### How many distinct products does ClassicModels sell?
```sql
SELECT COUNT(DISTINCT productCode ) AS Unique_prod FROM products;
```

#### Report the name and city of customers who don't have sales representatives?
```sql
SELECT customerName, city
FROM customers 
WHERE salesRepEmployeeNumber is NULL;
```
#### What are the names of executives with VP or Manager in their title?
```sql
SELECT concat(firstName, ' ', lastName)as Name, jobTitle 
FROM employees 
WHERE jobTitle LIKE '%VP%' or jobTitle LIKE '%Manager%';
```
#### Which orders have a value greater than $5,000?
```sql
SELECT orderNumber 
From orderdetails 
WHERE priceEach * quantityOrdered > 5000;
```
