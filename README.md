### PaymentSystem

The company have employees each of whom belongs to a certain structural unit. Each structural unit has its own name, code, head. 
Each employee works in a certain position and he is characterized by a report card number, surname, first name, patronymic, passport data, date and place of birth, home address.
The following forms of payment are established at the company:
  * Basic salary in the form of hourly payment for each hour worked, and each position has its own hourly rate.
  * Additional salary - payment for work in excess of the established norms, which consists of double payment for each additional hour worked on a weekend (Saturday, Sunday) and a holiday.
____
An employee has a vacation every year. The system must store data on employee vacations. No more than 15% of the employees of one department can be on vacation at the same time. 
Vacations are paid as follows: $S = M/(365-C)*N$, where $S$ is the amount of vacation pay, $M$ is the total earnings of the employee for the last 12 months, $365$ is the number of days in a year, $C$ is the number of holidays, $N$ is the duration of the vacation in calendar days.
  
  The system must keep track of working hours (actual hours worked by the employee for each day), calculate the monthly salary for all employees, calculate for each employee the salary before handover (the salary before handover is the accrued salary minus the social tax of 20%) .  
  The system must record the payment of the employee's salary.  
  The following additional restrictions must apply in the system: an employee cannot work in several departments and in several positions at the same time; the employee's basic salary cannot be less than the established minimum salary, the employee is prohibited from accruing salary after his dismissal; salary payments to employees must be made no later than the 10th day of the following month, in case of violation of this rule, a penalty in the amount of 0.1% of the amount owed for each overdue day is added to the employee's salary for the current month.  
  
  The system should provide the following reports:
* Payroll for the department
* Information on receipt of wages for the department
* Information about the employee's work during a certain period
* Information on the company's debt to employees
