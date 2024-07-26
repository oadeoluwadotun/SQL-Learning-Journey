Joins with equal signs and inequlity Joins

Expert Tip
If you recall from earlier lessons on joins, the join clause is evaluated before the where clause
- filtering in the join clause will eliminate rows before they are joined,
while filtering in the WHERE clause will leave those rows in and produce some nulls.

Inequality JOINs
The query in Derek's video was pretty long. Let's now use a shorter query to
showcase the power of joining with comparison operators.

Inequality operators (a.k.a. comparison operators) don''t only need to be date
times or numbers, they also work on strings! You will see how this works by
completing the following quiz, which will also reinforce the concept of joining
with comparison operators.

In the following SQL Explorer, write a query that left joins the accounts table
and the sales_reps tables on each sale rep''s ID number and joins it using
the < comparison operator on accounts.primary_poc and sales_reps.name, like so:

accounts.primary_poc < sales_reps.name
The query results should be a table with three columns: the account name
(e.g. Johnson Controls), the primary contact name (e.g. Cammy Sosnowski), and
the sales representative''s name (e.g. Samuel Racine). Then answer the subsequent
multiple choice question.

SELECT a.name acc_name, a.primary_poc, s.name sales_rep
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
AND a.primary_poc < s.name

Question:
What is the relationship between accounts.primary_poc and sales_reps.name?
Answer:
The primary point of contact''s full name comes before the sales rep''s name alphabetically.
