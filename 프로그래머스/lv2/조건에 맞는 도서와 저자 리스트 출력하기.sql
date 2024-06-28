-- 코드를 입력하세요
SELECT b.book_id, a.author_name, to_char(b.published_date, 'YYYY-MM-DD') as published_date
from book b inner join author a on b.author_id = a.author_id
where category like '경제'
order by b.published_date