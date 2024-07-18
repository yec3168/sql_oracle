select CATEGORY,	price as MAX_PRICE,	PRODUCT_NAME
from (select category, price, product_name, rank() over(partition by category order by price desc) as rank
      from food_product
      where category in ('과자', '국', '김치', '식용유'))
where rank =1
order by 2 desc