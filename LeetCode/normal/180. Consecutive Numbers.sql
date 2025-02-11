/* Write your PL/SQL query statement below */

select distinct num as ConsecutiveNums 
from (
    select id,
            num,
            lead(num) over(order by id) as two,
            lead(num, 2) over(order by id) as three
    from logs
)
where num = two and two = three
