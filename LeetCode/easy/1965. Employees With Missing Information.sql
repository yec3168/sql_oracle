/* Write your PL/SQL query statement below */
select case
            when e.employee_id is null then s.employee_id
            when s.employee_id is null then e.employee_id
        end as employee_id
from employees e full outer join salaries s on e.employee_id = s.employee_id
where name is null or salary is null
order by 1;