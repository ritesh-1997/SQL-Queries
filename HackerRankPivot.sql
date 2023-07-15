
/**
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted
 alphabetically and displayed underneath its corresponding Occupation. 
 The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

Note: Print NULL when there are no more names corresponding to an occupation.

Input Format

The OCCUPATIONS table is described as follows:

https://www.hackerrank.com/challenges/occupations/problem?isFullScreen=true
*/
CREATE TABLE Occupations (
     NAME VARCHAR(MAX),
     Occupation VARCHAR(MAX)
    )
INSERT  INTO Occupations
VALUES
        ('Samantha','Doctor'),
        ('Julia','Actor'),
        ('Maria','Actor'),
        ('Meera','Singer'),
        ('Ashley','Professor'),
        ('Ketty','Professor'),
        ('Christeen','Professor'),
        ('Jane','Actor'),
        ('Jenny','Doctor'),
        ('Priya','Singer');

SELECT
    [Doctor],
    [Professor],
    [Singer],
    [Actor]
FROM
    (SELECT 
         ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) rn,
         [Name],
         [Occupation] 
     FROM 
         Occupations
    ) AS source 
PIVOT
    (MAX(Name) FOR [occupation] IN ([Doctor],[Professor],[Singer],[Actor])) as pvt
ORDER BY rn


--DROP TABLE Occupations