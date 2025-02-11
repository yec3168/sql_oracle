-- oracle
CREATE FUNCTION getNthHighestSalary(num IN NUMBER) RETURN NUMBER IS
result NUMBER;
BEGIN
    SELECT SALARY INTO RESULT
    FROM (
            SELECT salary,
                    DENSE_RANK() OVER(ORDER BY SALARY DESC) AS RANK
            FROM EMPLOYEE
            )
    WHERE RANK = NUM AND ROWNUM = 1;
    RETURN result;
END;