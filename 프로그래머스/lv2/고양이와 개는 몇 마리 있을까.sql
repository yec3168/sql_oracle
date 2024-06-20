-- 코드를 입력하세요
SELECT animal_type, count(animal_type)
from animal_ins
group by animal_type
having animal_type like 'Cat' or animal_type like 'Dog'
order by animal_type