/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select s.name
from(select f.id, p2.salary
    from friends f inner join Packages p1 on f.id = p1.id
                    inner join Packages p2 on f.friend_id = p2.id
    where p1.salary < p2.salary) f inner join students s on f.id = s.id
order by f.salary ;