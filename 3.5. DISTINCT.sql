DISTINCT is always used in SELECT statements, and it provides the unique rows
for all columns written in the SELECT statement. Therefore, you only use
DISTINCT once in any particular SELECT statement.

You could write:
SELECT DISTINCT column1, column2, column3
FROM table1;
which would return the unique (or DISTINCT) rows across all three columns.

You would not write:
SELECT DISTINCT column1, DISTINCT column2, DISTINCT column3
FROM table1;
You can think of DISTINCT the same way you might think of the statement "unique".

DISTINCT - Expert Tip
It’s worth noting that using DISTINCT, particularly in aggregations, can slow
your queries down quite a bit.

Questions: DISTINCT
1. Use DISTINCT to test if there are any accounts associated with more than one
region.
Answer:
The below two queries have the same number of resulting rows (351), so we know
that every account is associated with only one region. If each account was
associated with more than one region, the first query should have returned more
rows than the second query.
SELECT a.id as "account id", r.id as "region id",
a.name as "account name", r.name as "region name"
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r
ON r.id = s.region_id;

"and"

SELECT DISTINCT id, name
FROM accounts;

2. Have any sales reps worked on more than one account?
Answer:
Actually all of the sales reps have worked on more than one account. The fewest
number of accounts any sales rep works on is 3. There are 50 sales reps, and
they all have more than one account. Using DISTINCT in the second query assures
that all of the sales reps are accounted for in the first query.
SELECT s.id, s.name, COUNT(*) num_accounts
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.id, s.name
ORDER BY num_accounts;

"and"

SELECT DISTINCT id, name
FROM sales_reps;
