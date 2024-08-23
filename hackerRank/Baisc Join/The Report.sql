/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

--Ketty doesn't want the NAMES of those students who received a grade lower than 8.

select (case when grade <8 then NULL else name end), grade, marks
from (select id, name, marks, (case when marks between min_mark and max_mark then grade else NULL end) grade
    from students, grades)
where grade is not NULL 
order by 2 desc , 1, 3;
