/**
You are given a table, BST, containing two columns: N and P, 
where N represents the value of a node in Binary Tree, and P is the parent of N.

Write a query to find the node type of Binary Tree ordered by the value of the node. 
Output one of the following for each node:

Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node.
https://www.hackerrank.com/challenges/binary-search-tree-1/problem?isFullScreen=true

*/


select N , 
case 
    WHEN p is NULL  THEN "Root"
    WHEN (SELECT count(*) from bst c where c.P=b.N) >0 THEN "Inner"
    ELSE "Leaf"
END
FROM bst b
order by b.N