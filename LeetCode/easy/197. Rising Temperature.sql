/* Write your PL/SQL query statement below */

select next_id as id
from (select id, 
        recordDate , 
        temperature, 
        lead(id) over(order by recordDate) as next_id,
        lead(recordDate) over(order by recordDate) as next_recordDate,
        lead(temperature) over(order by recordDate) as next_temperature
      from weather)
where  (next_recordDate - recordDate) = 1 and temperature < next_temperature;