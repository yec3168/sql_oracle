select round( sum(tiv_2016), 2) as tiv_2016
from (
    select sum(tiv_2016) as tiv_2016
    from insurance
    where pid in(
                    select sum(pid) as pid
                    from insurance
                    group by lat, lon
                    having count(pid) = 1
    )
    group by tiv_2015
    having count(pid) > 1
)
-- 에러 발생.


-- 수정본

with tiv as (
            select tiv_2015, count(pid) as cnt
            from insurance
            group by tiv_2015
            having count(pid) > 1
), lat_lon as
(
            SELECT lat, lon
                    , count(pid) as reg
            FROM insurance
            GROUP BY lat, lon
            HAVING count(pid) = 1
)

select round( sum(tiv_2016), 2) as tiv_2016
from insurance
where tiv_2015 in ( select tiv_2015 from tiv) 
and (lat, lon) in (select lat, lon from lat_lon)