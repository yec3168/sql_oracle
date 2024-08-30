/* Write your PL/SQL query statement below */

select firstname, lastname, a.city, a.state
from person p left join address a on p.personId = a.personId;