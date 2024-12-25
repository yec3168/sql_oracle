/* Write your PL/SQL query statement below */
WITH CNT AS(
    select USER_ID,  COUNT(MOVIE_ID) AS C
    from MovieRating 
    GROUP BY USER_ID
), MAX_USER AS(
    SELECT USER_ID,
            NAME,
            ROW_NUMBER() OVER(ORDER BY NAME) RN
    FROM USERS
    WHERE (USER_ID) IN ( SELECT USER_ID 
                        FROM CNT
                        WHERE C IN ( SELECT MAX(C)
                                        FROM CNT)
                        )
   
), RESULT AS (
    SELECT MOVIE_ID,
            USER_ID,
            ROW_NUMBER() OVER(ORDER BY rating DESC) RN
    FROM MOVIERATING
    WHERE USER_ID LIKE ( 
                        SELECT USER_ID
                        FROM MAX_USER
                        WHERE RN = 1   
                    )
    
)

SELECT NAME AS RESULTS
FROM USERS
WHERE (USER_ID) LIKE (SELECT USER_ID
                        FROM RESULT
                        WHERE RN = 1)

UNION

SELECT TITLE AS RESULTS
FROM Movies
WHERE (MOVIE_ID) LIKE (SELECT MOVIE_ID
                        FROM RESULT
                        WHERE RN = 1)



/* Write your PL/SQL query statement below */
WITH CNT AS(
    select USER_ID,  COUNT(MOVIE_ID) AS C
    from MovieRating 
    GROUP BY USER_ID
), MAX_USER AS(
    SELECT USER_ID,
            NAME,
            ROW_NUMBER() OVER(ORDER BY NAME) RN
    FROM USERS
    WHERE (USER_ID) IN ( SELECT USER_ID 
                        FROM CNT
                        WHERE C IN ( SELECT MAX(C)
                                        FROM CNT)
                        )
   
), RESULT AS (
    SELECT MOVIE_ID,
            USER_ID,
            ROW_NUMBER() OVER(ORDER BY rating DESC) RN
    FROM MOVIERATING
    WHERE USER_ID LIKE ( 
                        SELECT USER_ID
                        FROM MAX_USER
                        WHERE RN = 1   
                    )
    
)

SELECT NAME AS RESULTS
FROM USERS
WHERE (USER_ID) LIKE (SELECT USER_ID
                        FROM RESULT
                        WHERE RN = 1)

UNION

SELECT TITLE AS RESULTS
FROM Movies
WHERE (MOVIE_ID) LIKE (SELECT MOVIE_ID
                        FROM RESULT
                        WHERE RN = 1)

-- 5번 테스트 케이스에서 미통과.

