/* Write your PL/SQL query statement below */
select d.name as Department ,
            e.name as Employee ,
            e.salary
from 
(
    select * 
    from employee
    where (departmentId, salary) in ( select departmentId, max(salary)
                                        from employee
                                        group by departmentId)
)  e join department d on e.departmentId = d.id;
