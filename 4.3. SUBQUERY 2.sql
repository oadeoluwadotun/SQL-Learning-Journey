Subqueries Part II
In the first subquery you wrote, you created a table that you could then query
again in the FROM statement. However, if you are only returning a single value,
you might use that value in a logical statement like WHERE, HAVING, or even
SELECT - the value could be nested within a CASE statement.

On the next concept, we will work through this example, and then you will get
some practice on answering some questions on your own.

Expert Tip
Note that you should not include an alias when you write a subquery in a
conditional statement. This is because the subquery is treated as an individual
value (or set of values in the IN case) rather than as a table.

Also, notice the query here compared a single value. If we returned an entire
column IN would need to be used to perform a logical argument. If we are
returning an entire table, then we must use an ALIAS for the table, and perform
additional logic on the entire table.

TASK
1. Use DATE_TRUNC ro pull moth level information about the first order ever
placed in the orders table.
Answer:
SELECT DATE_TRUNC('month', MIN(occurred_at))
FROM orders

2. Use the result of the previous query to find only the orders that took place
in the same month and year as the first order, and then pull the average for
each type of of paper qry in this month as well as the total sales
Answer:
SELECT AVG(standard_qty) avg_stand_qty, AVG(gloss_qty) avg_gloss_qty, AVG(poster_qty) avg_post_qty, SUM(total_amt_usd) total_sale
FROM orders
WHERE DATE_TRUNC('month', occurred_at) =
(SELECT DATE_TRUNC('month', MIN(occurred_at))
FROM orders)


More Subqueries Quizzes
Above is the ERD for the database again - it might come in handy as you tackle
the quizzes below. You should write your solution as a subquery or subqueries,
not by finding one solution and copying the output. The importance of this is
that it allows your query to be dynamic in answering the question - even if the
data changes, you still arrive at the right answer.

1. Provide the name of the sales_rep in each region with the largest amount of
total_amt_usd sales.
Answer:
First, I wanted to find the total_amt_usd totals associated with each sales rep,
and I also wanted the region in which they were located. The query below
provided this information.

SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
FROM sales_reps s
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
JOIN region r
ON r.id = s.region_id
GROUP BY 1,2
ORDER BY 3 DESC;

Next, I pulled the max for each region, and then we can use this to pull those
rows in our final result.

SELECT region_name, MAX(total_amt) total_amt
FROM(SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
                FROM sales_reps s
                JOIN accounts a
                ON a.sales_rep_id = s.id
                JOIN orders o
                ON o.account_id = a.id
                JOIN region r
                ON r.id = s.region_id
                GROUP BY 1, 2) t1
        GROUP BY 1;

Essentially, this is a JOIN of these two tables, where the region and amount match.

SELECT t3.rep_name, t3.region_name, t3.total_amt
FROM(SELECT region_name, MAX(total_amt) total_amt
        FROM(SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
                FROM sales_reps s
                JOIN accounts a
                ON a.sales_rep_id = s.id
                JOIN orders o
                ON o.account_id = a.id
                JOIN region r
                ON r.id = s.region_id
                GROUP BY 1, 2) t1
        GROUP BY 1) t2
JOIN (SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
        FROM sales_reps s
        JOIN accounts a
        ON a.sales_rep_id = s.id
        JOIN orders o
        ON o.account_id = a.id
        JOIN region r
        ON r.id = s.region_id
        GROUP BY 1,2
        ORDER BY 3 DESC) t3
ON t3.region_name = t2.region_name AND t3.total_amt = t2.total_amt;
2. For the region with the largest (sum) of sales total_amt_usd, how many total
(count) orders were placed?
Answer:
SELECT r.name region, SUM(o.total_amt_usd) top_sale, COUNT(*) total_orders
FROM orders o
JOIN accounts a
ON o.account_id = a.id
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r
ON r.id = s.region_id
GROUP BY 1
HAVING SUM(total_amt_usd) =
      (SELECT SUM(o.total_amt_usd) top_sale
      FROM orders o
      JOIN accounts a
      ON o.account_id = a.id
      JOIN sales_reps s
      ON s.id = a.sales_rep_id
      JOIN region r
      ON r.id = s.region_id
      GROUP BY r.name
      ORDER BY 1 DESC
      LIMIT 1)

Answer Page
      The first query I wrote was to pull the total_amt_usd for each region.
      SELECT r.name region_name, SUM(o.total_amt_usd) total_amt
      FROM sales_reps s
      JOIN accounts a
      ON a.sales_rep_id = s.id
      JOIN orders o
      ON o.account_id = a.id
      JOIN region r
      ON r.id = s.region_id
      GROUP BY r.name;
      Then we just want the region with the max amount from this table. There are two ways I considered getting this amount. One was to pull the max using a subquery. Another way is to order descending and just pull the top value.

      SELECT MAX(total_amt)
      FROM (SELECT r.name region_name, SUM(o.total_amt_usd) total_amt
                      FROM sales_reps s
                      JOIN accounts a
                      ON a.sales_rep_id = s.id
                      JOIN orders o
                      ON o.account_id = a.id
                      JOIN region r
                      ON r.id = s.region_id
                      GROUP BY r.name) sub;
      Finally, we want to pull the total orders for the region with this amount:

      SELECT r.name, COUNT(o.total) total_orders
      FROM sales_reps s
      JOIN accounts a
      ON a.sales_rep_id = s.id
      JOIN orders o
      ON o.account_id = a.id
      JOIN region r
      ON r.id = s.region_id
      GROUP BY r.name
      HAVING SUM(o.total_amt_usd) = (
               SELECT MAX(total_amt)
               FROM (SELECT r.name region_name, SUM(o.total_amt_usd) total_amt
                       FROM sales_reps s
                       JOIN accounts a
                       ON a.sales_rep_id = s.id
                       JOIN orders o
                       ON o.account_id = a.id
                       JOIN region r
                       ON r.id = s.region_id
                       GROUP BY r.name) sub);
      This provides the Northeast with 2357 orders.

