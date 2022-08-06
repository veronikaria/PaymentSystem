
CREATE TRIGGER DeliveryInsert
ON Delivery
AFTER INSERT
AS
BEGIN
DECLARE @salary MONEY
DECLARE @id INT
DECLARE delivery_Cursor CURSOR FAST_FORWARD FOR 
SELECT wh.SalaryWithoutTax, i.DeliveryId
	FROM Delivery d
	JOIN WorkingHours wh ON wh.EmployeeId=d.EmployeeId
	JOIN inserted i ON i.DeliveryId=d.DeliveryId
	WHERE month(i.Date)=month(wh.WorkingDate) AND year(i.Date)=year(wh.WorkingDate)
 OPEN delivery_Cursor 
 FETCH NEXT FROM delivery_Cursor into @salary, @id
 WHILE @@FETCH_STATUS = 0 
 BEGIN 
	UPDATE Delivery
	SET Salary = @salary
	WHERE DeliveryId=@id
 FETCH NEXT FROM delivery_Cursor into @salary, @id  
 END
CLOSE delivery_Cursor
DEALLOCATE delivery_Cursor
END
