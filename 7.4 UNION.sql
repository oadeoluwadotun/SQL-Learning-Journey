Appending Data via UNION
UNION Use Case

The UNION operator is used to combine the result sets of 2 or more SELECT statements.
It removes duplicate rows between the various SELECT statements.
Each SELECT statement within the UNION must have the same number of fields in the
result sets with similar data types.
Typically, the use case for leveraging the UNION command in SQL is when a user
wants to pull together distinct values of specified columns that are spread across
multiple tables. For example, a chef wants to pull together the ingredients and
respective aisle across three separate meals that are maintained in different tables.
Details of UNION
There must be the same number of expressions in both SELECT statements.
The corresponding expressions must have the same data type in the SELECT statements.
For example: expression1 must be the same data type in both the first and second SELECT statement.

Expert Tip
UNION removes duplicate rows.
UNION ALL does not remove duplicate rows.

Resources
The resource here(opens in a new tab) on SQL UNIONs is helpful in understanding
syntax and examples.

'SQL's two strict rules for appending data:

Both tables must have the same number of columns.
Those columns must have the same data types in the same order as the first table.
A common misconception is that column names have to be the same. Column names,
in fact, do not need to be the same to append two tables but you will find that
they typically are.

Pretreating Tables before doing a UNION
We can filter the individual tables before appending.
Performing Operations on a Combined Dataset
We can use the result of a UNION query in a sub query or by using cte

QUIZ:
Appending Data via UNION
Write a query that uses UNION ALL on two instances (and selecting all columns)
of the accounts table. Then inspect the results and answer the subsequent quiz.
--ANSWER:
SELECT *
FROM accounts a1

UNION ALL

SELECT *
FROM accounts a2

QUESTION 1:
Without rewriting and running the query, how many results would be returned if
you used UNION instead of UNION ALL in the above query?
--ANSWER:
351

Pretreating Tables before doing a UNION
Add a WHERE clause to each of the tables that you unioned in the query above,
filtering the first table where name equals Walmart and filtering the second table
where name equals Disney. Inspect the results then answer the subsequent quiz.
--ANSWER:
SELECT *
FROM accounts a1
WHERE a1.name = 'Walmart'

UNION ALL

SELECT *
FROM accounts a2
WHERE a2.name = 'Disney'

QUESTION 2:
How else could the above query results be generated?
--ANSWER:
SELECT * FROM acounts WHERE name = 'Walmart' OR name = 'Disney'

Performing Operations on a Combined Dataset
Perform the union in your first query (under the Appending Data via UNION header)
in a common table expression and name it double_accounts. Then do a COUNT the
number of times a name appears in the double_accounts table. If you do this
correctly, your query results should have a count of 2 for each name.
--ANSWER:
WITH double_accounts AS
(SELECT *
FROM accounts a1
UNION ALL
SELECT *
FROM accounts a2)

SELECT name, count(*)
FROM double_accounts
GROUP BY 1
ORDER BY 1
