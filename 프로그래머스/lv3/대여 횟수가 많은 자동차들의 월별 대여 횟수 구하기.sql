select month, h.car_id, count(h.car_id) as RECORDS
from (select car_id, to_number(to_char(start_date, 'fmMM')) as month
      from car_rental_company_rental_history
      group by car_id,to_number(to_char(start_date, 'fmMM'))
      having  to_number(to_char(start_date, 'fmMM')) >= 8 and to_number(to_char(start_date, 'fmMM')) <= 10 and count(car_id) >=5
     ) c 
     inner join car_rental_company_rental_history h 
     on c.car_id = h.car_id
group by month, h.car_id
having count(h.car_id)>0
order by 1, 2 desc