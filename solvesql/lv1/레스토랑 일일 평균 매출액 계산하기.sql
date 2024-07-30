select round(avg(sum),2) as avg_sales
from (select day, sum(total_bill) as sum
      from tips
      GROUP by  day)