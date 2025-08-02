

select nam, 
len(nam)-len(replace(nam,'e',''))as count_of_e
from emp
SELECT 
  nam,
  CASE 
    WHEN CHARINDEX('e', RTRIM(nam)) = 0 THEN 0
    ELSE LEN(RTRIM(nam)) - CHARINDEX('e', REVERSE(RTRIM(nam))) + 1
  END AS last_e_position
FROM emp

SELECT 
  'mississipi' AS word,
  LEN('mississipi') - LEN(REPLACE('mississipi', 'i', '')) AS i_count;

 SELECT EOMONTH(GETDATE(), 1) AS LastDay_NextMonth;
 SELECT DATEADD(DAY, 1, EOMONTH(GETDATE(), -2)) AS FirstDay_PreviousMonth;
 
  WITH Dates AS (
    SELECT 
        CAST(DATEADD(DAY, 1 - DAY(GETDATE()), GETDATE()) AS DATE) AS dt  -- first day of current month
    UNION ALL
    SELECT DATEADD(DAY, 1, dt)
    FROM Dates
    WHERE dt < EOMONTH(GETDATE())  -- until last day of month
)
SELECT COUNT(*) AS FridayCount
FROM Dates
WHERE DATENAME(WEEKDAY, dt) = 'Friday';
