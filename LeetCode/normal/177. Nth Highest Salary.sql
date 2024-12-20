-- oracle
CREATE FUNCTION getNthHighestSalary(num IN NUMBER) RETURN NUMBER IS
result NUMBER;
BEGIN
    SELECT 
         SALARY INTO result
      FROM
        (SELECT
            SALARY, 
            DENSE_RANK() OVER (ORDER BY SALARY DESC) AS RANK
         FROM
            EMPLOYEE)
      WHERE
        RANK = num
      AND
        ROWNUM = 1;  
    RETURN result;
END;