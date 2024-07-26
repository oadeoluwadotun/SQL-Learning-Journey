PostgreSQL’s documentation does an excellent job of introducing the concept of
Window Functions: a window function performs a calculation
across a set of table rows that are somehow related to the current row. This is
comparable to the type of calculation that can be done with an aggregate
function. But unlike regular aggregate functions, use of a window function does
not cause rows to become grouped into a single output row — the rows retain
their separate identities. Behind the scenes, the window function is able to
access more than just the current row of the query result.

Through introducing window functions, we have also introduced two statements
that you may not be familiar with: OVER and PARTITION BY. These are key to
window functions. Not every window function uses PARTITION BY; we can also use
ORDER BY or no statement at all depending on the query we want to run. You will
practice using these clauses in the upcoming quizzes. If you want more details
right now, this resource(opens in a new tab) from Pinal Dave is helpful.

Note: You can’t use window functions and standard aggregations in the same query.
More specifically, you can’t include window functions in a GROUP BY clause.

QUIZ :
1. Creating a Running Total Using Window Functions
Using Derek''s previous video as an example, create another running total.
This time, create a running total of standard_amt_usd (in the orders table) over
order time with no date truncation. Your final table should have two columns:
one with the amount being added for each new row, and a second with the running total.

SELECT standard_amt_usd,
    SUM(standard_amt_usd) OVER (ORDER BY occurred_at) as running_total
FROM orders

2. Creating a Partitioned Running Total Using Window Functions
Now, modify your query from the previous quiz to include partitions. Still create
a running total of standard_amt_usd (in the orders table) over order time, but
this time, date truncate occurred_at by year and partition by that same
year-truncated occurred_at variable. Your final table should have three columns:
One with the amount being added for each row, one for the truncated date, and a
final column with the running total within each year.

SELECT standard_amt_usd,
    DATE_TRUNC('year', occurred_at) AS year,
    SUM(standard_amt_usd) OVER (PARTITION BY DATE_TRUNC('year', occurred_at)
    ORDER BY occurred_at) as running_total
FROM orders


6.2 ROW_NUMBER & RANK and DENSE_RANK
QUIZ:
1. Ranking Total Paper Ordered by Account
Select the id, account_id, and total variable from the orders table, then create
a column called total_rank that ranks this total amount of paper ordered
(from highest to lowest) for each account using a partition.
Your final table should have these four columns.

SELECT id, account_id, total,
     RANK() OVER (PARTITION BY account_id ORDER BY total DESC) AS total_rank
FROM orders

6.3 Aggregates in Window Functions with and without ORDER BY
Run the query that Derek wrote in the previous video in the first SQL Explorer
below. Keep the query results in mind; you will be comparing them to the results
of another query next.

Aggregates in Window Functions with and without ORDER BY
The ORDER BY clause is one of two clauses integral to window functions.
The ORDER and PARTITION define what is referred to as the “window”—the ordered
subset of data over which calculations are made. Removing ORDER BY just leaves
an unordered partition; in our query's case, each column's value is simply an
aggregation (e.g., sum, count, average, minimum, or maximum) of all the
standard_qty values in its respective account_id.

As Stack Overflow user mathguy explains(opens in a new tab):

The easiest way to think about this - leaving the ORDER BY out is equivalent to
"ordering" in a way that all rows in the partition are "equal" to each other.
Indeed, you can get the same effect by explicitly adding the ORDER BY clause
like this: ORDER BY 0 (or "order by" any constant expression), or even, more
emphatically, ORDER BY NULL.

6.4 Aliases for Multiple Window Functions
Shorten Your Window Function Queries by Aliasing
WINDOW main_window AS (window clause)
It goes between the WHERE and the GROUPBY

QUIZ:
Now, create and use an alias to shorten the following query (which is different
  than the one in Derek''s previous video) that has multiple window functions.
  Name the alias account_year_window, which is more descriptive than main_window
  in the example above.

SELECT id,
       account_id,
       DATE_TRUNC('year',occurred_at) AS year,
       DENSE_RANK() OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at)) AS dense_rank,
       total_amt_usd,
       SUM(total_amt_usd) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at)) AS sum_total_amt_usd,
       COUNT(total_amt_usd) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at)) AS count_total_amt_usd,
       AVG(total_amt_usd) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at)) AS avg_total_amt_usd,
       MIN(total_amt_usd) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at)) AS min_total_amt_usd,
       MAX(total_amt_usd) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at)) AS max_total_amt_usd
FROM orders

ANSWER:
SELECT id,
       account_id,
       DATE_TRUNC('year',occurred_at) AS year,
       DENSE_RANK() OVER account_year_window AS dense_rank,
       total_amt_usd,
       SUM(total_amt_usd) OVER account_year_window AS sum_total_amt_usd,
       COUNT(total_amt_usd) OVER account_year_window AS count_total_amt_usd,
       AVG(total_amt_usd) OVER account_year_window AS avg_total_amt_usd,
       MIN(total_amt_usd) OVER account_year_window AS min_total_amt_usd,
       MAX(total_amt_usd) OVER account_year_window AS max_total_amt_usd
FROM orders
WINDOW account_year_window AS (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at))
