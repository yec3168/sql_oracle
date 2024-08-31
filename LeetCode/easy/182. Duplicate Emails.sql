/* Write your PL/SQL query statement below */

select email
from (select email, count(id) as cnt
        from person
        group by email)
where cnt >=2;