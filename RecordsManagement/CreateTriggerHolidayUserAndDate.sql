
-- INSERT

CREATE TRIGGER HolidayCreateUserAndDate
ON Holiday
AFTER INSERT
AS
BEGIN
	DECLARE @id INT
	DECLARE mycursor CURSOR FAST_FORWARD FOR 
	SELECT HolidayId FROM inserted
	OPEN mycursor
	FETCH NEXT FROM mycursor into @id
	WHILE @@FETCH_STATUS=0
	BEGIN
		UPDATE Holiday SET UCR = CURRENT_USER,
		DCR=GETDATE() 
		WHERE HolidayId = @id
	FETCH NEXT FROM mycursor into @id
	END
CLOSE mycursor
DEALLOCATE mycursor
END

-- UPDATE

CREATE TRIGGER HolidayUpdateUserAndDate
ON Holiday
AFTER UPDATE
AS
BEGIN
	UPDATE Holiday SET ULC = CURRENT_USER,
	DLC=GETDATE() 
	WHERE HolidayId = (
		SELECT HolidayId from inserted
	)
END
