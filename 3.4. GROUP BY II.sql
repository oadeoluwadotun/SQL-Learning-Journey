Key takeaways:

You can GROUP BY multiple columns at once, as we showed here. This is often
useful to aggregate across a number of different segments.

The order of columns listed in the ORDER BY clause does make a difference.
You are ordering the columns from left to right.
GROUP BY - Expert Tips
The order of column names in your GROUP BY clause doesn’t matter—the results
will be the same regardless. If we run the same query and reverse the order in
the GROUP BY clause, you can see we get the same results.

As with ORDER BY, you can substitute numbers for column names in the GROUP BY
clause. It’s generally recommended to do this only when you’re grouping many
columns, or if something else is causing the text in the GROUP BY clause to be
excessively long.

A reminder here that any column that is not within an aggregation must show up
in your GROUP BY statement. If you forget, you will likely get an error.
However, in the off chance that your query does work, you might not like
the results!

Questions: GROUP BY Part II
Use the SQL environment below to assist with answering the following questions.
Whether you get stuck or you just want to double check your solutions, my
answers can be found at the top of the next concept.

1.For each account, determine the average amount of each type of paper they
purchased across their orders. Your result should have four columns - one for
the account name and one for the average quantity purchased for each of the
paper types for each account.
Answer:
SELECT a.name, AVG(standard_qty) av_standard_qty, AVG(gloss_qty) av_gloss_qty, AVG(poster_qty) av_poster_qty
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name

2. For each account, determine the average amount spent per order on each paper
type. Your result should have four columns - one for the account name and one
for the average amount spent on each paper type.
Answer:
SELECT a.name, AVG(standard_amt_usd) av_standard_amt, AVG(gloss_amt_usd) av_gloss_amt, AVG(poster_amt_usd) av_poster_amt
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name;

3. Determine the number of times a particular channel was used in the web_events
table for each sales rep. Your final table should have three columns - the name
of the sales rep, the channel, and the number of occurrences. Order your table
with the highest number of occurrences first.
Answer:
SELECT s.name, w.channel, COUNT(w.channel) channel_count
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN web_events w
ON a.id = w.account_id
GROUP BY s.name, w.channel
ORDER BY channel_count DESC

4. Determine the number of times a particular channel was used in the web_events
table for each region. Your final table should have three columns - the region
name, the channel, and the number of occurrences. Order your table with the
highest number of occurrences first.
Answer:
SELECT r.name, w.channel, COUNT(*) num_events
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r
On r.id = s.region_id
GROUP BY r.name, w.channel
ORDER BY num_events DESC;
