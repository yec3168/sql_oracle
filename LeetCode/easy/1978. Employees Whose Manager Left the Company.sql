/* Write your PL/SQL query statement below */
select e2.employee_id as employee_id
from employees e1 right join (select * from employees where salary < 30000 and manager_id is not null) e2 on e1.employee_id = e2.manager_id
where e1.employee_id is null
order by 1; 
