
CREATE TRIGGER VacationInsert
ON Vacation
AFTER INSERT
AS
BEGIN
DECLARE @id INT
DECLARE @M MONEY;
DECLARE vacation_Cursor CURSOR FAST_FORWARD FOR 
	SELECT SUM(wh.SalaryWithoutTax), i.VacationId
	FROM WorkingHours wh
	JOIN Vacation v on v.EmployeeId=wh.EmployeeId 
	JOIN inserted i on i.VacationId=v.VacationId
	WHERE wh.WorkingDate >= dateadd(month, datediff(month, 0, getdate()) - 12, 0)
	GROUP BY i.VacationId

 OPEN vacation_Cursor 
 FETCH NEXT FROM vacation_Cursor into @M, @id
 WHILE @@FETCH_STATUS = 0 
 BEGIN 
	UPDATE Vacation
	SET Payment = @M/(365- (SELECT COUNT(*) FROM Holiday WHERE YEAR(StartDate)=YEAR(Date)))* (DATEDIFF(day, StartDate, EndDate))
	WHERE VacationId=@id
 FETCH NEXT FROM vacation_Cursor into @M, @id
 END
CLOSE vacation_Cursor
DEALLOCATE vacation_Cursor
END
