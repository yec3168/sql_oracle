-- 코드를 입력하세요
SELECT f.FLAVOR
from FIRST_HALF f inner join ICECREAM_INFO i on f.flavor = i.flavor
where total_order >=3000 and ingredient_type like 'fruit_based'
order by total_order desc