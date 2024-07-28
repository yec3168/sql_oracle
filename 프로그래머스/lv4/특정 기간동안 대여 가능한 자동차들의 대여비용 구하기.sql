-- 코드를 입력하세요
select car_id, c.car_type, (daily_fee - daily_fee *(DISCOUNT_RATE/100)) *30 as FEE
from (SELECT *
    from CAR_RENTAL_COMPANY_CAR
    where CAR_TYPE in ('세단', 'SUV') and car_id not in(select car_id
                                                        from CAR_RENTAL_COMPANY_RENTAL_HISTORY 
                                                        where to_char(end_date, 'YYYY-MM-DD')  >= '2022-11-01'))c 
    inner join CAR_RENTAL_COMPANY_DISCOUNT_PLAN p on p.DURATION_TYPE like '30일 이상' and c.CAR_TYPE = p.CAR_TYPE
where (daily_fee - daily_fee *(DISCOUNT_RATE/100)) *30 between 500000 and 2000000
order by 3 desc, 2, 1 desc