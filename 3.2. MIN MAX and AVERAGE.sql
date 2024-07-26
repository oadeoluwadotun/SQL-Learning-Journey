Use the SQL environment below to assist with answering the following questions.
Whether you get stuck or you just want to double check your solutions, my
answers can be found at the top of the next concept.

1. When was the earliest order ever placed? You only need to return the date.
Answer:
SELECT MIN(occurred_at)
FROM orders;

2. Try performing the same query as in question 1 without using an aggregation
function.
Answer:
SELECT occurred_at
FROM orders
ORDER BY occurred_at
LIMIT 1;

3. When did the most recent (latest) web_event occur?
Answer:
SELECT MAX (occurred_at)
FROM web_events;

4. Try to perform the result of the previous query without using an aggregation
function.
Answer:
SELECT occurred_at
FROM web_events
ORDER BY occurred_at DESC
LIMIT 1;


5. Find the mean (AVERAGE) amount spent per order on each paper type, as well as
the mean amount of each paper type purchased per order. Your final answer should
have 6 values - one for each paper type for the average number of sales, as
well as the average amount.
Answer:
SELECT AVG(standard_qty) mean_standard, AVG(gloss_qty) mean_gloss,
              AVG(poster_qty) mean_poster, AVG(standard_amt_usd) mean_standard_usd,
              AVG(gloss_amt_usd) mean_gloss_usd, AVG(poster_amt_usd) mean_poster_usd
FROM orders;

6. Via the video, you might be interested in how to calculate the MEDIAN. Though
this is more advanced than what we have covered so far try finding - what is
the MEDIAN total_usd spent on all orders?
Answer:
SELECT *
FROM (SELECT total_amt_usd
         FROM orders
         ORDER BY total_amt_usd
         LIMIT 3457) AS Table1
ORDER BY total_amt_usd DESC
LIMIT 2;

Since there are 6912 orders - we want the average of the 3457 and 3456 order
amounts when ordered. This is the average of 2483.16 and 2482.55. This gives
he median of 2482.855. This obviously isn't an ideal way to compute. If we
obtain new orders, we would have to change the limit. SQL didn't even calculate
the median for us. The above used a SUBQUERY, but you could use any method to
find the two necessary values, and then you just need the average of them.
