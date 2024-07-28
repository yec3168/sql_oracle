-- 코드를 입력하세요
select history_id, (case when duration =0 then daily_fee
                        when DISCOUNT_RATE = 0 then daily_fee * duration 
                        else (daily_fee - daily_fee *(DISCOUNT_RATE/100)) *duration end ) as fee
from(select daily_fee,	history_id, 	h.duration, nvl(discount_rate, 0) as DISCOUNT_RATE
from (select  DAILY_FEE, history_id, end_date- start_date+1 as duration, (case when end_date- start_date+1 < 7 then '0' 
                                                         when end_date- start_date+1 >=7 and end_date- start_date +1< 30 then '7일 이상'
                                                     when end_date- start_date+1 >=30 and end_date- start_date+1 < 90 then '30일 이상'
                                                        else '90일 이상' end)  as DURATION_TYPE
from (SELECT car_id, DAILY_FEE
     from CAR_RENTAL_COMPANY_CAR 
     where car_type like '트럭' )  c inner join CAR_RENTAL_COMPANY_RENTAL_HISTORY h on c.car_id = h.car_id) h
     left join CAR_RENTAL_COMPANY_DISCOUNT_PLAN p on p.car_type = '트럭' and p.duration_type = h.duration_type )
order by 2 desc, 1 desc