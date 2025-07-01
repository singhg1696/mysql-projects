-- Create the database
CREATE DATABASE cloudydata;

-- Select the database for use
USE cloudydata;

-- Create the Employees table
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10,2)
);

-- Create the Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- Insert data into Employees table
INSERT INTO Employees (EmpID, EmpName, DepartmentID, Salary) VALUES
(1, 'John Doe', 1, 50000),
(2, 'Jane Smith', 2, 60000),
(3, 'Sara Johnson', 3, 70000),
(4, 'Mike Brown', NULL, 45000),
(5, 'Tom Clark', 2, 55000);

-- Insert data into Departments table
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing');

show tables;

-- #1 Basic INNER JOIN: Write a query to retrieve the names of employees and 
-- their department names for employees who belong to a department.

SELECT EmpName,DepartmentName FROM Employees 
INNER JOIN departments ON
employees.departmentId = departments.departmentId ;

-- #2  INNER JOIN with condition: Write a query to retrieve employees with 
-- salaries greater than 50,000 and their department names

SELECT EmpName,DepartmentName,Salary FROM Employees
INNER JOIN departments ON
employees.departmentId = departments.departmentId 
WHERE Salary > 50000; 

-- #3  INNER JOIN with multiple conditions: Write a query to retrieve employees and 
-- their department names where the salary is greater than 55,000 and
--  the department name starts with 'S'.

SELECT EmpName,DepartmentName FROM Employees
INNER JOIN departments ON
employees.departmentId = departments.departmentId 
WHERE Salary > 55000 AND DepartmentName = 'S%' ; 

-- INNER JOIN on multiple tables: Write a query to retrieve all employees, their department names, and 
-- their salary, but only for employees who belong to a department HR.

SELECT EmpName,DepartmentName,Salary FROM Employees
INNER JOIN departments ON
employees.departmentId = departments.departmentId 
WHERE DepartmentName = 'HR'; 

-- INNER JOIN with aggregate functions: Write a query to retrieve the total salary for each department,
--  considering only departments that have employees.


SELECT DepartmentName, SUM(Salary) Total_Salary FROM Employees
INNER JOIN departments ON
employees.departmentId = departments.departmentId
GROUP BY DepartmentName ;

-- Basic LEFT JOIN: Write a query to list all employees and their corresponding department names, 
-- including employees who do not belong to any department.

SELECT EmpName,DepartmentName FROM Employees 
LEFT JOIN departments ON
employees.departmentId = departments.departmentId ;

-- LEFT JOIN with condition: Write a query to list employees whose salaries are greater than 50,000 
-- along with their department names, including those employees who do not have a department.

SELECT EmpName,DepartmentName FROM Employees 
LEFT JOIN departments ON
employees.departmentId = departments.departmentId
WHERE Salary > 50000 ;



-- LEFT JOIN with aggregate functions: Write a query to list all employees, their department names,
--  and the average salary of employees in each department. Include employees without departments.

SELECT EmpName,DepartmentName,round(avg(Salary),2) Average_Salary FROM Employees 
LEFT JOIN departments ON
employees.departmentId = departments.departmentId
GROUP BY  EmpName,DepartmentName;

-- LEFT JOIN to filter null: Write a query to find all employees who do not belong to any department.

SELECT EmpName FROM Employees
LEFT JOIN departments ON
employees.departmentId = departments.departmentId
WHERE DepartmentName IS NULL;

-- -- LEFT JOIN with ordering: Write a query to list all employees and their department names,
--  sorted by department name. Include employees with no department at the end.

SELECT EmpName,DepartmentName FROM Employees
LEFT JOIN departments ON
employees.departmentId = departments.departmentId
ORDER BY 
    DepartmentName IS NULL,  -- ensures NULLs appear at the end
	DepartmentName
;


