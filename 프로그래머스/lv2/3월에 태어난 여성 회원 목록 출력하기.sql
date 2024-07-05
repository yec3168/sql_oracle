-- 코드를 입력하세요
SELECT MEMBER_ID,	MEMBER_NAME,	GENDER,	to_char(DATE_OF_BIRTH, 'YYYY-MM-DD')
from MEMBER_PROFILE 
where to_char(DATE_OF_BIRTH, 'MM') = '03' and gender like 'W' and TLNO is not null
order by 1