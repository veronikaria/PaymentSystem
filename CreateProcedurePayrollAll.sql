
CREATE PROCEDURE PayrollAll
	@date DATE
AS
BEGIN
	DECLARE @id INT
	DECLARE cursCust CURSOR LOCAL FOR
	SELECT EmployeeId FROM Employee
	OPEN cursCust
	FETCH NEXT FROM cursCust INTO @id
	WHILE @@FETCH_STATUS=0
	BEGIN
		EXEC Payroll @date, @id
	FETCH NEXT FROM cursCust INTO @id
		END
	CLOSE cursCust
	DEALLOCATE cursCust
END
