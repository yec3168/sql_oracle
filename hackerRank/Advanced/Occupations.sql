/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
select MAX(case when occupation = 'Doctor' then name end),
        MAX(case when occupation = 'Professor' then name end),
        MAX(case when occupation = 'Singer' then name end),
        MAX(case when occupation = 'Actor' then name end)
from ( select 
            name, 
            occupation,
            ROW_NUMBER() OVER(partition by occupation order by name ) as num
       from occupations)
group by num
order by num;