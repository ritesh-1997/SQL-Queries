/**
Problem:
Amber’s conglomerate corporation just acquired some new companies. Each of the companies follows this hierarchy:

Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers,
total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.
Note:
The tables may contain duplicate records.
The company_code is string, so the sorting should not be numeric. For example, if the company_codes are C_1, C_2, and C_10, 
then the ascending company_codes will be C_1, C_10, and C_2.

Sample Input
Company Table:

Lead_Manager Table:

Senior_Manager Table:

Manager Table:

Employee Table:

Sample Output
C1 Monika 1 2 1 2
C2 Samantha 1 1 2 2

*/

select 
cc.company_code,
cc.founder,
count(distinct lm.lead_manager_code),
count(distinct sm.senior_manager_code),
count(distinct mn.manager_code),
count(distinct emp.employee_code)

from 
Company cc INNER JOIN Lead_Manager lm ON cc.company_code = lm.company_code
INNER JOIN Senior_Manager sm ON lm.lead_manager_code = sm.lead_manager_code
INNER JOIN Manager mn ON sm.senior_manager_code = mn.senior_manager_code
INNER JOIN Employee emp ON mn.manager_code = emp.manager_code
group by  cc.company_code, cc.founder
order by cc.company_code