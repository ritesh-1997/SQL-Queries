/*  Question : https://www.hackerrank.com/challenges/the-report/problem?isFullScreen=true
    You are given two tables: Students and Grades. Students contains three columns ID, Name and Marks.
*/
SELECT 
    CASE 
        WHEN gr.Grade < 8 THEN 'NULL' 
        ELSE stu.Name 
    END,
    gr.Grade,
    stu.MARKS
FROM 
    STUDENTS stu,GRADES gr
WHERE 
stu.marks>=gr.min_mark and  stu.marks<=gr.max_mark
order by gr.grade desc,name asc