-- 코드를 입력하세요
SELECT USER_ID, nickname, sum(price) as TOTAL_SALES
from (select *
      from USED_GOODS_BOARD b inner join USED_GOODS_USER u on b.writer_id = u.user_id
      where status like 'DONE')
group by user_id, nickname
having sum(price) >=700000
order by TOTAL_SALES