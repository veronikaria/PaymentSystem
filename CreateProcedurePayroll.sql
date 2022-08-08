
CREATE PROCEDURE Payroll
	@date date,
	@empId int
AS
BEGIN
DECLARE @salary MONEY = 0
DECLARE @vacation MONEY = 0
DECLARE @end MONEY = 0
SELECT @salary=wh.SalaryWithoutTax
	FROM WorkingHours wh 
	WHERE month(@date)=month(wh.WorkingDate) AND year(@date)=year(wh.WorkingDate)
	AND wh.EmployeeId=@empId
SELECT @vacation=Payment FROM Vacation v
WHERE (month(v.StartDate)=month(DateAdd(m,-1,@date)) AND year(v.StartDate)=year(DateAdd(m,-1,@date))
OR (month(v.StartDate)=month(DateAdd(m,-2,@date)) AND year(v.StartDate)=year(DateAdd(m,-2,@date))))
AND month(v.EndDate)=month(DateAdd(m,-1,@date)) AND year(v.EndDate)=year(DateAdd(m,-1,@date))
AND v.EmployeeId=@empId
SET @end = @salary+@vacation
INSERT INTO Delivery
(EmployeeId, "Date", Salary)
VALUES
(@empId, @date, @end)
END
