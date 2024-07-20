-- 코드를 입력하세요
SELECT i.rest_id, rest_name, FOOD_TYPE, FAVORITES, ADDRESS, round(avg(review_score), 2) as SCORE
from REST_info i inner join rest_review r on i.rest_id = r.rest_id 
group by i.rest_id, rest_name, FOOD_TYPE, FAVORITES, ADDRESS
having address like '서울%'
order by 6 desc, 4 desc