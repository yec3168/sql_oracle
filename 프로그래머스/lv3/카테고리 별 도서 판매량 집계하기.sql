-- 코드를 입력하세요
SELECT category, sum(sales)
from (select *
      from book b inner join book_sales s on b.book_id = s.book_id
      where SALES_DATE between to_date('2022-01-01','YYYY-MM-DD') and to_date('2022-01-31', 'YYYY-MM-DD'))
group by category
order by category