
-- INSERT 

CREATE TRIGGER VacationCreateUserAndDate
ON Vacation
AFTER INSERT
AS
BEGIN
	DECLARE @id INT
	DECLARE mycursor CURSOR FAST_FORWARD FOR 
	SELECT VacationId FROM inserted
	OPEN mycursor
	FETCH NEXT FROM mycursor into @id
	WHILE @@FETCH_STATUS=0
	BEGIN
		UPDATE Vacation SET UCR = CURRENT_USER,
		DCR=GETDATE() 
		WHERE VacationId = @id
	FETCH NEXT FROM mycursor into @id
	END
CLOSE mycursor
DEALLOCATE mycursor
END

-- UPDATE

CREATE TRIGGER VacationUpdateUserAndDate
ON Vacation
AFTER UPDATE
AS
BEGIN
	UPDATE Vacation SET ULC = CURRENT_USER,
	DLC=GETDATE() 
	WHERE VacationId = (
		SELECT VacationId from inserted
	)
END
