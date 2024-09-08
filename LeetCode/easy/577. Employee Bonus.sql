/* Write your PL/SQL query statement below */
select e.name, b.bonus
from Employee e left join bonus b on e.empId = b.empid
where b.bonus < 1000 or b.bonus is null