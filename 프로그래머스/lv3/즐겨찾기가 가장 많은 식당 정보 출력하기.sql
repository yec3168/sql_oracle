-- 코드를 입력하세요
SELECT  food_type,	rest_id,	rest_name,	favorites
from (select FOOD_TYPE,	REST_ID,	REST_NAME,	FAVORITES, RANK() over(partition by FOOD_TYPE order by FAVORITES desc ) as rank
      from rest_info)
where rank =1
order by food_type desc