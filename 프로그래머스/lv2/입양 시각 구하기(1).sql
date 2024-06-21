-- 코드를 입력하세요
SELECT to_number(to_char(datetime, 'HH24')) as HOUR, count(to_char(datetime, 'HH24')) as COUNT
from animal_outs
group by to_char(datetime, 'HH24')
having to_char(datetime, 'HH24') >= 9 and to_char(datetime, 'HH24') <=19
order by 1