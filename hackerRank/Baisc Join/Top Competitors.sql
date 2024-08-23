/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select h.hacker_id, h.name
from challenges c inner join difficulty d on d.difficulty_level = c.difficulty_level 
    inner join submissions s on c.challenge_id = s.challenge_id and s.score = d.score
    inner join hackers h on h.hacker_id = s.hacker_id 
group by h.hacker_id, h.name
having count(s.submission_id) > 1
order by count(s.submission_id) desc, 1;
