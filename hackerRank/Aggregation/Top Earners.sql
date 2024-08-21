/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select max(salary * months), count(*)
from employee
where salary*months = (select max(salary * months) from employee);