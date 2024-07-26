Why Would We Want to Split Data Into Separate Tables?
Database Normalization
When creating a database, it is really important to think about how data will
be stored. This is known as normalization, and it is a huge part of most SQL
classes. If you are in charge of setting up a new database, it is important to
have a thorough understanding of database normalization.

There are essentially three ideas that are aimed at database normalization:

1. Are the tables storing logical groupings of the data?
2. Can I make changes in a single location, rather than in many tables for the
same information?
3. Can I access and manipulate data quickly and efficiently?

When you normalize a database, you have four goals:
1. arranging data into logical groupings such that each group describes a small
part of the whole;
2. minimizing the amount of duplicate data stored in a database;
3. organizing the data such that, when you modify it, you make the change in
only one place;
4. building a database in which you can access and manipulate the data quickly
and efficiently without compromising the integrity of the data in storage.

However, most analysts are working with a database that was already set up with
the necessary properties in place. As analysts of data, you don''t really need
to think too much about data normalization. You just need to be able to pull
the data from the database.

INTRODUCTION TO JOINS
The whole purpose of JOIN statements is to allow us to pull data from more
than one table at a time.

Again - JOINs are useful for allowing us to pull data from multiple tables.
This is both simple and powerful all at the same time.

With the addition of the JOIN statement to our toolkit, we will also be adding
the ON statement.

We use ON clause to specify a JOIN condition which is a logical statement to
combine the table in FROM and JOIN statements.

Below we see an example of a query using a JOIN statement.
Let''s discuss what the different clauses of this query mean.

SELECT orders.*
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

As we've learned, the SELECT clause indicates which column(s) of data you'd
like to see in the output (For Example, orders. gives us all the columns in
orders table in the output). The FROM clause indicates the first table from
which we're pulling data, and the JOIN indicates the second table. The ON*
clause specifies the column on which you'd like to merge the two tables
together. Try running this query yourself below.

What to Notice
We are able to pull data from two tables:
orders
accounts
Above, we are only pulling data from the orders table since in the SELECT
statement we only reference columns from the orders table.
=>The ON statement holds the two columns that get linked across the two tables.
  This will be the focus in the next concepts.

Additional Information
If we wanted to only pull individual elements from either the orders or
accounts table, we can do this by using the exact same information in the FROM
and ON statements. However, in your SELECT statement, you will need to know how
to specify tables and columns in the SELECT statement:

The table name is always before the period.
The column you want from that table is always after the period.
For example, if we want to pull only the account name and the dates in which
that account placed an order, but none of the other columns, we can do this
with the following query:

SELECT accounts.name, orders.occurred_at
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;
This query only pulls two columns, not all the information in these two tables.
Alternatively, the below query pulls all the columns from both the accounts and
orders table.

SELECT *
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

And the first query you ran pull all the information from only the orders table:
SELECT orders.*
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;
Joining tables allows you access to each of the tables in the SELECT statement
through the table name, and the columns will always follow a . after the table name.

Now it''s your turn.

Quiz Questions
1. Try pulling all the data from the accounts table, and all the data from the orders table.
Answer:
SELECT *
FROM orders
JOIN accounts
ON orders.account_id = accounts.id

2. Try pulling standard_qty, gloss_qty, and poster_qty from the orders table,
and the website and the primary_poc from the accounts table.
Answer:
SELECT orders.standard_qty, orders.gloss_qty, accounts.website, accounts.primary_poc
FROM orders
JOIN accounts
ON orders.account_id = accounts.id
