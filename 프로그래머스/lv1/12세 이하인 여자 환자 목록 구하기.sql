-- 코드를 입력하세요
SELECT PT_NAME,	PT_NO,	GEND_CD,	AGE,	(case when tlno is null then 'NONE' else tlno end) as tlno
from patient
where age <=12 and gend_cd like 'W'
order by age desc, pt_name