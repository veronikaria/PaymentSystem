
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

INSERT INTO HoursEmployee
("Date", EmployeeId, "Hours")
VALUES
('2020-08-25', 1, 8),
('2020-08-26', 1, 8),
('2020-08-27', 1, 8),
('2020-08-28', 1, 8),
('2020-08-29', 1, 0),
('2020-08-30', 1, 0),
('2020-08-31', 1, 8),
('2020-09-01', 1, 8),
('2020-09-02', 1, 8),
('2020-09-03', 1, 8),
('2020-09-04', 1, 8),
('2020-09-05', 1, 2),
('2020-09-06', 1, 0),
('2020-09-07', 1, 8),
('2020-09-08', 1, 9),
('2020-09-09', 1, 8),
('2020-09-10', 1, 8),
('2020-09-11', 1, 10),
('2020-09-12', 1, 4),
('2020-09-13', 1, 0),
('2020-09-14', 1, 8),
('2020-09-15', 1, 8),
('2020-09-16', 1, 8),
('2020-09-17', 1, 10),
('2020-09-18', 1, 8),
('2020-09-19', 1, 12),
('2020-09-20', 1, 0),
('2020-09-21', 1, 8),
('2020-09-22', 1, 8),
('2020-09-23', 1, 6),
('2020-09-24', 1, 8),
('2020-09-25', 1, 8),
('2020-09-26', 1, 0),
('2020-09-27', 1, 2),
('2020-09-28', 1, 8),
('2020-09-29', 1, 8),
('2020-09-30', 1, 8),
('2020-10-01', 1, 8),
('2020-10-02', 1, 8),
('2020-10-03', 1, 0),
('2020-10-04', 1, 0),
('2020-10-05', 1, 8),
('2020-10-06', 1, 7),
('2020-10-07', 1, 7),
('2020-10-08', 1, 8),
('2020-10-09', 1, 8),
('2020-10-10', 1, 0),
('2020-10-11', 1, 2),
('2020-10-12', 1, 8),
('2020-10-13', 1, 8),
('2020-10-14', 1, 8),
('2020-10-15', 1, 7),
('2020-10-16', 1, 8),
('2020-10-17', 1, 0),
('2020-10-18', 1, 0),
('2020-10-19', 1, 8),
('2020-10-20', 1, 8),
('2020-10-21', 1, 3),
('2020-10-22', 1, 8),
('2020-10-23', 1, 8),
('2020-10-24', 1, 0),
('2020-10-25', 1, 0),
('2020-10-26', 1, 7),
('2020-10-27', 1, 8),
('2020-10-28', 1, 8),
('2020-10-29', 1, 8),
('2020-10-30', 1, 8),
('2020-10-31', 1, 0),
('2020-11-01', 1, 0),
('2020-11-02', 1, 5),
('2020-11-03', 1, 12),
('2020-11-04', 1, 8),
('2020-11-05', 1, 8),
('2020-11-06', 1, 8),
('2020-11-07', 1, 0),
('2020-11-08', 1, 1),
('2020-11-09', 1, 8),
('2020-11-10', 1, 8),
('2020-11-11', 1, 4),
('2020-11-12', 1, 8),
('2020-11-13', 1, 8),
('2020-11-14', 1, 0),
('2020-11-15', 1, 0),
('2020-11-16', 1, 8),
('2020-11-17', 1, 8),
('2020-11-18', 1, 8),
('2020-11-19', 1, 8),
('2020-11-20', 1, 2),
('2020-11-21', 1, 0),
('2020-11-22', 1, 0),
('2020-11-23', 1, 8),
('2020-11-24', 1, 8),
('2020-11-25', 1, 8),
('2020-11-26', 1, 6),
('2020-11-27', 1, 8),
('2020-11-28', 1, 0),
('2020-11-29', 1, 0),
('2020-11-30', 1, 8),
('2020-12-01', 1, 8),
('2020-12-02', 1, 8),
('2020-12-03', 1, 8),
('2020-12-04', 1, 7),
('2020-12-05', 1, 0),
('2020-12-06', 1, 1),
('2020-12-07', 1, 8),
('2020-12-08', 1, 8),
('2020-12-09', 1, 8),
('2020-12-10', 1, 8),
('2020-12-11', 1, 8),
('2020-12-12', 1, 2),
('2020-12-13', 1, 0),
('2020-12-14', 1, 8),
('2020-12-15', 1, 8),
('2020-12-16', 1, 9),
('2020-12-17', 1, 8),
('2020-12-18', 1, 8),
('2020-12-19', 1, 0),
('2020-12-20', 1, 1),
('2020-12-21', 1, 8),
('2020-12-22', 1, 8),
('2020-12-23', 1, 8),
('2020-12-24', 1, 8),
('2020-12-25', 1, 8),
('2020-12-26', 1, 0),
('2020-12-27', 1, 0),
('2020-12-28', 1, 8),
('2020-12-29', 1, 8),
('2020-12-30', 1, 8),
('2020-12-31', 1, 8),
('2021-01-01', 1, 0),
('2021-01-02', 1, 0),
('2021-01-03', 1, 0),
('2021-01-04', 1, 2),
('2021-01-05', 1, 8),
('2021-01-06', 1, 8),
('2021-01-07', 1, 2),
('2021-01-08', 1, 8),
('2021-01-09', 1, 0),
('2021-01-10', 1, 0),
('2021-01-11', 1, 9),
('2021-01-12', 1, 8),
('2021-01-13', 1, 8),
('2021-01-14', 1, 5),
('2021-01-15', 1, 8),
('2021-01-16', 1, 0),
('2021-01-17', 1, 0),
('2021-01-18', 1, 8),
('2021-01-19', 1, 8),
('2021-01-20', 1, 8),
('2021-01-21', 1, 8),
('2021-01-22', 1, 8),
('2021-01-23', 1, 2),
('2021-01-24', 1, 0),
('2021-01-25', 1, 8),
('2021-01-26', 1, 8),
('2021-01-27', 1, 8),
('2021-01-28', 1, 8),
('2021-01-29', 1, 8),
('2021-01-30', 1, 0),
('2021-01-31', 1, 0),
('2021-02-01', 1, 10),
('2021-02-02', 1, 8),
('2021-02-03', 1, 8),
('2021-02-04', 1, 8),
('2021-02-05', 1, 8),
('2021-02-06', 1, 0),
('2021-02-07', 1, 0),
('2021-02-08', 1, 8),
('2021-02-09', 1, 8),
('2021-02-10', 1, 8),
('2021-02-11', 1, 11),
('2021-02-12', 1, 8),
('2021-02-13', 1, 0),
('2021-02-14', 1, 2),
('2021-02-15', 1, 8),
('2021-02-16', 1, 8),
('2021-02-17', 1, 8),
('2021-02-18', 1, 8),
('2021-02-19', 1, 8),
('2021-02-20', 1, 0),
('2021-02-21', 1, 0),
('2021-02-22', 1, 3),
('2021-02-23', 1, 8),
('2021-02-24', 1, 8),
('2021-02-25', 1, 8),
('2021-02-26', 1, 8),
('2021-02-27', 1, 0),
('2021-02-28', 1, 0),
('2021-03-01', 1, 8),
('2021-03-02', 1, 8),
('2021-03-03', 1, 8),
('2021-03-04', 1, 8),
('2021-03-05', 1, 8),
('2021-03-06', 1, 0),
('2021-03-07', 1, 0),
('2021-03-08', 1, 3),
('2021-03-09', 1, 9),
('2021-03-10', 1, 8),
('2021-03-11', 1, 8),
('2021-03-12', 1, 8),
('2021-03-13', 1, 2),
('2021-03-14', 1, 0),
('2021-03-15', 1, 8),
('2021-03-16', 1, 8),
('2021-03-17', 1, 8),
('2021-03-18', 1, 8),
('2021-03-19', 1, 8),
('2021-03-20', 1, 0),
('2021-03-21', 1, 0),
('2021-03-22', 1, 8),
('2021-03-23', 1, 7),
('2021-03-24', 1, 8),
('2021-03-25', 1, 8),
('2021-03-26', 1, 8),
('2021-03-27', 1, 0),
('2021-03-28', 1, 0),
('2021-03-29', 1, 8),
('2021-03-30', 1, 8),
('2021-03-31', 1, 8),
('2021-04-01', 1, 8),
('2021-04-02', 1, 8),
('2021-04-03', 1, 0),
('2021-04-04', 1, 0),
('2021-04-05', 1, 8),
('2021-04-06', 1, 8),
('2021-04-07', 1, 8),
('2021-04-08', 1, 8),
('2021-04-09', 1, 8),
('2021-04-10', 1, 0),
('2021-04-11', 1, 0),
('2021-04-12', 1, 8),
('2021-04-13', 1, 7),
('2021-04-14', 1, 8),
('2021-04-15', 1, 8),
('2021-04-16', 1, 8),
('2021-04-17', 1, 2),
('2021-04-18', 1, 0),
('2021-04-19', 1, 8),
('2021-04-20', 1, 4),
('2021-04-21', 1, 8),
('2021-04-22', 1, 8),
('2021-04-23', 1, 8),
('2021-04-24', 1, 2),
('2021-04-25', 1, 0),
('2021-04-26', 1, 6),
('2021-04-27', 1, 8),
('2021-04-28', 1, 8),
('2021-04-29', 1, 8),
('2021-04-30', 1, 8),
('2021-05-01', 1, 0),
('2021-05-02', 1, 0),
('2021-05-03', 1, 8),
('2021-05-04', 1, 8),
('2021-05-05', 1, 8),
('2021-05-06', 1, 8),
('2021-05-07', 1, 8),
('2021-05-08', 1, 0),
('2021-05-09', 1, 0),
('2021-05-10', 1, 8),
('2021-05-11', 1, 8),
('2021-05-12', 1, 9),
('2021-05-13', 1, 8),
('2021-05-14', 1, 8),
('2021-05-15', 1, 0),
('2021-05-16', 1, 2),
('2021-05-17', 1, 8),
('2021-05-18', 1, 8),
('2021-05-19', 1, 8),
('2021-05-20', 1, 8),
('2021-05-21', 1, 8),
('2021-05-22', 1, 0),
('2021-05-23', 1, 0),
('2021-05-24', 1, 8),
('2021-05-25', 1, 8),
('2021-05-26', 1, 8),
('2021-05-27', 1, 8),
('2021-05-28', 1, 8),
('2021-05-29', 1, 0),
('2021-05-30', 1, 0),
('2021-05-31', 1, 8),
('2021-06-01', 1, 8),
('2021-06-02', 1, 8),
('2021-06-03', 1, 8),
('2021-06-04', 1, 8),
('2021-06-05', 1, 0),
('2021-06-06', 1, 2),
('2021-06-07', 1, 12),
('2021-06-08', 1, 8),
('2021-06-09', 1, 8),
('2021-06-10', 1, 8),
('2021-06-11', 1, 8),
('2021-06-12', 1, 0),
('2021-06-13', 1, 0),
('2021-06-14', 1, 8),
('2021-06-15', 1, 8),
('2021-06-16', 1, 8),
('2021-06-17', 1, 8),
('2021-06-18', 1, 8),
('2021-06-19', 1, 0),
('2021-06-20', 1, 0),
('2021-06-21', 1, 2),
('2021-06-22', 1, 8),
('2021-06-23', 1, 8),
('2021-06-24', 1, 8),
('2021-06-25', 1, 8),
('2021-06-26', 1, 0),
('2021-06-27', 1, 1),
('2021-06-28', 1, 2),
('2021-06-29', 1, 8),
('2021-06-30', 1, 10),
('2021-07-01', 1, 8),
('2021-07-02', 1, 8),
('2021-07-03', 1, 0),
('2021-07-04', 1, 0),
('2021-07-05', 1, 8),
('2021-07-06', 1, 8),
('2021-07-07', 1, 6),
('2021-07-08', 1, 8),
('2021-07-09', 1, 9),
('2021-07-10', 1, 0),
('2021-07-11', 1, 0),
('2021-07-12', 1, 8),
('2021-07-13', 1, 8),
('2021-07-14', 1, 8),
('2021-07-15', 1, 11),
('2021-07-16', 1, 8),
('2021-07-17', 1, 0),
('2021-07-18', 1, 0),
('2021-07-19', 1, 8),
('2021-07-20', 1, 8),
('2021-07-21', 1, 8),
('2021-07-22', 1, 0),
('2021-07-23', 1, 8),
('2021-07-24', 1, 0),
('2021-07-25', 1, 0),
('2021-07-26', 1, 8),
('2021-07-27', 1, 8),
('2021-07-28', 1, 8),
('2021-07-29', 1, 8),
('2021-07-30', 1, 6),
('2021-07-31', 1, 0),
('2021-08-01', 1, 0),
('2021-08-02', 1, 8),
('2021-08-03', 1, 9),
('2021-08-04', 1, 8),
('2021-08-05', 1, 8),
('2021-08-06', 1, 8),
('2021-08-07', 1, 0),
('2021-08-08', 1, 0),
('2021-08-09', 1, 8),
('2021-08-10', 1, 8),
('2021-08-11', 1, 8),
('2021-08-12', 1, 6),
('2021-08-13', 1, 8),
('2021-08-14', 1, 2),
('2021-08-15', 1, 0),
('2021-08-16', 1, 8),
('2021-08-17', 1, 8),
('2021-08-18', 1, 8),
('2021-08-19', 1, 8),
('2021-08-20', 1, 8),
('2021-08-21', 1, 0),
('2021-08-22', 1, 0),
('2021-08-23', 1, 9),
('2021-08-24', 1, 2),
('2021-08-25', 1, 4),
('2021-08-26', 1, 8),
('2021-08-27', 1, 12),
('2021-08-28', 1, 0),
('2021-08-29', 1, 2),
('2021-08-30', 1, 8),
('2021-08-31', 1, 8),
('2021-09-01', 1, 8),
('2021-09-02', 1, 8),
('2021-09-03', 1, 8),
('2021-09-04', 1, 0),
('2021-09-05', 1, 0),
('2021-09-06', 1, 8),
('2021-09-07', 1, 8),
('2021-09-08', 1, 8),
('2021-09-09', 1, 8),
('2021-09-10', 1, 8),
('2021-09-11', 1, 0),
('2021-09-12', 1, 0),
('2021-09-13', 1, 8),
('2021-09-14', 1, 8),
('2021-09-15', 1, 8),
('2021-09-16', 1, 6),
('2021-09-17', 1, 8),
('2021-09-18', 1, 2),
('2021-09-19', 1, 0),
('2021-09-20', 1, 8),
('2021-09-21', 1, 8),
('2021-09-22', 1, 8),
('2021-09-23', 1, 8),
('2021-09-24', 1, 8),
('2021-09-25', 1, 0),
('2021-09-26', 1, 0),
('2021-09-27', 1, 8),
('2021-09-28', 1, 8),
('2021-09-29', 1, 8),
('2021-09-30', 1, 8),
('2021-10-01', 1, 0),
('2021-10-02', 1, 0),
('2021-10-03', 1, 8),
('2021-10-04', 1, 8),
('2021-10-05', 1, 5),
('2021-10-06', 1, 8),
('2021-10-07', 1, 9),
('2021-10-08', 1, 2),
('2021-10-09', 1, 0),
('2021-10-10', 1, 8),
('2021-08-01', 2, 0),
('2021-08-02', 2, 8),
('2021-08-03', 2, 5),
('2021-08-04', 2, 8),
('2021-08-05', 2, 8),
('2021-08-06', 2, 8),
('2021-08-07', 2, 0),
('2021-08-08', 2, 3),
('2021-08-09', 2, 8),
('2021-08-10', 2, 8),
('2021-08-11', 2, 8),
('2021-08-12', 2, 7),
('2021-08-13', 2, 8),
('2021-08-14', 2, 2),
('2021-08-15', 2, 0),
('2021-08-16', 2, 8),
('2021-08-17', 2, 8),
('2021-08-18', 2, 8),
('2021-08-19', 2, 7),
('2021-08-20', 2, 8),
('2021-08-21', 2, 0),
('2021-08-22', 2, 2),
('2021-08-23', 2, 9),
('2021-08-24', 2, 2),
('2021-08-25', 2, 4),
('2021-08-26', 2, 8),
('2021-08-27', 2, 4),
('2021-08-28', 2, 0),
('2021-08-29', 2, 2),
('2021-08-30', 2, 8),
('2021-08-31', 2, 8),
('2021-09-01', 2, 8),
('2021-09-02', 2, 8),
('2021-09-03', 2, 4),
('2021-09-04', 2, 0),
('2021-09-05', 2, 4),
('2021-09-06', 2, 8),
('2021-09-07', 2, 8),
('2021-09-08', 2, 8),
('2021-09-09', 2, 8),
('2021-09-10', 2, 12),
('2021-09-11', 2, 2),
('2021-09-12', 2, 0),
('2021-09-13', 2, 8),
('2021-09-14', 2, 8),
('2021-09-15', 2, 8),
('2021-09-16', 2, 8),
('2021-09-17', 2, 8),
('2021-09-18', 2, 2),
('2021-09-19', 2, 0),
('2021-09-20', 2, 8),
('2021-09-21', 2, 8),
('2021-09-22', 2, 8),
('2021-09-23', 2, 8),
('2021-09-24', 2, 7),
('2021-09-25', 2, 0),
('2021-09-26', 2, 0),
('2021-09-27', 2, 8),
('2021-09-28', 2, 8),
('2021-09-29', 2, 8),
('2021-09-30', 2, 8),
('2021-10-01', 2, 0),
('2021-10-02', 2, 0),
('2021-10-03', 2, 8),
('2021-10-04', 2, 8),
('2021-10-05', 2, 8),
('2021-10-06', 2, 8),
('2021-10-07', 2, 7),
('2021-10-08', 2, 0),
('2021-10-09', 2, 0),
('2021-10-10', 2, 8)

INSERT INTO MinimumSalary
(DateStart, DateEnd, MinSalary)
VALUES
('2020-09-01', '2020-12-31', 5000),
('2021-01-01', '2020-11-30', 6000),
('2021-01-12', '2020-12-31', 6500)
