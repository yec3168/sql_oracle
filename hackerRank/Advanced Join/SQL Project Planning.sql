select min(start_date), max(end_date)
from (select  start_date,
        end_date,
        start_date - row_number() over(order by start_date) as rn
      from projects)
group by rn
order by max(end_date) - min(start_date), 1;