
-- INSERT

CREATE TRIGGER EmployeeCreateUserAndDate
ON Employee
AFTER INSERT
AS
BEGIN
	DECLARE @id INT
	DECLARE mycursor CURSOR FAST_FORWARD FOR 
	SELECT EmployeeId FROM inserted
	OPEN mycursor
	FETCH NEXT FROM mycursor into @id
	WHILE @@FETCH_STATUS=0
	BEGIN
		UPDATE Employee SET UCR = CURRENT_USER,
		DCR=GETDATE() 
		WHERE EmployeeId = @id
	FETCH NEXT FROM mycursor into @id
	END
CLOSE mycursor
DEALLOCATE mycursor
END

-- UPDATE

CREATE TRIGGER EmployeeUpdateUserAndDate
ON Employee
AFTER UPDATE
AS
BEGIN
	UPDATE Employee SET ULC = CURRENT_USER,
	DLC=GETDATE() 
	WHERE EmployeeId = (
		SELECT EmployeeId from inserted
	)
END
