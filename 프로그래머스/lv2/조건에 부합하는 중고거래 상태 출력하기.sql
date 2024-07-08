-- 코드를 입력하세요
SELECT BOARD_ID,	WRITER_ID,	TITLE,	PRICE,	(case when status like 'DONE' then '거래완료'
                                                      when status like 'SALE' then '판매중'
                                                      else '예약중' end) as STATUS
from used_goods_board
where to_char(created_date, 'YYYY-MM-DD') like '2022-10-05'
order by 1 desc