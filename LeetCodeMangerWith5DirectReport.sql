/*
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| department  | varchar |
| managerId   | int     |
+-------------+---------+
In SQL, id is the primary key column for this table.
Each row of this table indicates the name of an employee, their department, and the id of their manager.
If managerId is null, then the employee does not have a manager.
No employee will be the manager of themself.
 

Find the managers with at least five direct reports.

Return the result table in any order.

The result format is in the following example.
*/

/* Write your T-SQL query statement below */
select name from(
select e2.name,e2.id from employee e1,employee e2 
where e1.managerId = e2.id and e1.managerId is not null
group by e2.name,e2.id
having count(e2.name)>=5) t