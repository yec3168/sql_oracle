select department, employee, salary
from 
(
    select d.name as department,
                e.name as employee,
                e.salary as salary,
                dense_Rank() over(partition by e.departmentId order by e.salary desc) as rank
    from department d join employee e on d.id = e.departmentId
)
where rank <= 3