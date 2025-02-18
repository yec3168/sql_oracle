with down as(
    select product_id
            , new_price as price
    from ( 
        select *
        from products
        where change_date <= '2019-08-16') d1
    where change_date = ( select max(change_date)
                        from (
                                select *
                                from products
                                where change_date <= '2019-08-16') d2
                        where d1.product_id  =d2.product_id)
   
), up as(
    select product_id
        , 10 as price
    from (
         select *
        from products
        where change_date > '2019-08-16') u1
    where change_date = ( select min(change_date)
                        from (
                             select *
                            from products
                            where change_date > '2019-08-16') u2
                        where u1.product_id  =u2.product_id)
   
)
select case 
            when d.product_id is not null then d.product_id 
            else u.product_id
        end as product_id
       ,
        case 
            when d.price is not null then d.price
            else u.price
        end as price
from down d full outer join up u on d.product_id = u.product_id




-- 실패.
-- with tt as (
--     select product_id
--             , new_price as price
--             , change_date
--             , min(change_date) over(partition by product_id) min
--             , max(change_date) over(partition by product_id) max
--     from products
-- )
-- with min_product as (
--         select product_id,
--                         min(change_date) as min,
--                         max(change_date) as max
--         from products
--         group by product_id
-- )
-- select  product_id, 
--                     (case when change_date <= '2019-08-16' then new_price
--                             else new_price-10 end) as price
-- from products
-- where (product_id, change_date) in (
--                                     select product_id
--                                                 , (case when max <= '2019-08-16' then max 
--                                                         else min end) as "date"
--                                     from product
--                                     )

-- 잘못된 접근
-- select product_id
--         , 
--             case
--                 when min(change_date) > to_char(change_date, 'YYYY-MM-DD') = '2019-08-16' then price
--             end
-- from tt
-- group by product_id
