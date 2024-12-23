/* Write your PL/SQL query statement below */

with w as(
    select turn,
            person_name ,
            weight,
            sum(weight) over(order by turn) as total_weight
    from Queue ;
)

select person_name
from w
where turn like ( select max(turn)
                  from w
                  where total_weight <= 1000)
 