The AND operator is used within a WHERE statement to consider more than one
logical clause at a time. Each time you link a new statement with an AND, you
will need to specify the column you are interested in looking at. You may link
as many statements as you would like to consider at the same time. This
operator works with all of the operations we have seen so far including
arithmetic operators (+, *, -, /).* LIKE*,* IN*, and* NOT logic can also be
linked together using the AND* operator.

BETWEEN Operator
Sometimes we can make a cleaner statement using BETWEEN than we can using AND.
Particularly this is true when we are using the same column for different parts
of our AND statement. In the previous video, we probably should have used BETWEEN.

Instead of writing :

WHERE column >= 6 AND column <= 10
we can instead write, equivalently:

WHERE column BETWEEN 6 AND 10

Questions using AND and BETWEEN operators
1. Write a query that returns all the orders where the standard_qty is over 1000,
the poster_qty is 0, and the gloss_qty is 0.
Answer:
SELECT *
FROM orders
WHERE standard_qty > 1000 AND poster_qty = 0 AND gloss_qty = 0

2. Using the accounts table, find all the companies whose names do not start with
'C' and end with 's'.
Answer:
SELECT *
FROM accounts
WHERE name NOT LIKE 'C%' AND name LIKE '%s'

3. When you use the BETWEEN operator in SQL, do the results include the values
of your endpoints, or not? Figure out the answer to this important question
by writing a query that displays the order date and gloss_qty data for all
orders where gloss_qty is between 24 and 29. Then look at your output to see
if the BETWEEN operator included the begin and end values or not.
Answer:
SELECT occurred_at, gloss_qty
FROM orders
WHERE gloss_qty BETWEEN 24 AND 29
ORDER BY gloss_qty desc
    You should notice that there are a number of rows in the output of this
    query where the gloss_qty values are 24 or 29. So the answer to the
    question is that yes, the BETWEEN operator in SQL is inclusive; that is,
    the endpoint values are included. So the BETWEEN statement in this query is
    equivalent to having written "WHERE gloss_qty >= 24 AND gloss_qty <= 29."

4. Use the web_events table to find all information regarding individuals who
were contacted via the organic or adwords channels, and started their account
at any point in 2016, sorted from newest to oldest.
Answer:
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords') AND occurred_at >='2016-01-01'
ORDER BY occurred_at DESC

SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords') AND occurred_at BETWEEN '2016-01-01' AND '2017-01-01'
ORDER BY occurred_at DESC;
