/*
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| student_id    | int     |
| student_name  | varchar |
+---------------+---------+
In SQL, student_id is the primary key for this table.
Each row of this table contains the ID and the name of one student in the school.
 

Table: Subjects

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| subject_name | varchar |
+--------------+---------+
In SQL, subject_name is the primary key for this table.
Each row of this table contains the name of one subject in the school.
 

Table: Examinations

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| student_id   | int     |
| subject_name | varchar |
+--------------+---------+
This table may contain duplicates (In other words, there is no primary key for this table in SQL).
Each student from the Students table takes every course from the Subjects table.
Each row of this table indicates that a student with ID student_id attended the exam of subject_name.
 

Find the number of times each student attended each exam.

Return the result table ordered by student_id and subject_name.

The result format is in the following example.
*/

/* Write your T-SQL query statement below */

select s.student_id, s.student_name,sub.subject_name,(count(e.subject_name)) as attended_exams
from students s cross join subjects sub 
left join examinations e on e.student_id = s.student_id and sub.subject_name = e.subject_name
group by s.student_id,sub.subject_name,s.student_name
order by s.student_id,sub.subject_name