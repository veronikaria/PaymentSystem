
EXECUTE AS USER='statistician'
SELECT *  FROM Employee e
WHERE YEAR(Birthday)<YEAR(GETDATE())-30
REVERT
GO


EXECUTE AS USER='statistician'
SELECT e.LastName, e.FirstName, p.Name, AVG(wh.SalaryWithTax) AS "Avg_Salary" FROM Employee e
JOIN Post p ON p.PostId=e.PostId
JOIN WorkingHours wh ON wh.EmployeeId=e.EmployeeId
GROUP BY e.LastName, e.FirstName, p.Name
REVERT
GO


EXECUTE AS USER='accountant'
INSERT INTO Holiday
("Date")
VALUES
('2022-01-01')
REVERT
GO


EXECUTE AS USER='accountant'
SELECT * FROM Holiday
REVERT
GO


EXECUTE AS USER='accountant'
DELETE FROM Holiday
WHERE "Date"='2022-01-01'
REVERT
GO


EXECUTE AS USER='accountant'
SELECT * FROM Holiday
REVERT
GO


--EXECUTE AS USER='head_vacation'
--INSERT INTO Vacation
--(EmployeeId, StartDate, EndDate)
--VALUES
--(15, '2021-12-20', '2021-12-28')
--REVERT
--GO


EXECUTE AS USER='assistant'
INSERT INTO Post
("Name")
VALUES
('Java Developer')
REVERT
GO


EXECUTE AS USER='assistant'
SELECT * FROM Post
REVERT
GO
