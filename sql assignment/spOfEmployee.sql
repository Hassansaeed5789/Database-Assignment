--insert
EXEC [dbo].[uspOnTherTableEmployee]  @first_name='muhammad',@last_name='abdullah',@email='muhammadabdullah@gmail.com',
@phone_number='03083708442',@hire_date='2023-01-01',@job_id='sa-0050',@salary=70000,@manager_id=87,@department_id=6,
@Choice='insert'

-- update
EXEC [dbo].[uspOnTherTableEmployee] 
@employee_id=20,
@first_name='muneeb',@last_name='ali',@email='mueebali@gmail.com',
@phone_number='03083708443',@hire_date='2022-01-01',@job_id='sa-00500',@salary=170000,@manager_id=870,@department_id=6,
@Choice='update'

--delete
EXEC [dbo].[uspOnTherTableEmployee] @employee_id=26,@Choice='delete'


select * from Employees