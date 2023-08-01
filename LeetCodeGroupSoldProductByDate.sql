/*
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| sell_date   | date    |
| product     | varchar |
+-------------+---------+
This table may contain duplicates (In other words, there is no primary key for this table in SQL).
Each row of this table contains the product name and the date it was sold in a market.
 

Find for each date the number of different products sold and their names.

The sold products names for each date should be sorted lexicographically.

Return the result table ordered by sell_date.

The result format is in the following example.
*/
/* Write your T-SQL query statement below */

select sell_date,
count(product) as num_sold,
STRING_AGG(product,',') within group (order by product) as products
from (SELECT DISTINCT sell_date, product FROM Activities) T
group by sell_date
