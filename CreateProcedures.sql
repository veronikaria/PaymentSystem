
CREATE PROC PayrollForDpartments 
AS
SELECT s.Name, AVG(wh.HoursMain) HoursMain, AVG(wh.HoursAdditional) HoursAdditional, 
AVG(wh.HoursHoliday) HoursHoliday, AVG(wh.SalaryWithoutTax) Salary 
FROM Subdivision s
JOIN Employee e ON s.SubdivisionId=e.SubdivisionId
JOIN WorkingHours wh on wh.EmployeeId=e.EmployeeId
GROUP BY s.Name

EXEC PayrollForDpartments


CREATE PROC DeliveryForDpartments 
AS
SELECT s.Name, month(d.Date) "Month", year(d.Date) "Year", SUM(d.Salary) "AllSalary"
FROM Subdivision s
JOIN Employee e ON s.SubdivisionId=e.SubdivisionId
JOIN Delivery d on d.EmployeeId=e.EmployeeId
GROUP BY month(d.Date), year(d.Date), s.Name

EXEC DeliveryForDpartments


CREATE PROC WorkForEmployee @StartDate DATE, @EndDate DATE, 
@LastName NVARCHAR(30), @FirstName NVARCHAR(30), @MiddleName NVARCHAR(30)
AS
SELECT e.LastName, e.FirstName, e.MiddleName, wh.SalaryWithoutTax, wh.WorkingDate
FROM Subdivision s
JOIN Employee e ON s.SubdivisionId=e.SubdivisionId
JOIN WorkingHours wh on wh.EmployeeId=e.EmployeeId
WHERE @LastName=e.LastName AND e.FirstName=@FirstName AND e.MiddleName=@MiddleName
AND wh.WorkingDate BETWEEN @StartDate AND @EndDate

EXEC WorkForEmployee '2021-05-10', '2021-08-10', 'Robson',  'Ivan', 'Ivanovych'


CREATE PROC DebtStatement 
AS
SELECT e.LastName, e.FirstName, e.MiddleName, d.Date, SalaryEnd-Salary AS Debt FROM Delivery d
JOIN Employee e on e.EmployeeId=d.EmployeeId
WHERE SalaryEnd!=Salary

EXEC DebtStatement

