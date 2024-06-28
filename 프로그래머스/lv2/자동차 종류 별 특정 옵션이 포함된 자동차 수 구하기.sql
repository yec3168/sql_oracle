-- 코드를 입력하세요
SELECT car_type, count(car_type) as CARS
from  (select *
       from CAR_RENTAL_COMPANY_CAR 
       where options like '%시트%')
group by car_type 
order by car_type

-- -- 코드를 입력하세요 // 2개이상일때
-- SELECT car_type, count(car_type) as CARS
-- from  (select *
--        from CAR_RENTAL_COMPANY_CAR 
--        where options like '%시트%')
-- group by car_type 
-- having count(car_type) >= 3
-- order by car_type