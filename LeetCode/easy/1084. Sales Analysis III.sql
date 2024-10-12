/* Write your PL/SQL query statement below */
select product_id, product_name
from product
where product_id in
                    (
                        select product_id
                        from
                                (
                                    select product_id,
                                            (case when to_char(sale_date, 'MM') between '01' and '03' then 1 
                                                when to_char(sale_date, 'MM') between '04' and '06' then 2
                                                when to_char(sale_date, 'MM') between '07' and '09' then 3
                                                when to_char(sale_date, 'MM') between '10' and '12' then 4
                                                end) as quarter
                                    from sales
                                )
                                group by product_id
                                having max(quarter) = 1

                    )