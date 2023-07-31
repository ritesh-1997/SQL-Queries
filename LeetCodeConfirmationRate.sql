/* 
+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| user_id        | int      |
| time_stamp     | datetime |
+----------------+----------+
user_id is the primary key for this table.
Each row contains information about the signup time for the user with ID user_id.
 

Table: Confirmations

+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| user_id        | int      |
| time_stamp     | datetime |
| action         | ENUM     |
+----------------+----------+
(user_id, time_stamp) is the primary key for this table.
user_id is a foreign key with a reference to the Signups table.
action is an ENUM of the type ('confirmed', 'timeout')
Each row of this table indicates that the user with ID user_id 
requested a confirmation message at time_stamp and that confirmation message 
was either confirmed ('confirmed') or expired without confirming ('timeout').


The confirmation rate of a user is the number
of 'confirmed' messages divided by the total 
number of requested confirmation messages. 
The confirmation rate of a user that did not 
request any confirmation messages is 0. 
Round the confirmation rate to two decimal places.

Write an SQL query to find the confirmation rate of each user.

Return the result table in any order.

The query result format is in the following example.
*/
/* Write your T-SQL query statement below */
select s.user_id,round(avg(case when c.action='confirmed' then 1.00 else 0.00 end),2) as confirmation_rate
from signups s left join confirmations c on s.user_id = c.user_id
group by s.user_id
