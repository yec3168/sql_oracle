-- 코드를 입력하세요
select mcdp_cd as 진료과코드, count(mcdp_cd) as "5월예약건수"
from (select *
      from APPOINTMENT 
      where apnt_ymd between to_date('2022-05-01', 'YYYY-MM-DD') and to_date('2022-05-31', 'YYYY-MM-DD'))
group by mcdp_cd
order by "5월예약건수", 진료과코드