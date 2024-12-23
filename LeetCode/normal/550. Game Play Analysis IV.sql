SELECT ROUND(COUNT(A2.PLAYER_ID) / COUNT(A.PLAYER_ID),2) AS fraction
FROM ACTIVITY A LEFT OUTER JOIN ACTIVITY A2
    ON A.PLAYER_ID = A2.PLAYER_ID
    AND A2.EVENT_DATE = A.EVENT_DATE + 1
WHERE (A.PLAYER_ID, A.EVENT_DATE) IN (
                                      SELECT PLAYER_ID, MIN(EVENT_DATE)
                                      FROM ACTIVITY
                                      GROUP BY PLAYER_ID
                                      )