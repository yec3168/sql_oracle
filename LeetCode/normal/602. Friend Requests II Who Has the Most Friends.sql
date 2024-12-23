with cnt_1 as 
(
    select requester_id, count(accepter_id) as cnt1
    from RequestAccepted 
    group by requester_id
)
, cnt_2 as
(
    select accepter_id, count(requester_id) as cnt2
    from RequestAccepted 
    group by accepter_id
)

select id, num
from (select nvl2(REQUESTER_ID, REQUESTER_ID ,  ACCEPTER_ID ) as id
            , nvl(cnt1, 0) + nvl(cnt2, 0) as num
            , rank() over( order by nvl(cnt1, 0) + nvl(cnt2, 0) desc) as rank
    from cnt_1 c1 full outer join cnt_2 c2 on c1.requester_id = c2.accepter_id
)
where rank = 1;


