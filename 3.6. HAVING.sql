HAVING - Expert Tip
HAVING is the “clean” way to filter a query that has been aggregated, but this
is also commonly done using a subquery(opens in a new tab). Essentially, any
time you want to perform a WHERE on an element of your query that was created
by an aggregate, you need to use HAVING instead.

Often there is confusion about the difference between WHERE and HAVING.
The following statements are true regarding HAVING and WHERE statements.
1. WHERE subsets the returned data based on a logical condition.
2. WHERE appears after the FROM, JOIN, and ON clauses, but before GROUP BY.
3. HAVING appears afer the GROUP BY clause, but before the ORDER BY clause
4. HAVING is like WHERE, but it works on logical statements involving aggregations.

Questions: HAVING
1. How many of the sales reps have more than 5 accounts that they manage?
Answer:
SELECT s.name, COUNT(a.*) no_of_acc
FROM accounts a
JOIN sales_reps s
ON a.sales_rep_id = s.id
GROUP BY s.name
HAVING COUNT(a.*) > 5
ORDER BY no_of_acc DESC

and technically, we can get this using a SUBQUERY as shown below. This same
logic can be used for the other queries, but this will not be shown.

SELECT COUNT(*) num_reps_above5
FROM(SELECT s.id, s.name, COUNT(*) num_accounts
        FROM accounts a
        JOIN sales_reps s
        ON s.id = a.sales_rep_id
        GROUP BY s.id, s.name
        HAVING COUNT(*) > 5
        ORDER BY num_accounts) AS Table1;

2. How many accounts have more than 20 orders?
Answer:
SELECT a.name, COUNT(o.total) total_orders
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.name
HAVING COUNT(o.total) > 20
ORDER BY total_orders DESC

3. Which account has the most orders?
aNSWER:
SELECT a.name, COUNT(o.total) total_orders
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.name
ORDER BY total_orders DESC
LIMIT 1

4. Which accounts spent more than 30,000 usd total across all orders?
Answer:
SELECT a.name, SUM(o.total_amt_usd) total
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.name
HAVING SUM(o.total_amt_usd) > 30000
ORDER BY total DESC

5.Which accounts spent less than 1,000 usd total across all orders?
Answer:
SELECT a.name, SUM(o.total_amt_usd) total
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.name
HAVING SUM(o.total_amt_usd) < 1000
ORDER BY total DESC

6. Which account has spent the most with us?
Answer:
SELECT a.name, SUM(o.total_amt_usd) total
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.name
ORDER BY total DESC
LIMIT 1

7. Which account has spent the least with us?
Answer:
SELECT a.name, SUM(o.total_amt_usd) total
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.name
ORDER BY total
LIMIT 1

8. Which accounts used facebook as a channel to contact customers more than 6 times?
Answer:
SELECT a.name, COUNT(w.channel) channel_count
FROM accounts a
JOIN web_events w
ON w.account_id = a.id
GROUP BY a.name, w.channel
HAVING w.channel = 'facebook' AND COUNT(w.channel) > 6
ORDER BY channel_count DESC


9. Which account used facebook most as a channel?
Answer:
SELECT a.id, a.name, w.channel, COUNT(w.channel) channel_count
FROM accounts a
JOIN web_events w
ON w.account_id = a.id
GROUP BY  a.id, a.name, w.channel
HAVING w.channel = 'facebook'
ORDER BY channel_count DESC
LIMIT 1
Note: This query above only works if there are no ties for the account that
used facebook the most. It is a best practice to use a larger limit number
first such as 3 or 5 to see if there are ties before using LIMIT 1.

10. Which channel was most frequently used by most accounts?
Answer:
SELECT a.name, w.channel, COUNT(w.channel) channel_count
FROM accounts a
JOIN web_events w
ON w.account_id = a.id
GROUP BY a.name, w.channel
ORDER BY channel_count DESC
LIMIT 20
