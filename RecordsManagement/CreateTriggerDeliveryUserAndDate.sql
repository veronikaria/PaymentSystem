
-- INSERT

CREATE TRIGGER DeliveryCreateUserAndDate
ON Delivery
AFTER INSERT
AS
BEGIN
	DECLARE @id INT
	DECLARE mycursor CURSOR FAST_FORWARD FOR 
	SELECT DeliveryId FROM inserted
	OPEN mycursor
	FETCH NEXT FROM mycursor into @id
	WHILE @@FETCH_STATUS=0
	BEGIN
		UPDATE Delivery SET UCR = CURRENT_USER,
		DCR=GETDATE() 
		WHERE DeliveryId = @id
	FETCH NEXT FROM mycursor into @id
	END
CLOSE mycursor
DEALLOCATE mycursor
END


-- UPDATE

CREATE TRIGGER DeliveryUpdateUserAndDate
ON Delivery
AFTER UPDATE
AS
BEGIN
	UPDATE Delivery SET ULC = CURRENT_USER,
	DLC=GETDATE() 
	WHERE DeliveryId = (
		SELECT DeliveryId from inserted
	)
END
