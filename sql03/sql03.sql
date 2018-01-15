--1번문제

select count(*)
from employees
where  salary <all(select avg(salary) from employees);

--2번문제

select employee_id, 
	   last_name, 
	   salary, 
	   department_id
from employees
where (department_id,salary) in(select department_id,
                                max(salary) 
                                from employees 
                                group by department_id)
order by salary desc;

--3번문제 

select j.job_title, 
       salary
from jobs j, (select job_id, 
                     sum(salary)salary 
              from employees 
              group by job_id)s 
where j.job_id = s.job_id
order by salary desc;

--4번문제

select e.employee_id, 
       e.last_name, 
       e.salary
from employees e, (select department_id, 
                          avg(salary)salary
                   from employees 
                   group by department_id)s
where e.department_id = s.department_id 
      and s.salary < e.salary;