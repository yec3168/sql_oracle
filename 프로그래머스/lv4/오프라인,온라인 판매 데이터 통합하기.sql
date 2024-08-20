-- 코드를 입력하세요
SELECT to_char(SALES_DATE, 'YYYY-MM-DD') as SALES_DATE, PRODUCT_ID,	USER_ID, SALES_AMOUNT
from ONLINE_SALE 
where to_char(SALES_DATE, 'YYYY-MM') = '2022-03'

union all

SELECT  to_char(SALES_DATE, 'YYYY-MM-DD') as SALES_DATE, PRODUCT_ID, null as user_id, SALES_AMOUNT
from OFFLINE_SALE  
where to_char(SALES_DATE, 'YYYY-MM') = '2022-03'

order by 1, 2, 3