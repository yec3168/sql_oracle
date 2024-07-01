select *
from  (select i.animal_id, i.name
       from animal_ins i, animal_outs o
       where i.animal_id = o.animal_id
       order by o.datetime - i.datetime desc)
where rownum < 3


-- 순서의 문제
-- where절 먼저 rownum하게 되면 데이터가 두 개를 가지고 order by하는 문제 발생.
-- select i.animal_id, i.name
-- from animal_ins i inner join animal_outs o on i.animal_id = o.animal_id

-- order by o.datetime - i.datetime desc