-- 코드를 입력하세요
SELECT ORDER_ID, PRODUCT_ID, to_char(out_date, 'YYYY-MM-DD') as OUT_DATE, 
                                        (case when out_date is null then '출고미정' 
                                              when to_char(out_date, 'YYYYMMDD') > '20220501' then '출고대기'
                                              else '출고완료' 
                                         end) as 출고여부
FROM FOOD_ORDER 
order by order_id