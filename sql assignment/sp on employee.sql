SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE uspOnTherTableEmployee
	-- Add the parameters for the stored procedure here
	@employee_id int =0,
	@first_name varchar(50)=null,
	@last_name varchar(50)=null,
	@email varchar(50)=null,
	@phone_number varchar(30)=null,
	@hire_date date=null,
	@job_id varchar(30)=null,
	@salary int=0,
	@manager_id int =0,
	@department_id int=0,
    @Choice varchar(100)
	
AS
BEGIN
	
	SET NOCOUNT ON;

	if @Choice='insert'
	begin
	insert into Employees(first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
	values (@first_name,@last_name,@email,@phone_number,@hire_date,@job_id,@salary,@manager_id,@department_id)
	end

	if @Choice='update'
	begin
	update Employees set
	first_name=@first_name,last_name=@last_name,email=@email,phone_number=@phone_number,hire_date=@hire_date,job_id=@job_id,salary=@salary,manager_id=@manager_id,department_id=@department_id
	where department_id=@department_id
	end
	if @Choice='delete'
	begin
	delete from Employees where employee_id=@employee_id
	end
END
GO