/*
Table: Users

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| user_id     | int     |
| user_name   | varchar |
+-------------+---------+
user_id is the primary key for this table.
Each row of this table contains the name and the id of a user.
 

Table: Register

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| contest_id  | int     |
| user_id     | int     |
+-------------+---------+
(contest_id, user_id) is the primary key for this table.
Each row of this table contains the id of a user and the contest they registered into.
 

Write an SQL query to find the percentage of the users registered in each contest rounded to two decimals.

Return the result table ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order.

The query result format is in the following example.
*/

/* Write your T-SQL query statement below */
declare @count int 
select @count = count(1) from users
select r.contest_id, round(count(r.user_id)*100.00/@count,2)as percentage
from users u inner join register r on u.user_id = r.user_id
group by r.contest_id
order by percentage desc,r.contest_id 
