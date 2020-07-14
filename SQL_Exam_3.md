https://www.richardtwatson.com/dm6e/Reader/ClassicModels.html
# SQL queries
ClassicModels is a fictitious company. Use the ClassicModels database to answer the following requests (SQL to create the database). Your instructor has the answers to all queries.
The latitude and longitude are specified for office and customer locations in the Offices and Customers tables, respectively. The SRID is set to 4326 to indicate the Spacial Reference System (SRS) is geographic (see Chapter 11 for more details on SRID and SRS).
You can access ClassicModels at richardtwatson.com with accountid=db1 and password=student.


<!-- /MarkdownTOC -->
- [1. Top three cities that we have employees](#Top-three-cities)
- [2. Profit margin on each productlines](#Profit-margin-on-each-productlines)
- [3. Top 3 sales rep](#Top-3-sales-rep)
- [4. Employee Salary Change Times](#Employee-Salary-Change-Times)
- [5. Top 3 Salary](#Top-3-Salary)
#### Employee Salary Change Times

<!-- /MarkdownTOC -->

#### Top three cities
1. Employees all over the world. Can you tell me the top three cities that we have employees?
Expected result:

```sql
SELECT o.city, COUNT(e.employeeNumber) AS employee_count
FROM employees e, offices o
WHERE e.officeCode = o.officeCode
GROUP BY o.city
ORDER BY employee_count DESC
LIMIT 3;
```

#### Profit margin on each productlines
2. For company products, each product has inventory and buy price, msrp. Assume that every product is sold on msrp price. Can you write a query to tell company executives: profit margin on each productlines
Profit margin= sum(profit if all sold) - sum(cost of each=buyPrice) / sum (buyPrice)
Product line = each product belongs to a product line. You need group by product line. 
```sql
SELECT p.productline, ROUND(AVG(profit), 2) AS productLine_profit
FROM products p, (
SELECT productLine, productCode, (MSRP - buyPrice) * quantityInStock/(quantityInStock * buyPrice) AS profit
FROM products 
GROUP BY productLine, productCode) AS tb1
WHERE p.productLine = tb1.productLine
GROUP BY p.productLine
ORDER BY productLine_profit DESC;
```

#### Top 3 sales rep
3. company wants to award the top 3 sales rep They look at who produces the most sales revenue.
     * A. can you write a query to help find the employees. 
     * B. if we want to promote the employee to a manager, what do you think are the tables to be updated.
     * C. An employee is leaving the company, write a stored procedure to handle the case. 1). Make the current employee inactive, 2). Replaced with its manager employeenumber in order table. 

A
```sql
SELECT ROUND(SUM(tb1.order_amonut),2) AS total_sales, c1.salesRepEmployeeNumber, CONCAT(e.firstName, ' ', e.lastName) AS employee_name
FROM customers c1, (
SELECT o.customerNumber, SUM(od.quantityOrdered * priceEach) AS order_amonut
FROM orderS o, orderdetails od
WHERE o.orderNumber = od.orderNumber
GROUP BY o.customerNumber) AS tb1, employees e
WHERE tb1.customerNumber = c1.customerNumber AND e.employeeNumber = c1.salesRepEmployeeNumber
GROUP BY c1.salesRepEmployeeNumber
ORDER BY total_sales
LIMIT 3;
```
B
```sql
CREATE DEFINER=`root`@`localhost` PROCEDURE `promote_to_manager`( IN title VARCHAR(30))
BEGIN
UPDATE employees e
SET e.jobTitle = title
WHERE e.employeeNumber IN (
SELECT salesRepEmployeeNumber FROM  (
SELECT ROUND(SUM(tb1.order_amonut),2) AS total_sales, c1.salesRepEmployeeNumber, CONCAT(e.firstName, ' ', e.lastName) AS employee_name
FROM customers c1, (
SELECT o.customerNumber, SUM(od.quantityOrdered * priceEach) AS order_amonut
FROM orderS o, orderdetails od
WHERE o.orderNumber = od.orderNumber
GROUP BY o.customerNumber) AS tb1, employees e
WHERE tb1.customerNumber = c1.customerNumber AND e.employeeNumber = c1.salesRepEmployeeNumber
GROUP BY c1.salesRepEmployeeNumber
ORDER BY total_sales
LIMIT 3
) AS tb1
);
END

-- test

CALL promote_to_manager('Manager')
```
C
```sql
CREATE DEFINER=`root`@`localhost` PROCEDURE `Leaving_process`(IN employ_num INT)
BEGIN
UPDATE customers c, employees e
SET c.salesRepEmployeeNumber = e.reportsTo
WHERE c.salesRepEmployeeNumber = employ_num AND 
e.employeeNumber = employ_num;

UPDATE employees e1, employees e2
SET e1.reportsTo = e2.reportsTo
WHERE e1.reportsTo = employ_num AND 
e2.employeeNumber = employ_num;

DELETE 
FROM employees e3
WHERE e3.employeeNumber = employ_num;
END
```
#### Employee Salary Change Times
Ask to provide a table to show for each employee in a certain department how many times their Salary changes 

=======following challenge:
Employee 
[employee_id, employee_name, gender, current_salary, department_id, start_date, term_date]

Employee_salary 
[employee_id, salary, year, month]

Department 
[department_id, department_name]

```sql

```

#### Top 3 Salary

```sql
SELECT
        e.employee_name, e.current_salary, d.department_name
FROM Employee e, Employee_salary es, Department d
WHERE e. employee_id = es. employee_id
AND e. department_id = d. department_id
GROUP BY d. department_id 
ORDER BY e. current_salary DESC LIMIT3;

```

