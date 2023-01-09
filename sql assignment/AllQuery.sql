use MangementSystem

select* from Employees 
select salary from Employees order by salary desc
                          -- Quearary no-1
select first_name,last_name,job_id,salary from Employees
where first_name like 'p%';

                           -- Quearary no-2

select top 1 * from Employees order by salary desc	;
              
			               -- Quearary no-3

select  * from Employees order by salary desc OFFSET 1 ROWS FETCH FIRST 1 ROWS ONLY;

                           -- Quearary no-4

select  * from Employees order by salary desc OFFSET 1 ROWS FETCH FIRST 2 ROWS ONLY;

                          --  Quearary no-5
select employee_id,first_name,manager_id,salary from Employees 
where manager_id is not null
order by employee_id
                          --  Quearary no-6

select manager_id,department_id,COUNT(*)  from Employees
where manager_id is not null
group by department_id,manager_id
order by 
manager_id desc


                         --  Quearary no-7
SELECT department_id, COUNT(*) AS EmployeesInEachDepartment FROM Employees GROUP BY department_id;

                          --  Quearary no-8

SELECT hire_date, COUNT(*) AS EmployeesInEachDepartment FROM Employees GROUP BY hire_date;

SELECT *
FROM Employees
WHERE hire_date= '2022-08'

                             --Quearary no-9
select employee_id,salary from Employees
where salary between 20000 and 50000
order by employee_id


SELECT *
FROM employees
 where CONVERT ( char ,hire_date,'DD') > '19';
                             --Quearary no-10
select case when salary <= 20000 then 'min' when (salary > 20000 and salary < 60000) then 'avg'
else 'max' end as Salaries, salary from Employees

                             -- Quearary no-11

select first_name,last_name,job_id,salary from Employees
where first_name like '%an%';

                             --Quearary no-12
SELECT
    phone_number,
    CONCAT(
        
        substring(phone_number, 1, 3),
         '-',
        substring(phone_number, 4, 3),
        '-',
        substring(phone_number, 7,4)
    ) AS num_formatted
FROM
    Employees
                            --Quearary no-13
select* from Employees where hire_date like'2022-08%'

                         

                            -- Quearary no-14
select employee_id,first_name,last_name,AVG(salary)as aboveAvgSalary from Employees
where 
salary>(select AVG(salary) from Employees)
group by
employee_id,first_name,last_name
order by aboveAvgSalary
                            -- Quearary no-15
select department_id,max(salary) from Employees
group by department_id
                                 -- Quearary no-16
SELECT *
FROM employees e
WHERE 5>
    (SELECT count(*)
     FROM employees
     WHERE e.salary >salary);
	 
                      -- Quearary no-17                    

select * from  Employees where hire_date between '2018' and '2021';

                           
                           -- Quearary no-18
select first_name ,REVERSE(first_name) as NameInReversOrder from Employees
                            -- Quearary no-19
select * ,day(hire_date) from Employees where day(hire_date)>15
                            -- Quearary no-20
select first_name,manager_id,department_id from Employees
order by manager_id desc