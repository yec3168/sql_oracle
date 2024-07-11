-- 코드를 입력하세요
SELECT car_id, round(avg(duration), 1) as AVERAGE_DURATION
from (select car_id, end_date - start_date+1 as duration
      from CAR_RENTAL_COMPANY_RENTAL_HISTORY )
group by car_id
having avg(duration) >= 7
order by 2 desc, 1 desc