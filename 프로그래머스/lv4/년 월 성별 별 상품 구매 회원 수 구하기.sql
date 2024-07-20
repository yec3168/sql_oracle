select to_char(o.sales_date, 'YYYY') as YEAR, to_number(to_char(o.sales_date, 'MM')) as MONTH, gender, count(distinct o.user_id)
from (select *
     from USER_INFO 
     where gender is not null) u inner join online_sale o on u.user_id = o.user_id
group by to_char(o.sales_date, 'YYYY'),  to_char(o.sales_date, 'MM'), gender
order by 1, 2, 3