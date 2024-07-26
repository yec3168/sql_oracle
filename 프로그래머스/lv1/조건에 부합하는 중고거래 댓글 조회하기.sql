-- 코드를 입력하세요
SELECT b.TITLE,	b.BOARD_ID,	r.REPLY_ID,	r.WRITER_ID,	r.CONTENTS,	to_char(r.CREATED_DATE, 'YYYY-MM-DD')
from (
      select *
      from USED_GOODS_BOARD 
      where to_char(CREATED_DATE, 'YYYY-MM') like ('2022-10')
     ) b inner join used_goods_reply r
      on b.board_id = r.board_id
order by 6, 1