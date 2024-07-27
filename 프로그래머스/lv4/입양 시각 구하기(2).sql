-- 코드를 입력하세요

select t1.hour, NVL(c, 0) as count
from(select level -1 as hour 
     from dual
     connect by level <=24 ) t1 
     left join 
     (SELECT to_number(to_char(datetime, 'hh24')) as hour, count(to_number(to_char(datetime, 'hh24'))) as c
     from ANIMAL_OUTS 
     group by to_number(to_char(datetime, 'hh24'))
     order by 1 ) t2 
     on t1.hour = t2.hour
order by t1.hour
    







-- extract (hour  from DATETIME)