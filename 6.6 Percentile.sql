You can use window functions to identify what percentile (or quartile, or any
  other subdivision) a given row falls into. The syntax is NTILE(*# of buckets*).
  In this case, ORDER BY determines which column to use to determine the quartiles
  (or whatever number of ‘tiles you specify).

Expert Tip
In cases with relatively few rows in a window, the NTILE function doesn’t
calculate exactly as you might expect. For example, If you only had two records
and you were measuring percentiles, you’d expect one record to define the 1st
percentile, and the other record to define the 100th percentile. Using the NTILE
function, what you’d actually see is one record in the 1st percentile, and one
in the 2nd percentile.

In other words, when you use a NTILE function but the number of rows in the
partition is less than the NTILE(number of groups), then NTILE will divide the
rows into as many groups as there are members (rows) in the set but then stop
short of the requested number of groups. If you’re working with very small
windows, keep this in mind and consider using quartiles or similarly small bands.

You can check out a complete list of window functions in Postgres (the syntax
  Mode uses) in the Postgres documentation.

QUIZ:
Percentiles with Partitions
You can use partitions with percentiles to determine the percentile of a specific
subset of all rows. Imagine you are an analyst at Parch & Posey and you want to
determine the largest orders (in terms of quantity) a specific customer has made
to encourage them to order more similarly sized large orders. You only want to
 consider the NTILE for that customer''s account_id.

In the SQL Explorer below, write three queries (separately) that reflect each of the following:

1. 'Use the NTILE functionality to divide the accounts into 4 levels in terms of
the amount of standard_qty for their orders. Your resulting table should have
the account_id, the occurred_at time for each order, the total amount of
standard_qty paper purchased, and one of four levels in a standard_quartile column.'
--ANSWER:
SELECT account_id, occurred_at, standard_qty,
NTILE(4) OVER (PARTITION BY account_id ORDER BY standard_qty) AS standard_quartile
FROM orders
ORDER BY account_id DESC;

2. 'Use the NTILE functionality to divide the accounts into two levels in terms
of the amount of gloss_qty for their orders. Your resulting table should have
the account_id, the occurred_at time for each order, the total amount of
gloss_qty paper purchased, and one of two levels in a gloss_half column.'
--ANSWER:
SELECT account_id, occurred_at, gloss_qty,
NTILE(2) OVER (PARTITION BY account_id ORDER BY gloss_qty) AS gloss_half
FROM orders
ORDER BY account_id DESC;

3.'Use the NTILE functionality to divide the orders for each account into 100
levels in terms of the amount of total_amt_usd for their orders. Your resulting
table should have the account_id, the occurred_at time for each order, the total
amount of total_amt_usd paper purchased, and one of 100 levels in a total_percentile column'
--ANSWER:
SELECT account_id, occurred_at, total_amt_usd,
NTILE(100) OVER (PARTITION BY account_id ORDER BY total_amt_usd) AS total_percentile
FROM orders
ORDER BY account_id


Note: To make it easier to interpret the results, order by the account_id in each of the queries.
