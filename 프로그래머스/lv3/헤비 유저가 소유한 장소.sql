select id, name , p2.host_id
from(select distinct host_id, count( host_id) over(partition by host_id) as count
     from places) p1 inner join places p2 on p1.host_id = p2.host_id
where count >=2