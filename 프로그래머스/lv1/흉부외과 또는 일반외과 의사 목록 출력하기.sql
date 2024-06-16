-- 코드를 입력하세요
SELECT DR_NAME,	DR_ID,	MCDP_CD, to_char(hire_ymd, 'YYYY-MM-DD')
from doctor
where MCDP_CD like 'CS' or MCDP_CD like 'GS'
order by hire_ymd desc, dr_name