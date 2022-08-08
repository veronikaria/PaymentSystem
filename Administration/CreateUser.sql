
CREATE LOGIN Veronika WITH PASSWORD = '123';
GO
use PayDb
create user Nika for login Veronika

USE PayDb
GRANT INSERT ON Delivery TO Nika;
GRANT INSERT ON Employee TO Nika;
GRANT INSERT ON Pay TO Nika;
GRANT INSERT ON Post TO Nika;
GRANT INSERT ON Subdivision TO Nika;
GRANT INSERT ON Vacation TO Nika;
GRANT INSERT ON WorkingHours TO Nika;
GRANT INSERT ON Holiday TO Nika;
GRANT INSERT ON Weekend TO Nika;

USE PayDb
GRANT SELECT ON Delivery TO Nika;
GRANT SELECT ON Employee TO Nika;
GRANT SELECT ON Pay TO Nika;
GRANT SELECT ON Post TO Nika;
GRANT SELECT ON Subdivision TO Nika;
GRANT SELECT ON Vacation TO Nika;
GRANT SELECT ON WorkingHours TO Nika;
GRANT SELECT ON Holiday TO Nika;
GRANT SELECT ON Weekend TO Nika;

USE PayDb
GRANT UPDATE ON Employee TO Nika;
GRANT UPDATE ON Delivery TO Nika;
GRANT UPDATE ON Vacation TO Nika;
GRANT UPDATE ON WorkingHours TO Nika;
