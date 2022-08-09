
EXEC sp_droprolemember CustTableReader, assistant
EXEC sp_droprolemember CustTableReader, accountant
EXEC sp_droprolemember CustTableReader, head_vacation
EXEC sp_droprolemember CustTableReader, statistician

EXEC sp_droprolemember ControlVacation, head_vacation

EXEC sp_droprolemember ControlSalaryDelivery, accountant
EXEC sp_droprolemember ControlSalaryDelivery, assistant


EXEC sp_droprole CustTableReader
EXEC sp_droprole ControlVacation
EXEC sp_droprole ControlSalaryDelivery

-- check
select Princi.name [User Name], Roles.name [DB_Role] 
from sys.database_principals Princi 
inner join sys.database_role_members Memb 
on princi.principal_id = Memb.member_principal_id 
inner join(
	select name, principal_id 
	from sys.database_principals 
	where type_desc = 'DATABASE_ROLE'
) Roles 
on memb.role_principal_id = roles.principal_id

-- check
select name as username,
       create_date,
       modify_date,
       type_desc as type,
       authentication_type_desc as authentication_type
from sys.database_principals
where type not in ('A', 'G', 'R', 'X')
      and sid is not null
      and name != 'guest'
order by username;


DROP USER accountant
DROP USER assistant
DROP USER head_vacation
DROP USER statistician

-- check
select name as username,
       create_date,
       modify_date,
       type_desc as type,
       authentication_type_desc as authentication_type
from sys.database_principals
where type not in ('A', 'G', 'R', 'X')
      and sid is not null
      and name != 'guest'
order by username;

