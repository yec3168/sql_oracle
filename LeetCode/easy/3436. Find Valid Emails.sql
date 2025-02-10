/* Write your PL/SQL query statement below */

select *
from Users
where email like ( '%@%') and substr(email, -4) like ('.com')  
order by 1