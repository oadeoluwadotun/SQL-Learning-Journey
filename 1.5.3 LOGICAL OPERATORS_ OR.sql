Similar to the AND operator, the OR operator can combine multiple statements.
Each time you link a new statement with an OR, you will need to specify the
column you are interested in looking at. You may link as many statements as you
would like to consider at the same time. This operator works with all of the
operations we have seen so far including arithmetic operators (+, *, -, /),*
LIKE*,* IN*,* NOT*,* AND*, and* BETWEEN logic can all be linked together using
the OR* operator.

When combining multiple of these operations, we frequently might need to use
parentheses to assure that logic we want to perform is being executed correctly.

Questions using the OR operator
1. Find list of orders ids where either gloss_qty or poster_qty is greater than
4000. Only include the id field in the resulting table.
Answer:
SELECT id
FROM orders
WHERE gloss_qty > 4000 OR poster_qty > 4000

2. Write a query that returns a list of orders where the standard_qty is zero
and either the gloss_qty or poster_qty is over 1000.
Answer:
SELECT *
FROM orders
WHERE standard_qty = 0 AND (gloss_qty > 1000 OR poster_qty > 1000)

3. Find all the company names that start with a 'C' or 'W', and the primary
contact contains 'ana' or 'Ana', but it doesn't contain 'eana'.'
Answer:
SELECT name, primary_poc
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%')
AND (primary_poc LIKE '%ana%' or primary_poc LIKE '%Ana%')
AND (primary_poc NOT LIKE '%eana%')
