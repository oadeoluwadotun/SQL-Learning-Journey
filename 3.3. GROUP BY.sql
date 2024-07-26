The key takeaways here:

GROUP BY can be used to aggregate data within subsets of the data. For example,
grouping for different accounts, different regions, or different sales
representatives.


Any column in the SELECT statement that is not within an aggregator must be in
the GROUP BY clause.


The GROUP BY always goes between WHERE and ORDER BY.


ORDER BY works like SORT in spreadsheet software.

GROUP BY - Expert Tip
Before we dive deeper into aggregations using GROUP BY statements, it is worth
noting that SQL evaluates the aggregations before the LIMIT clause. If you
don’t group by any columns, you’ll get a 1-row result—no problem there. If you
group by a column with enough unique values that it exceeds the LIMIT number,
the aggregates will be calculated, and then some rows will simply be omitted
from the results.

This is actually a nice way to do things because you know you’re going to get
the correct aggregates. If SQL cuts the table down to 100 rows, then performed
the aggregations, your results would be substantially different. The above
query’s results exceed 100 rows, so it’s a perfect example. In the next
concept, use the SQL environment to try removing the LIMIT and running it
again to see what changes.

Questions: GROUP BY
Use the SQL environment below to assist with answering the following questions.
Whether you get stuck or you just want to double check your solutions, my
answers can be found at the top of the next concept.

One part that can be difficult to recognize is when it might be easiest to use
an aggregate or one of the other SQL functionalities. Try some of the below to
see if you can differentiate to find the easiest solution.

1. Which account (by name) placed the earliest order? Your solution should have
the account name and the date of the order.
Answer:
SELECT a.name AccountName, o.occurred_at
FROM accounts a
JOIN orders o
ON a.id = o.account_id
ORDER BY o.occurred_at
LIMIT 1;

2. Find the total sales in usd for each account. You should include two columns
- the total sales for each company''s orders in usd and the company name.
Answer:
SELECT a.name AccountName, SUM(o.total) TotalSales
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name
ORDER BY a.name

3. Via what channel did the most recent (latest) web_event occur, which account
was associated with this web_event? Your query should return only three values
- the date, channel, and account name.
Answer:
SELECT w.channel channel, MAX(w.occurred_at) date, a.name
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.name, w.channel
ORDER BY date DESC
LIMIT 1;

4. Find the total number of times each type of channel from the web_events was
used. Your final table should have two columns - the channel and the number of
times the channel was used.
Answer:
SELECT channel, COUNT(channel)
FROM web_events
GROUP BY channel

5. Who was the primary contact associated with the earliest web_event?
Answer:
SELECT w.channel channel,(w.occurred_at) date, a.primary_poc
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
ORDER BY w.occurred_at
LIMIT 1;

6. What was the smallest order placed by each account in terms of total usd.
Provide only two columns - the account name and the total usd. Order from
smallest dollar amounts to largest.
Answer:
SELECT a.name AccountName, MIN(o.total) minsales
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name
ORDER BY minsales;

7. Find the number of sales reps in each region. Your final table should have two
columns - the region and the number of sales_reps. Order from fewest reps to
most reps.
Answer:
SELECT r.name Region, COUNT(s.id) no_sales_rep
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
GROUP BY r.name
ORDER BY no_sales_rep;
