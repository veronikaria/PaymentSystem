
CREATE TRIGGER WorkingHoursCreateUserAndDate
ON WorkingHours
AFTER INSERT
AS
BEGIN
	DECLARE @id INT
	DECLARE mycursor CURSOR FAST_FORWARD FOR 
	SELECT WorkingHoursId FROM inserted
	OPEN mycursor
	FETCH NEXT FROM mycursor into @id
	WHILE @@FETCH_STATUS=0
	BEGIN
		UPDATE WorkingHours SET UCR = CURRENT_USER,
		DCR=GETDATE() 
		WHERE WorkingHoursId = @id
	FETCH NEXT FROM mycursor into @id
	END
CLOSE mycursor
DEALLOCATE mycursor
END