3. How many accounts had more total purchases than the account name which has
bought the most standard_qty paper throughout their lifetime as a customer?
Answer:
SELECT a.name acc_name, SUM(total) total_orders
FROM orders o
JOIN accounts a
ON o.account_id = a.id
GROUP BY 1
HAVING SUM(total) >
      (SELECT SUM(o.standard_qty) total_st_qty
      FROM orders o
      JOIN accounts a
      ON o.account_id = a.id
      GROUP BY a.name
      ORDER BY 1 DESC
      LIMIT 1)

Answer Page:
First, we want to find the account that had the most standard_qty paper. The
query here pulls that account, as well as the total amount:

SELECT a.name account_name, SUM(o.standard_qty) total_std, SUM(o.total) total
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;
Now, I want to use this to pull all the accounts with more total sales:

SELECT a.name
FROM orders o
JOIN accounts a
ON a.id = o.account_id
GROUP BY 1
HAVING SUM(o.total) > (SELECT total
                      FROM (SELECT a.name act_name, SUM(o.standard_qty) tot_std, SUM(o.total) total
                            FROM accounts a
                            JOIN orders o
                            ON o.account_id = a.id
                            GROUP BY 1
                            ORDER BY 2 DESC
                            LIMIT 1) sub);
This is now a list of all the accounts with more total orders. We can get the count with just another simple subquery.

SELECT COUNT(*)
FROM (SELECT a.name
          FROM orders o
          JOIN accounts a
          ON a.id = o.account_id
          GROUP BY 1
          HAVING SUM(o.total) > (SELECT total
                      FROM (SELECT a.name act_name, SUM(o.standard_qty) tot_std, SUM(o.total) total
                            FROM accounts a
                            JOIN orders o
                            ON o.account_id = a.id
                            GROUP BY 1
                            ORDER BY 2 DESC
                            LIMIT 1) inner_tab)
                ) counter_tab;

4. For the customer that spent the most (in total over their lifetime as a
  customer) total_amt_usd, how many web_events did they have for each channel?
  Answer Page:
  Here, we first want to pull the customer with the most spent in lifetime value.
SELECT a.id, a.name, SUM(o.total_amt_usd) tot_spent
FROM orders o
JOIN accounts a
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY 3 DESC
LIMIT 1;
Now, we want to look at the number of events on each channel this company had, which we can match with just the id.

SELECT a.name, w.channel, COUNT(*)
FROM accounts a
JOIN web_events w
ON a.id = w.account_id AND a.id =  (SELECT id
                        FROM (SELECT a.id, a.name, SUM(o.total_amt_usd) tot_spent
                              FROM orders o
                              JOIN accounts a
                              ON a.id = o.account_id
                              GROUP BY a.id, a.name
                              ORDER BY 3 DESC
                              LIMIT 1) inner_table)
GROUP BY 1, 2
ORDER BY 3 DESC;
I added an ORDER BY for no real reason, and the account name to assure I was
only pulling from one account.

5. What is the lifetime average amount spent in terms of total_amt_usd for the
top 10 total spending accounts?

First, we just want to find the top 10 accounts in terms of highest total_amt_usd.

SELECT a.id, a.name, SUM(o.total_amt_usd) tot_spent
FROM orders o
JOIN accounts a
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY 3 DESC
LIMIT 10;
Now, we just want the average of these 10 amounts.

SELECT AVG(tot_spent)
FROM (SELECT a.id, a.name, SUM(o.total_amt_usd) tot_spent
         FROM orders o
         JOIN accounts a
         ON a.id = o.account_id
         GROUP BY a.id, a.name
         ORDER BY 3 DESC
          LIMIT 10) temp;

6. What is the lifetime average amount spent in terms of **total_amt_usd**,
including only the companies that spent more per order, on average, than the
average of all orders.

First, we want to pull the average of all accounts in terms of **total_amt_usd**
SELECT AVG(o.total_amt_usd) avg_all
FROM orders o

Then, we want to only pull the accounts with more than this average amount.

SELECT o.account_id, AVG(o.total_amt_usd)
FROM orders o
GROUP BY 1
HAVING AVG(o.total_amt_usd) >
            (SELECT AVG(o.total_amt_usd) avg_all
            FROM orders o);

Finally, we just want the average of these values.

SELECT AVG(avg_amt)
FROM
       (SELECT o.account_id, AVG(o.total_amt_usd) avg_amt
        FROM orders o
        GROUP BY 1 
        HAVING AVG(o.total_amt_usd) >
                 (SELECT AVG(o.total_amt_usd) avg_all
                  FROM orders o)) temp_table;
