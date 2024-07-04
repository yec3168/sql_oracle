-- 코드를 입력하세요
SELECT book_id, to_char(published_date, 'YYYY-MM-DD')
from book
where category like '인문' and to_char(published_date, 'YYYY') like '2021%'
order by published_date