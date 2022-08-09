USE PayDb

-- TASK 1 
-- Display all data about employees whose first name is Ivan and lastname is Robson or Lawrence 
-- and sort data by the age of the employees (from oldest to youngest)
SELECT * FROM Employee
WHERE FirstName='Ivan'
AND (LastName='Robson' OR LastName='Lawrence')
ORDER BY Birthday 

-- TASK 2
-- Display the basic and holiday hourly rate for each position 
SELECT PostId, TariffMain, TariffHoliday FROM Pay

-- Display the basic rate and rate for additional hours worked for each position 
SELECT PostId, TariffMain, TariffAdditional FROM Pay

-- TASK 3
-- Display the employee's full name, date of salary payment to the employee and salary
-- from the Employee and Delivery tables, provided that the date of salary payment 
-- must be either before September 1, 2020, or after September 1, 2021
-- and sort by salary in descending order
SELECT e.LastName+' '+e.FirstName+' '+e.MiddleName AS FullName, d.Date, d.SalaryEnd from Delivery d, Employee e
WHERE d.EmployeeId=e.EmployeeId
AND (d.Date<'2020-09-01' OR d.Date>'2021-09-01')
ORDER BY d.SalaryEnd DESC


-- TASK 4
-- Show all data from the table Vacation, also output the employee's passport and position id from the Employee table, 
-- while the sample should include all rows from the Employee table.
SELECT v.*, e.PostId, e.Passport FROM Employee e
LEFT OUTER JOIN Vacation v ON e.EmployeeId=v.EmployeeId

-- TASK 5

-- BETWEEN, LIKE
-- Show the employee's ID, lastname and first name from the Employee table
-- data and salary from the Delivery table for the period between July 1, 2021 to September 1, 2021;
-- and provided that the employee's name contains the letter 'e'

SELECT e.EmployeeId, e.LastName, e.FirstName, d.Date, d.SalaryEnd FROM Employee e
JOIN Delivery d ON e.EmployeeId=d.EmployeeId
WHERE d.Date BETWEEN '2021-07-01' AND '2021-09-01'
AND e.FirstName LIKE '%e%'

-- IN
-- Show all employees from the Employee table who live in Kyiv, Kharkiv or Lviv
SELECT * FROM Employee
WHERE City IN ('Kyiv', 'Kharkiv', 'Lviv')

-- EXISTS
-- Show all employees from the Employee table who received a salary
SELECT * FROM Employee
WHERE EXISTS (SELECT * FROM Delivery WHERE Delivery.EmployeeId=Employee.EmployeeId)

-- ALL
-- Show all employees from the Employee table which are younger than 
-- employees with ID 8, 9 or 10
SELECT * FROM Employee WHERE Birthday > ALL(
	SELECT Birthday FROM Employee WHERE EmployeeId BETWEEN 8 AND 10
)

-- ANY
-- Show all data on salary payments to employees living in Kyiv
SELECT * FROM Delivery WHERE EmployeeId = ANY (
	SELECT EmployeeId FROM Employee
	WHERE City='Kyiv'
)


-- TASK 6
-- Output the employee's year, ID and salary for the year
SELECT YEAR(Date) 'Year', EmployeeId, SUM(SalaryEnd) 'All Salary' FROM Delivery
GROUP BY YEAR(Date), EmployeeId


-- TASK 7
-- Output all data from the Delivery table where the employee's salary is higher than the average
SELECT * FROM Delivery 
WHERE SalaryEnd > (SELECT AVG(SalaryEnd) FROM Delivery)


-- TASK 8
-- Display the employee's surname and first name from the Employee table, and also a date and 
-- wage from the Delivery table where the employee's salary is higher than the average
SELECT e.LastName, e.FirstName, tab.Date, tab.SalaryEnd FROM (SELECT * FROM Delivery 
WHERE SalaryEnd > (SELECT AVG(SalaryEnd) FROM Delivery)) tab
JOIN Employee e on tab.EmployeeId=e.EmployeeId


-- TASK 9
-- Using hierarchical sql query output the employee's surname, first name, name of department in which he works, 
-- and his level EmpLevel (Leader - if he is the head of this department òà Employee - if he is only an employee)

WITH EmployeeList AS
(
	SELECT e.LastName, e.FirstName, s.Name as Subdivision, 'Leader' AS EmpLevel FROM Subdivision s
	JOIN Employee e on s.LeaderId=e.EmployeeId  
	UNION ALL
	SELECT LastName, FirstName, s.Name as Subdivision, 'Employee' AS EmpLevel FROM Employee e
	JOIN Subdivision s ON s.SubdivisionId=e.SubdivisionId
	WHERE EmployeeId NOT IN (
	SELECT LeaderId FROM Subdivision
	)
) SELECT * FROM EmployeeList

-- TASK 10
-- Display the avarage salary for eache employee using a cross tab query. 
-- In this table columns will be the IDs of employees: 1, 2, 3, and values for them will be
-- avarage wages corresponding to each employee
SELECT 'Avarage Salary' AS EmpolyeeNo, [1], [2], [3] FROM 
(
	SELECT EmployeeId, SalaryEnd FROM Delivery
) AS SourceTab
PIVOT
(
	AVG(SalaryEnd) FOR EmployeeId IN ([1], [2], [3])
) AS PivotTab


-- TASK 11
-- Change the date of birth to 1997-01-02 for employee with ID 7
UPDATE Employee
SET Birthday='1997-01-02'
WHERE EmployeeId=7

-- TASK 12
-- Change basic rate per hour to 500 for the position of employee with registration number 10005
UPDATE Pay 
SET TariffMain=500 FROM Pay
JOIN Post ON Pay.PostId=Post.PostId
JOIN Employee ON Employee.PostId=Post.PostId
WHERE RegistrationNumber=10005

-- TASK 13
-- Add to Post table following positions: Python Developer, DevOps Engineer
INSERT INTO Post
("Name")
VALUES
('Python Developer'),
('DevOps Engineer')


-- TASK 14
CREATE TABLE EmployeeDetail
(
	EmployeeDetailId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	EmployeeId INT NOT NULL,
	LastName NVARCHAR(30) NOT NULL,
	FirstName NVARCHAR(30) NOT NULL,
	MiddleName NVARCHAR(30) NOT NULL,
	Post NVARCHAR(70) NOT NULL,
	Tariff MONEY NOT NULL
)

INSERT INTO EmployeeDetail
(EmployeeId, LastName, FirstName, MiddleName, Post, Tariff)
SELECT EmployeeId, LastName, FirstName, MiddleName, Post.Name, TariffMain FROM Employee
JOIN Post ON Post.PostId=Employee.PostId
JOIN Pay on Pay.PostId=Employee.PostId


-- TASK 15
-- Delete all records from the EmployeeDetail table
TRUNCATE TABLE EmployeeDetail
DELETE FROM EmployeeDetail

-- Delete all records from the Weekend table
TRUNCATE TABLE Weekend
DELETE FROM Weekend

-- TASK 16
-- Delete all employees from the EmployeeDetail table with position
-- Linux kernel developer
DELETE FROM EmployeeDetail
WHERE Post='Linux kernel developer'





