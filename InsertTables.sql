
INSERT INTO Post
("Name")
VALUES
('C/C++ Developer'),
('.NET Developer'),
('Linux kernel developer'),
('Test Automation Engineer'),
('Manual QA Engineer'),
('Provincial Sys-Analyst')

INSERT INTO Subdivision
("Name", LeaderId)
VAlUES
('System administrators', 1),
('Programmers', 3),
('Tester', 6),
('Systems Analyst', 8)


INSERT INTO Employee
(SubdivisionId, PostId, RegistrationNumber, LastName, FirstName, MiddleName, Passport, Birthday, City)
VALUES
(1, 3, NEXT VALUE FOR RegistrationSequence, 'Robson', 'Ivan', 'Ivanovych', '527352889', '1995-12-10', 'Kyiv'),
(3, 4, NEXT VALUE FOR RegistrationSequence, 'Taylor', 'Petro', 'Petrovych', '526786789', '1989-10-05', 'Kharkiv'),
(2, 1, NEXT VALUE FOR RegistrationSequence, 'Wright', 'Eddie', 'Anatolyevich', '174484789', '1979-11-10', 'Kyiv'),
(4, 6, NEXT VALUE FOR RegistrationSequence, 'Lawrence', 'Ivan', 'Serhiyovych', '983458789', '1987-08-09', 'Lviv'),
(2, 2, NEXT VALUE FOR RegistrationSequence, 'Quinn', 'Andriy', 'Ivanovych', '743453889', '1992-05-07', 'Kyiv'),
(4, 6, NEXT VALUE FOR RegistrationSequence, 'Morris', 'Marcus', 'Mykolayovych', '146656719', '1998-12-04', 'Kyiv'),
(3, 5, NEXT VALUE FOR RegistrationSequence, 'Kelly', 'Lilya', 'Igorivna', '189458829', '1997-01-01', 'Kharkiv'),
(1, 3, NEXT VALUE FOR RegistrationSequence, 'Glowshield', 'Deacon', 'Ivanovych', '543459779', '1995-11-10', 'Lviv'),
(1, 3, NEXT VALUE FOR RegistrationSequence, 'Ross', 'Viktoria', 'Ivanivna', '543456699', '1991-01-04', 'Kyiv'),
(3, 4, NEXT VALUE FOR RegistrationSequence, 'Skysorrow', 'Illya', 'Serhiyovych', '544459199', '1992-02-09', 'Kharkiv'),
(3, 5, NEXT VALUE FOR RegistrationSequence, 'Fogripper', 'Petro', 'Ivanovych', '549899199', '1998-03-03', 'Kharkiv'),
(2, 2, NEXT VALUE FOR RegistrationSequence, 'Featherwatcher', 'Eddie', 'Ivanovych', '883459199', '1978-12-08', 'Kyiv')


INSERT INTO Pay
(PostId, TariffMain)
VALUES
(1, 650),
(2, 600),
(3, 490),
(4, 630),
(5, 450),
(6, 490)

DECLARE @StartDate DATETIME
DECLARE @StartSaturdayDate DATETIME
DECLARE @StartSundayDate DATETIME
DECLARE @EndDate DATETIME
SET @StartDate = '01-01-2019'
DECLARE @Find INT = 0
WHILE @Find=0
BEGIN
   IF DATEPART(dw, @StartDate) = 7 
   BEGIN
		SET @StartSaturdayDate=@StartDate 
		SET @StartSundayDate=DATEADD(dd, 1, @StartDate)
		SET @Find=1
	END
   ELSE IF DATEPART(dw, @StartDate) = 1
   BEGIN
		SET @StartSundayDate=@StartDate 
		SET @StartSaturdayDate=DATEADD(dd, -1, @StartDate)
		SET @Find=1
   END
   ELSE
   SET @StartDate = DATEADD(dd, 1, @StartDate)
END
SET @EndDate = GETDATE()

WHILE @StartSaturdayDate <= @EndDate
BEGIN
	INSERT INTO Weekend
	("Date")
	VALUES (@StartSaturdayDate), (@StartSundayDate)
	SET @StartSaturdayDate = DATEADD(dd, 7, @StartSaturdayDate)
	SET @StartSundayDate = DATEADD(dd, 7, @StartSundayDate)
END

INSERT INTO Holiday
VALUES
('2019-01-01'),
('2019-01-07'),
('2019-03-08'),
('2019-04-28'),
('2019-05-01'),
('2019-05-09'),
('2019-06-16'),
('2019-06-28'),
('2019-08-24'),
('2019-10-14'),
('2019-12-25'),
('2020-01-01'),
('2020-01-07'),
('2020-03-08'),
('2020-04-19'),
('2020-05-01'),
('2020-05-09'),
('2020-06-07'),
('2020-06-28'),
('2020-08-24'),
('2020-10-14'),
('2020-12-25'),
('2021-01-01'),
('2021-01-07'),
('2021-03-08'),
('2021-05-01'),
('2021-05-02'),
('2021-05-09'),
('2021-06-20'),
('2021-06-28'),
('2021-08-24'),
('2021-10-14'),
('2021-12-25')
