-- 코드를 입력하세요
SELECT product_id, product_name, sum(price*amount) 
from (select o.PRODUCT_ID,	PRODUCT_NAME,	price, amount
      from FOOD_PRODUCT p inner join food_order o on p.product_id = o.product_id
      where to_char(o.produce_date, 'YYYY-MM') like '2022-05')
group by product_id, product_name
order by 3 desc, 1