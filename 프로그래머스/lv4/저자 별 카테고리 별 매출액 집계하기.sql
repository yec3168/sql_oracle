-- 코드를 입력하세요
SELECT  a.AUTHOR_ID,	a.AUTHOR_NAME,	b.CATEGORY, sum(b.price * sales.sales)
from (select *
      from book_sales
      where to_char(sales_date,'YYYY-MM') like '2022-01') sales, book b, author a
where sales.book_id = b.book_id 
  and b.author_id = a.author_id
group by a.AUTHOR_ID,	a.AUTHOR_NAME,	b.CATEGORY
order by 1, 3 desc