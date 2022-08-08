
CREATE PROCEDURE TotalAllDelivery
	@date DATE
AS
BEGIN
	DECLARE @id INT
	DECLARE mycursor CURSOR LOCAL FOR
	SELECT EmployeeId FROM Employee
	OPEN mycursor
	FETCH NEXT FROM mycursor INTO @id
	WHILE @@FETCH_STATUS=0
	BEGIN
	IF EXISTS (
	SELECT * FROM Delivery 
	WHERE Date = @date AND EmployeeId=@id )  
	BEGIN
	FETCH NEXT FROM mycursor INTO @id
	END
	ELSE
	BEGIN
	EXEC TotalDelivery @id, @date
	FETCH NEXT FROM mycursor INTO @id
	END
	END
	CLOSE mycursor
	DEALLOCATE mycursor
END
