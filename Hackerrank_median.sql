-- https://www.hackerrank.com/challenges/weather-observation-station-20/problem?isFullScreen=true

WITH StationCounts AS (
    SELECT COUNT(ID) AS TotalCount
    FROM STATION
)
SELECT ROUND(S1.LAT_N, 4)
FROM STATION AS S1
CROSS JOIN StationCounts
WHERE StationCounts.TotalCount / 2 =
    (SELECT COUNT(S2.ID)
    FROM STATION AS S2
    WHERE S2.LAT_N > S1.LAT_N)
ORDER BY S1.LAT_N
OFFSET 0 ROWS FETCH NEXT 1 ROW ONLY;

/*
In this query, we first calculate the total count of rows in the STATION table using a CTE named StationCounts. 
Then, in the main query, we use CROSS JOIN to join every row from STATION with the total count from the CTE. 
The subquery in the WHERE clause now compares the count of rows with higher LAT_N values to half of the total count.

Finally, we use ORDER BY, OFFSET, and FETCH NEXT to get the first record from the ordered result set, 
which is equivalent to the original SQLite query's behavior.
*/