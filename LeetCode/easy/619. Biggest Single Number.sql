/* Write your PL/SQL query statement below */

select nvl(max(num), NULL) as num
from (select num, count(num) as cnt
        from mynumbers
        group by num )
where cnt < 2
