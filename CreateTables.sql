CREATE DATABASE PayDb
USE PayDb

CREATE TABLE Subdivision(
	SubdivisionId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	"Name" NVARCHAR(50) NOT NULL,
	LeaderId INT NOT NULL
);

CREATE TABLE Post(
	PostId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	"Name" NVARCHAR(70) NOT NULL
)

CREATE TABLE Employee(
	EmployeeId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	SubdivisionId INT NOT NULL,
	PostId INT NOT NULL,
	RegistrationNumber INT UNIQUE NOT NULL,
	LastName NVARCHAR(30) NOT NULL,
	FirstName NVARCHAR(30) NOT NULL,
	MiddleName NVARCHAR(30) NOT NULL,
	Passport CHAR(9) NOT NULL UNIQUE,
	Birthday DATE NULL,
	City NVARCHAR(50) NULL,
	"Address" NVARCHAR(70) NULL
);

CREATE SEQUENCE RegistrationSequence
     START WITH 10000
     INCREMENT BY 1;

CREATE TABLE Pay(
	PayId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	PostId INT NOT NULL,
	TariffMain MONEY NOT NULL,
	TariffAdditional AS TariffMain*2,
	TariffHoliday AS TariffMain*3
);

CREATE TABLE WorkingHours(
	WorkingHoursId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	WorkingDate DATE NOT NULL,
	EmployeeId INT NOT NULL,
	HoursMain INT NOT NULL,
	HoursAdditional INT DEFAULT 0,
	HoursHoliday INT DEFAULT 0,
	SalaryWithTax MONEY,
	SalaryWithoutTax AS SalaryWithTax*0.8
);

CREATE TABLE Vacation(
	VacationId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	EmployeeId INT NOT NULL,
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,
	Payment MONEY,
	CHECK(EndDate>StartDate)
);

CREATE TABLE Delivery(
	DeliveryId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	EmployeeId INT NOT NULL,
	"Date" DATE NOT NULL,
	Salary MONEY,
	SalaryEnd AS CASE WHEN DAY(Date)<=10 THEN Salary ELSE Salary*1.01 END
);

CREATE TABLE Weekend
(
	WeekendId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	"Date" DATE NOT NULL,
	"Year" AS YEAR("Date"),
	"Month" AS MONTH("Date"),
	"Day" AS DAY("Date")
)

CREATE TABLE HoursEmployee(
	HoursEmployeeId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	"Date" DATE NOT NULL,
	EmployeeId INT NOT NULL,
	"Hours" INT NOT NULL
);

CREATE TABLE Holiday
(
	HolidayId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	"Date" DATE NOT NULL,
	"Year" AS YEAR("Date"),
	"Month" AS MONTH("Date"),
	"Day" AS DAY("Date")
)

CREATE TABLE MinimumSalary
(
	MinimumSalaryId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	DateStart DATE,
	DateEnd DATE,
	MinSalary MONEY 
)

ALTER TABLE Employee
ADD FOREIGN KEY (SubdivisionId) REFERENCES Subdivision(SubdivisionId);

ALTER TABLE Employee
ADD FOREIGN KEY (PostId) REFERENCES Post(PostId);

ALTER TABLE Pay
ADD FOREIGN KEY (PostId) REFERENCES Post(PostId);

ALTER TABLE WorkingHours
ADD FOREIGN KEY (EmployeeId) REFERENCES Employee(EmployeeId);

ALTER TABLE Vacation
ADD FOREIGN KEY (EmployeeId) REFERENCES Employee(EmployeeId);

ALTER TABLE Delivery
ADD FOREIGN KEY (EmployeeId) REFERENCES Employee(EmployeeId);
