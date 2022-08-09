
CREATE LOGIN Veronika WITH PASSWORD = '123';
GO
use PayDb
create user Nika for login Veronika

GO
CREATE LOGIN "root" WITH PASSWORD = 'root';
CREATE USER "root" FOR LOGIN "root";    
GO


CREATE LOGIN accountant WITH PASSWORD = 'accountant';
CREATE USER accountant FOR LOGIN accountant;  
GO

CREATE LOGIN assistant WITH PASSWORD = 'assistant';
CREATE USER assistant FOR LOGIN assistant;  
GO

CREATE LOGIN head_vacation WITH PASSWORD = 'head_vacation';
CREATE USER head_vacation FOR LOGIN head_vacation; 
GO

CREATE LOGIN statistician WITH PASSWORD = 'statistician';
CREATE USER statistician FOR LOGIN statistician;  
GO

-- Add user to the database owner role
EXEC sp_addrolemember N'db_owner', N'root'
GO

