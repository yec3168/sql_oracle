-- 코드를 입력하세요
SELECT trunc(price, -4), count(trunc(price, -4))
from product
group by trunc(price, -4)
order by 1