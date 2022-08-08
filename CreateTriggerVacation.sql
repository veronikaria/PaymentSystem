
CREATE TRIGGER VacationInsert
ON Vacation
AFTER INSERT
AS
BEGIN
DECLARE @id INT
DECLARE @subId INT
DECLARE @M MONEY;
DECLARE @C INT = 10;
DECLARE vacation_Cursor CURSOR FAST_FORWARD FOR 
	SELECT SUM(Salary), i.VacationId, e.SubdivisionId 
	FROM Delivery d
	JOIN Vacation v on v.EmployeeId=d.EmployeeId 
	JOIN Employee e on e.EmployeeId=v.EmployeeId
	JOIN inserted i on i.VacationId=v.VacationId
	WHERE d.Date >= dateadd(month, datediff(month, 0, getdate()) - 12, 0)
	GROUP BY i.VacationId, e.SubdivisionId
 OPEN vacation_Cursor 
 FETCH NEXT FROM vacation_Cursor into @M, @id, @subId
 WHILE @@FETCH_STATUS = 0 
 BEGIN
	UPDATE Vacation
	SET Payment =
	CASE WHEN dbo.EmployeeVacationPerc(StartDate, EndDate, @subId) = 1 
	THEN @M/(365-@C)* (DATEDIFF(day, StartDate, EndDate))
	ELSE CONVERT(int, 'ERROR Працівників одночасно у відпустці не може бути більше 15%')
	END
	WHERE VacationId=@id
 FETCH NEXT FROM vacation_Cursor into @M, @id, @subId
 END
CLOSE vacation_Cursor
DEALLOCATE vacation_Cursor
END
