https://www.richardtwatson.com/dm6e/Reader/ClassicModels.html
# SQL queries
ClassicModels is a fictitious company. Use the ClassicModels database to answer the following requests (SQL to create the database). Your instructor has the answers to all queries.
The latitude and longitude are specified for office and customer locations in the Offices and Customers tables, respectively. The SRID is set to 4326 to indicate the Spacial Reference System (SRS) is geographic (see Chapter 11 for more details on SRID and SRS).
You can access ClassicModels at richardtwatson.com with accountid=db1 and password=student.


<!-- /MarkdownTOC -->
- [Single entity](# Single-entity)
  - [1 Prepare a list of offices sorted by country, state, city](# Prepare-a-list-of-offices-sorted-by-country-state-city)
  - [2 How many employees are there in the company?](# How-many-employees-are-there-in-the-company?)
  - [3 What is the total of payments received?](# What-is-the-total-of-payments-received?)
  - [4 List the product lines that contain 'Cars'](# List-the-product-lines-that-contain-'Cars')
  - [5 Report total payments for October 28, 2004](# Report-total-payments-for-October-28-2004)






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

