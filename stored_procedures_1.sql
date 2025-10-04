-- ##################################### Insert into Empolyee table ############################################################ 
DELIMITER //
CREATE PROCEDURE Insert_EMP(
IN Fname VARCHAR(20),
IN Minit VARCHAR(20) ,
IN Lname VARCHAR(20),
IN SSN   VARCHAR(14),
IN Bdate DATE,
IN Address VARCHAR(30),
IN Gender  CHAR(6),
IN Salary  DECIMAL(10,2),
IN Super_SSN VARCHAR(14),
IN Dno INT 

)

BEGIN
	INSERT INTO Employee VALUES(Fname, Minit, Lname, SSN, Bdate, Address, Gender, Salary, Super_SSN, Dno);
END //
DELIMITER ;

-- ###############################################################################################################################################  

-- ##################################### Insert into Department table ############################################################ 
DELIMITER //
CREATE PROCEDURE Insert_Dept
(
IN Dname VARCHAR(15),
IN Dnumber INT ,
IN Mgr_SSN VARCHAR(14),
IN Mgr_Start_Date DATE
)

BEGIN
	INSERT INTO Department VALUES(Dname, Dnumber, Mgr_SSN, Mgr_Start_Date);
END //
DELIMITER ;

-- ###############################################################################################################################################  

-- ##################################### Insert into Dept_Locations table ############################################################ 

DELIMITER //
CREATE PROCEDURE Insert_Dept_Loc
(
	IN Dnumber INT,
    IN Dlocation VARCHAR(15)
)

BEGIN
	INSERT INTO Dept_Locations VALUES(Dnumber, Dlocation);
END //
DELIMITER ;

-- ###############################################################################################################################################  

-- ##################################### Insert into Project table ############################################################ 

DELIMITER //
CREATE PROCEDURE Insert_Project
(
	IN Pname VARCHAR(15),
    IN Pnumber INT ,
    IN Plocation VARCHAR(15),
    IN Dnumber INT 
)

BEGIN
	INSERT INTO Project VALUES(Pname, Pnumber, Plocation, Dnumber);
END //
DELIMITER ;

-- ###############################################################################################################################################  

-- ##################################### Insert into Works_On table ############################################################ 

DELIMITER //
CREATE PROCEDURE Insert_Works_On
(
	IN ESSN VARCHAR(14) ,
    IN Pnumber INT ,
    IN Hours DECIMAL(3,1) 
)

BEGIN
	INSERT INTO Works_On VALUES(ESSN, Pnumber, Hours);
END //
DELIMITER ;

-- ###############################################################################################################################################  

-- ##################################### Insert into Dependent table ############################################################ 

DELIMITER //
CREATE PROCEDURE Insert_Dependent
(
	IN ESSN VARCHAR(14),
    IN Dependent_name VARCHAR(60),
    IN Gender CHAR(6),
    IN Bdate Date,
    IN Relationship VARCHAR(8)
)

BEGIN
	INSERT INTO Dependent VALUES(ESSN, Dependent_name, Gender, Bdate, Relationship);
END //
DELIMITER ;