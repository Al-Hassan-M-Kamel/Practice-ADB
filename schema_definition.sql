CREATE DATABASE Company;

USE Company;

CREATE TABLE Employee(
	Fname VARCHAR(20) NOT NULL,
	Minit VARCHAR(20),
	Lname VARCHAR(20) NOT NULL,
    SSN   VARCHAR(14) NOT NULL,
    Bdate DATE,
    Address VARCHAR(30),
    Gender  CHAR(6),
    Salary  DECIMAL(10,2),
    Super_SSN VARCHAR(14),
    Dno       INT NOT NULL,
    
    PRIMARY KEY(SSN)
);

CREATE TABLE Department(
	Dname VARCHAR(15) NOT NULL,
    Dnumber INT NOT NULL,
    Mgr_SSN VARCHAR(14) NOT NULL,
    Mgr_Start_Date DATE,
    PRIMARY KEY(Dnumber),
    UNIQUE(Dname),
    FOREIGN KEY(Mgr_SSN) REFERENCES Employee(SSN)
);

CREATE TABLE Dept_Locations(
	Dnumber INT NOT NULL,
    Dlocation VARCHAR(15) NOT NULL,
    PRIMARY KEY(Dnumber, Dlocation),
    FOREIGN KEY(Dnumber) REFERENCES Department(Dnumber)
);

CREATE TABLE Project(
	Pname VARCHAR(15) NOT NULL,
    Pnumber INT NOT NULL,
    Plocation VARCHAR(15),
    Dnumber INT NOT NULL,
    
    PRIMARY KEY(Pnumber),
    UNIQUE(pname),
    FOREIGN KEY(Dnumber) REFERENCES Department(Dnumber)
);

CREATE TABLE Works_On(
	ESSN VARCHAR(14) NOT NULL,
    Pnumber INT NOT NULL,
    Hours DECIMAL(3,1) NOT NULL,
    
    PRIMARY KEY(ESSN, Pnumber),
    FOREIGN KEY(ESSN) REFERENCES Employee(SSN),
    FOREIGN KEY(Pnumber) REFERENCES Project(Pnumber)
);

CREATE TABLE Dependent(
	ESSN VARCHAR(14) NOT NULL,
    Dependent_name VARCHAR(60) NOT NULL,
    Gender CHAR(6),
    Bdate Date,
    Relationship VARCHAR(8),
    
    PRIMARY KEY(ESSN, Dependent_name),
    FOREIGN KEY(ESSN) REFERENCES Employee(SSN)
);

