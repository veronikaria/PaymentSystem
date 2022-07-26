
-- INSERT

CREATE TRIGGER SubdivisionCreateUserAndDate
ON Subdivision
AFTER INSERT
AS
BEGIN
	DECLARE @id INT
	DECLARE mycursor CURSOR FAST_FORWARD FOR 
	SELECT SubdivisionId FROM inserted
	OPEN mycursor
	FETCH NEXT FROM mycursor into @id
	WHILE @@FETCH_STATUS=0
	BEGIN
		UPDATE Subdivision SET UCR = CURRENT_USER,
		DCR=GETDATE() 
		WHERE SubdivisionId = @id
	FETCH NEXT FROM mycursor into @id
	END
CLOSE mycursor
DEALLOCATE mycursor
END

-- UPDATE 

CREATE TRIGGER SubdivisionUpdateUserAndDate
ON Subdivision
AFTER UPDATE
AS
BEGIN
	UPDATE Subdivision SET ULC = CURRENT_USER,
	DLC=GETDATE() 
	WHERE SubdivisionId = (
		SELECT SubdivisionId from inserted
	)
END
