Aggregation Questions
Use the SQL environment below to find the solution for each of the following
questions. If you get stuck or want to check your answers, you can find the
answers at the top of the next concept.

1. Find the total amount of poster_qty paper ordered in the orders table.
Answer:
SELECT SUM (poster_qty) Total_Poster_Qty
FROM orders

2. Find the total amount of standard_qty paper ordered in the orders table.
Answer:
SELECT SUM (standard_qty) Total_Standard_Qty
FROM orders

3. Find the total dollar amount of sales using the total_amt_usd in the orders
table.
Answer:
SELECT SUM (total_amt_usd) TotalDollarAmount
FROM orders

4. Find the total amount spent on standard_amt_usd and gloss_amt_usd paper for
each order in the orders table. This should give a dollar amount for each order
in the table.
Answer:
SELECT standard_amt_usd + gloss_amt_usd sum_amt_usd
FROM orders

5. Find the standard_amt_usd per unit of standard_qty paper. Your solution
should use both an aggregation and a mathematical operator.
Answer:
SELECT SUM (standard_amt_usd / (standard_qty+0.001))
FROM orders
