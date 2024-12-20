# Write your MySQL query statement below
select  max(Salary) as SecondHighestSalary 
from  ( select distinct *
        from Employee ) as emp
where salary NOT IN (SELECT MAX(SALARY) 
                      from employee)
