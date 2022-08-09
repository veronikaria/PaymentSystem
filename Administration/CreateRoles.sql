
CREATE ROLE CustTableReader
CREATE ROLE ControlVacation
CREATE ROLE ControlSalaryDelivery

ALTER ROLE CustTableReader ADD MEMBER accountant
ALTER ROLE CustTableReader ADD MEMBER assistant
ALTER ROLE CustTableReader ADD MEMBER head_vacation
ALTER ROLE CustTableReader ADD MEMBER statistician


ALTER ROLE ControlVacation ADD MEMBER head_vacation

ALTER ROLE ControlSalaryDelivery ADD MEMBER assistant
ALTER ROLE ControlSalaryDelivery ADD MEMBER accountant
