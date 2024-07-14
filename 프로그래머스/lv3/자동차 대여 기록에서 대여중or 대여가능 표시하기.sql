select car_id, (case when sum(availability) > 0 then '대여중' else '대여 가능' end) as AVAILABILITY
from (select car_id,  (case when to_char(start_date, 'YYYY-MM-DD') <='2022-10-16' and to_char(end_date, 'YYYY-MM-DD') >= '2022-10-16' then 1 else 0 end ) as AVAILABILITY 
      from car_rental_company_rental_history)
group by car_id
order by 1 desc

      
