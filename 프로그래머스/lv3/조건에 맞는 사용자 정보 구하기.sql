-- 코드를 입력하세요
SELECT u2.user_id, nickname, 
        city||' '||street_address1||' '||street_address2 as 전체주소,
        REGEXP_REPLACE(tlno, '(.{3})(.+)(.{4})', '\1-\2-\3')as 전화번호
from  (select user_id, count(user_id) as count
         from USED_GOODS_BOARD b inner join USED_GOODS_USER u on b.writer_id = u.user_id
         group by u.user_id
         ) u1 inner join USED_GOODS_USER u2 on u1.user_id = u2.user_id
where count >=3
order by 1 desc