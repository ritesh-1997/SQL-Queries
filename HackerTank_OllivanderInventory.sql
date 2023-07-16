/*
Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.

Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to 
buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, and power 
of the wands that Ron's interested in, sorted in order of descending power. If more than one wand has same 
power, sort the result in order of descending age.

Input Format

The following tables contain data on the wands in Ollivander's inventory:

Wands: The id is the id of the wand, code is the code of the wand, coins_needed is the total number of gold 
galleons needed to buy the wand, and power denotes the quality of the wand (the higher the power, the better the wand is).

Questions: https://www.hackerrank.com/challenges/harry-potter-and-wands/problem?isFullScreen=true
*/

SELECT Wands.id, SubQuery.age, Wands.coins_needed, Wands.power
FROM Wands
JOIN (
    SELECT age, MIN(coins_needed) AS min_coins_needed, power,wands.code
    FROM Wands
    JOIN Wands_Property ON Wands.code = Wands_Property.code
    WHERE Wands_Property.is_evil = 0
    GROUP BY age, power,wands.code
) AS SubQuery ON Wands.coins_needed = SubQuery.min_coins_needed
            AND Wands.power = SubQuery.power
            and subquery.code = wands.code
ORDER BY Wands.power DESC, SubQuery.age DESC;