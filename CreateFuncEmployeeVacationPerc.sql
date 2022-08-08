
CREATE FUNCTION EmployeeVacationPerc
(@start DATE, @end DATE, @SubdivisionId INT) RETURNS INT
AS
BEGIN
	DECLARE @cnt1 INT
	DECLARE @cnt2 INT
	SELECT @cnt1=COUNT(*) FROM Vacation v
	JOIN Employee e ON e.EmployeeId=v.EmployeeId
	WHERE e.SubdivisionId=@SubdivisionId
	AND (v.StartDate BETWEEN @start AND @end
	OR v.EndDate BETWEEN @start AND @end)
	SELECT @cnt2=COUNT(*) FROM Employee
	WHERE SubdivisionId=@SubdivisionId
	iF (@cnt1/@cnt2 >= 0.15) RETURN 0
	ELSE RETURN 1
	RETURN 1
END
