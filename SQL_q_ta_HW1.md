# SQL Question 
<!-- MarkdownTOC -->
- [Employee Q](#Employee-Q)
	- [1. Highest Salary](#Highest-Salary-Question)
	- [2. Top 5 employees](#Top-5-employees)
	- [3. BizOps Table](#BizOps-Table)
  - [4. Direct report](#Direct-report)
  - [5. Employee Start Day](#Employee-Start-Day)
  - [6. Average Tenure](#Average-Tenure)
	

<!-- MarkdownTOC -->


### Employee Q
employee [employee_id, name, job_title, level_sk, dept_sk, manager_id, location_sk, salary, start_date, term_date]
level [level_sk, level_name]  
department [dept_sk, dept_name]
location [location_sk, city, state, country]

#### Highest Salary Question
Q1: select the employee in each department with the highest salary in the US. include employee name, department name, and salary in output. 

```sql
SELECT name, salary, dept_name
FROM(
  SELECT 
    e.name, d.dept_name, e.salary,
    RANK() OVER (PARTITION BY e.dept_sk ORDER BY salary DESC) AS Rank_num
    FROM employee e left join department d on d.dept_sk = e.dept_sk 
                    left join location l on l.location_sk = e.location_sk
    WHERE l.country = 'US' 
    ) AS CTE
  WHERE Rank_num = 1;
  
```

#### Top 5 employees
Q2: select the top 5 employees in each department with the highest salaries in the US. include employee name, department name, and salary in output. 

```sql
SELECT name, salary, dept_name
FROM(
  SELECT 
    e.name, d.dept_name, e.salary,
    ROW_NUMBER OVER (PARTITION BY e.dept_sk ORDER BY salary DESC) AS row_num
    FROM employee e left join department d on d.dept_sk = e.dept_sk 
                    left join location l on l.location_sk = e.location_sk
    WHERE l.country = 'US' 
    ) AS CTE
  WHERE row_num <= 5;
  
```

#### BizOps Table
Q3: Create a table in the database with the information from all tables for the department of  ‘BizOps’.

```sql
CREATE TABLE BizOps_info 
 AS 
 SELECT * 
 FROM 
 department d, employee e, level ll, location lc
 WHERE  d.dept_name = 'BizOps',
 	d.dept_sk = e.dept_sk,
	e.location_sk = lc.location_sk,
	e.level_sk = ll.level_sk;
```


#### Direct report
Q4: Pull a list of managers and their direct reports, Include Ids and names for both manager and direct reports in the output. 

```sql

SELECT 
	e.employee_id, e.name, e.manager_id, e1.name
FROM employee e, employee e1, (SELECT DISTINCT manger_id FROM employee) AS tb1
WHERE e.employee_id = tb1.manager_id AND e.manager_id = e1.employee_id;

```

#### Employee Start Day
Q5: Find the number of employees that started at the company each quarter.


```sql
SELECT  
  SUM(CASE WHEN start_date >= '2020-01-01' AND start_date < '2020-04-01' THEN 1 ELSE 0 END) AS Q1,
  SUM(CASE WHEN start_date >= '2020-04-01' AND start_date < '2020-07-01' THEN 1 ELSE 0 END) AS Q2,
  SUM(CASE WHEN start_date >= '2020-07-01' AND start_date < '2020-10-01' THEN 1 ELSE 0 END) AS Q3,
  SUM(CASE WHEN start_date >= '2020-10-01' AND start_date <= '2020-12-31' THEN 1 ELSE 0 END) AS Q4,
  FROM employee;
  
  
  
--sol2
SELECT YEAR(start_date) AS year, 
       QUARTER(start_date) AS quarter, 
       COUNT(employee_id) AS count
FROM employee
GROUP BY YEAR(start_date), QUARTER(start_date)
ORDER BY YEAR(start_date), QUARTER(start_date);
```

#### Average Tenure
Q6: Find the average tenure of all employees by level. If an employee is still at the company, term_date is null; use today’s date to calculate tenure.

```sql
SELECT AVG(DATEDIFF(d, start_date, end_date)) AS avg_tenure, l.level_sk, l.level_name
FROM (
  SELECT start_date, e.level_sk, 
         CASE WHEN term_date IS NOT NULL THEN term_date
         ELSE GETDATE() END AS end_date) AS CTE 
         LEFT JOIN level l on CTE.level_sk = l.level_sk       
GROUP BY l.level_sk, l.level_name;

```
