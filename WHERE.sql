"Using the WHERE statement, we can display subsets of tables based on conditions
that must be met. You can also think of the WHERE command as filtering the data.

Common symbols used in WHERE statements include:
> (greater than)
< (less than)
>= (greater than or equal to)
<= (less than or equal to)
= (equal to)
!= (not equal to)"

Questions
Write a query that:
>Pulls the first 5 rows and all columns from the orders table that have a dollar
 amount of gloss_amt_usd greater than or equal to 1000.
>Pulls the first 10 rows and all columns from the orders table that have a
 total_amt_usd less than 500.
 Answer:
 SELECT *
 FROM orders
 WHERE gloss_amt_usd >= 1000
 LIMIT 5

 SELECT *
 FROM orders
 WHERE tota_amt_usd < 500
 LIMIT 10

 "WHERE with Non-Numeric Data"
 The WHERE statement can also be used with non-numeric data. We can use
 the = and != operators here. You need to be sure to use single quotes (just be
careful if you have quotes in the original text) with the text data, not double quotes.

Commonly when we are using WHERE with non-numeric data fields, we use the LIKE,
 NOT, or IN operators. We will see those before the end of this lesson!

Practice Question Using WHERE with Non-Numeric Data
Filter the accounts table to include the company name, website, and the primary
point of contact (primary_poc) just for the Exxon Mobil company in the accounts table.

Answer
SELECT name, website, primary_poc
FROM accounts
WHERE name = 'Exxon Mobil'
