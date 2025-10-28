-- ############################################################### Proceduers ##########################################################

USE Parch_Posey;

-- get all counts for each table...
DELIMITER //
CREATE PROCEDURE Get_Counts_
(
	OUT orders_count INT,
    OUT accounts_count INT,
    OUT regions_count INT,
    OUT sales_reps_count INT,
    OUT web_events_count INT
)
BEGIN
	SELECT COUNT(*) INTO orders_count FROM orders;
    SELECT COUNT(*) INTO accounts_count FROM accounts;
    SELECT COUNT(*) INTO regions_count FROM region;
    SELECT COUNT(*) INTO sales_reps_count FROM sales_reps;
    SELECT COUNT(*) INTO web_events_count FROM web_events;
END //
DELIMITER ;

CALL Get_Counts_(@orders_, @accounts_, @regions_, @sales_, @webs_);

SELECT @orders_, 
@accounts_,
@webs_,
@regions_,
@sales_;



-- update a specific table values...
DELIMITER //
CREATE PROCEDURE update_accounts
(
IN acc_id INT,
IN param VARCHAR(30)
)
BEGIN
	UPDATE accounts SET name = param WHERE id = acc_id;
END //
DELIMITER ;

-- check columns
DELIMITER //
CREATE PROCEDURE Get_col
(
 OUT col INT
)
BEGIN
	SELECT total INTO col FROM orders;
END //
DELIMITER ;

CALL Get_Col(@coll);
SELECT @coll;

-- ############################################################### Functions ##########################################################

-- a normal function

DELIMITER //
CREATE FUNCTION Twice(x INT)
RETURNS INT
DETERMINISTIC 
BEGIN
	DECLARE temp INT;
    SET temp = x * x;
    RETURN temp;
END //
DELIMITER ;

SELECT Twice(5);

-- get all orders with total_amt_usd greater than their average...
DELIMITER //
CREATE FUNCTION Get_avg()
RETURNS FLOAT
DETERMINISTIC
BEGIN
	DECLARE temp FLOAT;
    SELECT AVG(total_amt_usd) INTO temp FROM orders;
    RETURN temp;
END //
DELIMITER ;

SELECT id, total
FROM orders
WHERE total_amt_usd > Get_avg();

-- ############################################################### Triggers ##########################################################
DROP DATABASE For_Triggers;
CREATE DATABASE For_Triggers;
USE For_Triggers;

CREATE TABLE Employees
(
	emp_id INT AUTO_INCREMENT PRIMARY KEY,
    fname VARCHAR (30) NOT NULL,
    lname VARCHAR (30) NOT NULL,
    hourly_pay FLOAT NOT NULL,
    salary DECIMAL (10,2),
    job VARCHAR(30),
    hire_date DATETIME,
    super_id INT
);

INSERT INTO Employees(fname, lname, hourly_pay, job, hire_date, super_id) VALUES
('Mohamed', 'Ahmed', 25.50, 'manager', NOW(), NULL),
('Mahmoud', 'Kamal', 15.00, 'cachier', NOW(), 5),
('Asmaa', 'Diaa', 12.50, 'cook', NOW(), 5),
('Alaa', 'Ahmed', 12.50, 'cook', NOW(), 1),
('Ahmed', 'Hassan', 17.25, 'asst mgr', NOW(), 5);

-- update salary normally ...
UPDATE Employees
SET salary = hourly_pay * 2080;

-- use triggers
DELIMITER //
CREATE TRIGGER update_salary
BEFORE UPDATE ON Employees
FOR EACH ROW
BEGIN
	SET NEW.salary = NEW.hourly_pay * 2080;
END //
DELIMITER ;

UPDATE Employees
SET hourly_pay = hourly_pay + 5
WHERE emp_id = 1;

-- on insert triggers

DELIMITER //
CREATE TRIGGER New_Insert
BEFORE INSERT ON Employees
FOR EACH ROW
BEGIN
	SET NEW.salary = NEW.hourly_pay * 2080;
END //
DELIMITER ;

INSERT INTO Employees VALUES(6, 'Ayat', 'Saber', 10, NULL, 'janitor', NOW(), 5);


CREATE TABLE expenses
(
	expense_id INT PRIMARY KEY,
    expense_name VARCHAR(50),
    expense_total DECIMAL(10,2)
);

INSERT INTO expenses 
VALUES (1, 'Salaries', 0),
	   (2, 'supplies', 0),
	   (3, 'taxes', 0);

-- update the salaries...
UPDATE expenses
SET expense_total = (SELECT SUM(salary) FROM Employees)
WHERE expense_id = 1;

-- trigger for deleting...
DELIMITER //
CREATE TRIGGER ON_delete_emp
AFTER DELETE ON Employees
FOR EACH ROW
BEGIN
	UPDATE expenses
    SET expense_total = (SELECT SUM(salary) FROM Employees)
    WHERE expense_id = 1;
    END //
DELIMITER ;

DROP TRIGGER ON_delete_emp2;
DELIMITER //
CREATE TRIGGER ON_delete_emp2
AFTER DELETE ON Employees
FOR EACH ROW
BEGIN
	UPDATE expenses
    SET expense_total = expense_total - OLD.salary
    WHERE expense_id = 1;
    END //
DELIMITER ;

DELETE FROM Employees
WHERE emp_id = 4;
-- trigger for inserting...

DELIMITER //
CREATE TRIGGER on_insert_emp
AFTER INSERT ON Employees
FOR EACH ROW
BEGIN
	UPDATE expenses
    SET expense_total = expense_total + NEW.salary
    WHERE expense_id = 1;
END //
DELIMITER ;

-- trigger for updating...

DELIMITER //
CREATE TRIGGER on_update_emp
AFTER UPDATE ON Employees
FOR EACH ROW
BEGIN
	UPDATE expenses
    SET expense_total = expense_total + (NEW.salary - OLD.salary)
    WHERE expense_id = 1;
END //
DELIMITER ;

-- create procedure for insertion...
DELIMITER //
CREATE PROCEDURE INSERT_Emp
(
	IN fname VARCHAR (30) ,
    IN lname VARCHAR (30) ,
    IN hourly_pay FLOAT ,
    IN job VARCHAR(30),
    IN hire_date DATETIME,
    IN super_id INT
)
BEGIN
INSERT INTO Employees(fname, lname, hourly_pay, job, hire_date, super_id) VALUES
(fname, lname, hourly_pay, job, hire_date, super_id);
END //
DELIMITER ;