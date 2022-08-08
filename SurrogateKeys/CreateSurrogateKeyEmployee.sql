ALTER TABLE Employee
ADD EmployeeGuid UNIQUEIDENTIFIER 


CREATE TRIGGER GenerateSurrogateKeyEmployee
ON Employee
AFTER INSERT
AS
BEGIN
	DECLARE @id INT
	DECLARE mycursor CURSOR FAST_FORWARD FOR 
	SELECT EmployeeId FROM inserted
	OPEN mycursor
	FETCH NEXT FROM mycursor into @id
	WHILE @@FETCH_STATUS = 0 
	BEGIN
		UPDATE Employee 
		SET EmployeeGuid = NEWID()
		WHERE EmployeeId=@id
		FETCH NEXT FROM mycursor into @id
	END
	CLOSE mycursor
	DEALLOCATE mycursor
END
