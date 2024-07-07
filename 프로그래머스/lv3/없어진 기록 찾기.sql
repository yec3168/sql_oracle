-- 코드를 입력하세요
SELECT o.ANIMAL_ID, o.name
from animal_ins i right join animal_outs o on i.animal_id = o.animal_id
where o.datetime is not null and i.datetime is null
order by 1