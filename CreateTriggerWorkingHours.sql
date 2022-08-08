
CREATE TRIGGER WorkingHoursInsert
ON WorkingHours
AFTER INSERT
AS
BEGIN
DECLARE @id INT
DECLARE @iswork BIT
DECLARE @summ MONEY
DECLARE working_Cursor CURSOR FAST_FORWARD FOR 
SELECT p.TariffMain*w.HoursMain+p.TariffAdditional*w.HoursAdditional+p.TariffHoliday*w.HoursHoliday, 
	i.WorkingHoursId, e.IsWorks
	FROM Employee e
	JOIN Pay p ON p.PostId=e.PostId
	JOIN WorkingHours w ON w.EmployeeId=e.EmployeeId
	JOIN inserted i ON i.WorkingHoursId=w.WorkingHoursId
 OPEN working_Cursor 
 FETCH NEXT FROM working_Cursor into @summ, @id, @iswork
 WHILE @@FETCH_STATUS = 0 
 BEGIN 
 UPDATE WorkingHours
SET SalaryWithTax = CASE
	WHEN @iswork=0
		THEN NULL
	WHEN @summ < ( 
		SELECT MinSalary FROM MinimumSalary
		WHERE WorkingDate BETWEEN DateStart AND DateEnd
	) THEN ( 
		SELECT MinSalary FROM MinimumSalary
		WHERE WorkingDate BETWEEN DateStart AND DateEnd
	)
	ELSE @summ
	END
WHERE WorkingHoursId = @id
 FETCH NEXT FROM working_Cursor into @summ, @id, @iswork
 END
CLOSE working_Cursor
DEALLOCATE working_Cursor
END
