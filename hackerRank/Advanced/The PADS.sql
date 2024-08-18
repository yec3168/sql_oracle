/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select  name || '(' || substr(OCCUPATION, 1,  1) || ')' 
from OCCUPATIONS
order by name,  substr(OCCUPATION, 1,  1);

select  'There are a total of ' || count(occupation) || ' ' || lower(occupation) ||'s.'
from occupations
group by occupation
order by count(name), occupation;