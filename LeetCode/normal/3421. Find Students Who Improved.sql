/* Write your PL/SQL query statement below */

with tt as (
        select student_id
                    , subject
                    , score
                    , exam_date
                    , row_number() over(partition by student_id, subject order by exam_date ) rn
        from scores 
)

select student_id
            , subject
            , score as first_score
            , latest_score
from (
    select student_id
            , subject
            , score
            , exam_date
            , first_value(score) over(partition by student_id, subject order by exam_date desc ) latest_score
    from tt 
)t
where exam_date = ( select min(exam_date)
                    from scores s
                    where t.student_id = s.student_id and t.subject = s.subject
                    )
and score < latest_score


     


-- 실패.
-- select  student_id
--         , subject
--         , first_score
--         , latest_score
-- from (
--     select student_id
--             , subject
--             , score as first_score 
--             , lead(score) over(partition by student_id, subject order by rn ) latest_score
--             , rn
--     from tt
-- )
-- where rn = 1 and latest_score > first_score 



-- 실패.
-- select *
-- from tt s1 
-- where rn = 1 and score < ( select score
--                            from tt s2
--                            where s1.student_id = s2.student_id and s1.subject = s2.subject 
--                             and s2.rn = ( select max(rn)
--                                           from tt
--                                           where s1.student_id = s2.student_id and s1.subject = s2.subject 
--                                           )
--                          )




-- 실패.
-- select *
-- from(
--     select student_id
--                 , subject
--                 , score as first_score 
--                 , exam_date
--                 , max(score) over(partition by student_id, subject) as latest_score 
--                 , dense_rank() over(partition by student_id, subject order by exam_date) as rn
--     from scores
--     group by student_id, subject, score, exam_date
-- )
-- where rn = 1 and first_score < latest_score



--실패.
-- select *
--     -- s1.student_id
--     --     , s1.subject
--     --     , score as first_score
--     --     , latest_score
--     --     , row_num
-- from scores s1 inner join (
--                             select student_id
--                                         , subject
--                                         , max(score) as latest_score 
--                                         , dense_rank() over(order by exam_date) as rn
--                             from scores 
--                             group by student_id, subject
-- ) s2 on s1.student_id = s2.student_id and s1.subject = s2.subject

