select results
from (
    select name as results
            , dense_rank() over(order by cnt desc, name) as rank
    from users u inner join (select user_id
                                        , count(movie_id) as cnt
                                from movieRating 
                                group by user_id;   
                                ) m on u.user_id = m.user_id
)
where rank = 1

union all

select results
from(
    select title as results
            , avg(rating)
            , dense_rank() over(order by avg(rating) desc, title  ) rank
    from movierating r inner join movies m on r.movie_id = m.movie_id
    where to_char(created_at, 'YYYY-MM') = '2020-02'
    group by title  
)
where rank =1;
                           






-- /* Write your PL/SQL query statement below */
-- WITH CNT AS(
--     select USER_ID,  COUNT(MOVIE_ID) AS C
--     from MovieRating 
--     GROUP BY USER_ID
-- ), MAX_USER AS(
--     SELECT USER_ID,
--             NAME,
--             ROW_NUMBER() OVER(ORDER BY NAME) RN
--     FROM USERS
--     WHERE (USER_ID) IN ( SELECT USER_ID 
--                         FROM CNT
--                         WHERE C IN ( SELECT MAX(C)
--                                         FROM CNT)
--                         )
   
-- ), RESULT AS (
--     SELECT MOVIE_ID,
--             USER_ID,
--             ROW_NUMBER() OVER(ORDER BY rating DESC) RN
--     FROM MOVIERATING
--     WHERE USER_ID LIKE ( 
--                         SELECT USER_ID
--                         FROM MAX_USER
--                         WHERE RN = 1   
--                     )
    
-- )

-- SELECT NAME AS RESULTS
-- FROM USERS
-- WHERE (USER_ID) LIKE (SELECT USER_ID
--                         FROM RESULT
--                         WHERE RN = 1)

-- UNION

-- SELECT TITLE AS RESULTS
-- FROM Movies
-- WHERE (MOVIE_ID) LIKE (SELECT MOVIE_ID
--                         FROM RESULT
--                         WHERE RN = 1)



-- /* Write your PL/SQL query statement below */
-- WITH CNT AS(
--     select USER_ID,  COUNT(MOVIE_ID) AS C
--     from MovieRating 
--     GROUP BY USER_ID
-- ), MAX_USER AS(
--     SELECT USER_ID,
--             NAME,
--             ROW_NUMBER() OVER(ORDER BY NAME) RN
--     FROM USERS
--     WHERE (USER_ID) IN ( SELECT USER_ID 
--                         FROM CNT
--                         WHERE C IN ( SELECT MAX(C)
--                                         FROM CNT)
--                         )
   
-- ), RESULT AS (
--     SELECT MOVIE_ID,
--             USER_ID,
--             ROW_NUMBER() OVER(ORDER BY rating DESC) RN
--     FROM MOVIERATING
--     WHERE USER_ID LIKE ( 
--                         SELECT USER_ID
--                         FROM MAX_USER
--                         WHERE RN = 1   
--                     )
    
-- )

-- SELECT NAME AS RESULTS
-- FROM USERS
-- WHERE (USER_ID) LIKE (SELECT USER_ID
--                         FROM RESULT
--                         WHERE RN = 1)

-- UNION

-- SELECT TITLE AS RESULTS
-- FROM Movies
-- WHERE (MOVIE_ID) LIKE (SELECT MOVIE_ID
--                         FROM RESULT
--                         WHERE RN = 1)
-- ;


