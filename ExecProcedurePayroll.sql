
-- Additional data for Payroll procedure

  insert into WorkingHours
  (WorkingDate, EmployeeId, HoursMain, HoursAdditional, HoursHoliday)
  values
  ('2021-11-01', 1, 78, 2, 0),
  ('2021-11-01', 2, 58, 6, 0),
  ('2021-11-01', 3, 142, 0, 1),
  ('2021-12-01', 1, 138, 5, 0),
  ('2021-12-01', 2, 152, 1, 0),
  ('2021-12-01', 3, 64, 0, 2)

-- Execution the Payroll procedure

EXEC Payroll '2021-11-01', 1
EXEC Payroll '2021-11-01', 2
EXEC Payroll '2021-11-01', 3

select * from Delivery
