-- 코드를 입력하세요
select  name as NAME, count(name)as COUNT
from animal_ins
where name != ''
group by name
HAVING COUNT >=2
order by name