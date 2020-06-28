# Get familiar with MySQL workbench
<!-- MarkdownTOC -->

- [Schema](#Schema)
- [Tables](#Tables)
- [Procedures](#Procedures)
- [View](#View)
- [Trigger](#Trigger)
- [Function ](#Function)


<!-- /MarkdownTOC -->


### Schema
```sql

Create SCHEMA Inventry;
```



### Tables
```sql
CREATE TABLE Inventry.class(ID INT,
				NAME    VARCHAR(40),
				CLASS VARCHAR(40));
                
INSERT INTO Inventry.class (ID, NAME, CLASS) VALUES (1, 'TONG', 'MATH');
INSERT INTO Inventry.class (ID, NAME, CLASS) VALUES (2, 'Wang', 'STATISTICS');
INSERT INTO Inventry.class (ID, NAME, CLASS) VALUES (3, 'Qin', 'PHYSICAL');
INSERT INTO Inventry.class (ID, NAME, CLASS) VALUES (4, 'Dong', 'PYTHON');
INSERT INTO Inventry.class (ID, NAME, CLASS) VALUES (5, 'King', 'R');

```

### Procedures

```sql
delimiter //
CREATE  PROCEDURE `Change_class`(IN class_name varchar(40), change_name varchar(40))
BEGIN
	UPDATE CLASS
    SET CLASS = change_name
    WHERE CLASS = class_name;
    
END
delimiter ;

-- test

CALL Change_class('MATH', 'PE')

```


### View
```sql
Create view math_class as 
SELECT * FROM inventry.class 
where class = 'Math';

-- Test

select * from math_class;

```


### Trigger

```sql
delimiter //
CREATE trigger CLASSCHECK BEFORE INSERT ON class FOR EACH ROW
IF NEW.ID = 1 AND NEW.NAME != 'TONG' THEN SET NEW.NAME = 'TONG'; 
END IF//
delimiter ;

-- test
INSERT INTO inventry.class values (1, 'Ke', 'SPORT');
```
### Function 
```sql
CREATE FUNCTION 'ADD_ONE' (NUM INT)
RETURNS INT
BEGIN
SET RES = 0
SET RES = RES + 1
RETURN RES

