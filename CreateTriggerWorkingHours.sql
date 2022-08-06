
CREATE TRIGGER WorkingHoursInsert
ON WorkingHours
AFTER INSERT
AS
BEGIN
DECLARE @summ MONEY
DECLARE @id INT
DECLARE my_Cursor CURSOR FAST_FORWARD FOR 
SELECT p.TariffMain*wh.HoursMain+p.TariffAdditional*wh.HoursAdditional+p.TariffHoliday*wh.HoursHoliday, i.WorkingHoursId
	FROM Pay p
	JOIN Employee e ON e.PostId=p.PostId
	JOIN WorkingHours wh ON wh.EmployeeId=e.EmployeeId
	JOIN inserted i ON i.WorkingHoursId=wh.WorkingHoursId
 OPEN my_Cursor 
 FETCH NEXT FROM my_Cursor into @summ, @id
 WHILE @@FETCH_STATUS = 0 
 BEGIN 
 UPDATE WorkingHours
SET SalaryWithTax = @summ
WHERE WorkingHours.WorkingHoursId=@id
 FETCH NEXT FROM my_Cursor into @summ, @id  
 END
CLOSE my_Cursor
DEALLOCATE my_Cursor
END
