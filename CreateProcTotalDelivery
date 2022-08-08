
CREATE PROCEDURE TotalDelivery
	@employee_id INT,
	@date DATE
AS
BEGIN
DECLARE @salary MONEY = 0
DECLARE @vacation MONEY = 0
SELECT @salary=wh.SalaryWithoutTax
FROM WorkingHours wh 
WHERE YEAR(@date)=YEAR(wh.WorkingDate)
AND MONTH(@date)=MONTH(wh.WorkingDate)
AND wh.EmployeeId=@employee_id
SELECT @vacation=Payment 
FROM Vacation v
WHERE v.EmployeeId=@employee_id AND (
	MONTH(v.StartDate) = MONTH(DATEADD(mm,-1,@date)) 
	AND YEAR(v.StartDate)=YEAR(DATEADD(mm,-1,@date))
	OR MONTH(v.StartDate)=MONTH(DATEADD(mm,-2,@date)) 
	AND YEAR(v.StartDate)=YEAR(DATEADD(mm,-2,@date))
) AND MONTH(v.EndDate)=MONTH(DATEADD(mm,-1,@date)) 
AND YEAR(v.EndDate)=YEAR(DATEADD(mm,-1,@date))
INSERT INTO Delivery
(EmployeeId, "Date", Salary, Vacation, Total)
VALUES
(@employee_id, @date, @salary, @vacation, @salary+@vacation)
END
