-- 코드를 입력하세요
SELECT ANIMAL_ID,	name, to_char(datetime, 'YYYY-MM-DD')
from animal_ins
order by animal_id