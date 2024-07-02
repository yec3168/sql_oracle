-- 코드를 입력하세요
SELECT  DISTINCT i.car_id
from CAR_RENTAL_COMPANY_CAR i inner join CAR_RENTAL_COMPANY_RENTAL_HISTORY h on i.car_id= h.car_id
where to_char(h.start_date, 'MM') like '10' and i.car_type like '세단'
order by car_id desc