/* Write your PL/SQL query statement below */
select visited_on+6
from customer
group by visited_on    
having visited_on + 6 <= max(visited_on)
