-- 코드를 입력하세요
select to_char(sales_date, 'YYYY') as year, to_number(to_char(sales_date, 'MM')) as month, count(distinct u.user_id) as PURCHASED_USERS, ROUND(COUNT(DISTINCT u.USER_ID) / (SELECT COUNT(*) FROM USER_INFO WHERE TO_CHAR(JOINED, 'YYYY') = 2021), 1) AS PUCHASED_RATIO
from (
    SELECT *
    from user_info
    where to_char(JOINED, 'YYYY') like '2021' ) u inner join online_sale o on u.user_id = o.user_id
    
group by to_char(sales_date, 'YYYY'), to_number(to_char(sales_date, 'MM'))
order by 1, 2