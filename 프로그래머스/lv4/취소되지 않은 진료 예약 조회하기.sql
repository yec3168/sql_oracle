select a.APNT_NO, p.PT_NAME, a.PT_NO, a.MCDP_CD, d.DR_NAME, a.APNT_YMD
from appointment a, patient p , doctor d
where a.apnt_cncl_yn like 'N' and to_char(a.apnt_ymd, 'YYYY-MM-DD') like '2022-04-13' and a.mcdp_cd like 'CS' 
      and a.mddr_id = d.dr_id 
      and a.pt_no = p.pt_no
order by 6