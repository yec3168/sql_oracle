SELECT HISTORY_ID, 	CAR_ID,	to_char(start_date, 'YYYY-MM-DD'),	to_char(end_date, 'YYYY-MM-DD'), (case when end_date- start_date+1 >=30 then '장기 대여' else '단기 대여' end) as RENT_TYPE
from (select *
      from CAR_RENTAL_COMPANY_RENTAL_HISTORY 
      where to_char(start_date, 'YYYY-MM') like '2022-09') 
order by 1 desc