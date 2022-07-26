
-- INSERT 

CREATE TRIGGER WeekendCreateUserAndDate
ON Weekend
AFTER INSERT
AS
BEGIN
	DECLARE @id INT
	DECLARE mycursor CURSOR FAST_FORWARD FOR 
	SELECT WeekendId FROM inserted
	OPEN mycursor
	FETCH NEXT FROM mycursor into @id
	WHILE @@FETCH_STATUS=0
	BEGIN
		UPDATE Weekend SET UCR = CURRENT_USER,
		DCR=GETDATE() 
		WHERE WeekendId = @id
	FETCH NEXT FROM mycursor into @id
	END
CLOSE mycursor
DEALLOCATE mycursor
END

-- UPDATE

CREATE TRIGGER WeekendUpdateUserAndDate
ON Weekend
AFTER UPDATE
AS
BEGIN
	UPDATE Weekend SET ULC = CURRENT_USER,
	DLC=GETDATE() 
	WHERE WeekendId = (
		SELECT WeekendId from inserted
	)
END
