The NOT operator is an extremely useful operator for working with the previous
two operators we introduced: IN and LIKE. By specifying NOT LIKE or NOT IN,
we can grab all of the rows that do not meet a particular criteria.

Questions using the NOT operator
We can pull all of the rows that were excluded from the queries in the previous
two concepts with our new operator.

1. Use the accounts table to find the account name, primary poc, and sales rep
id for all stores except Walmart, Target, and Nordstrom.
Answer:
SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name NOT IN ('Walmart', 'Target', 'Nordstrom')

2. Use the web_events table to find all information regarding individuals who
were contacted via any method except using organic or adwords methods.
Use the accounts table to find:
Answer:
SELECT *
FROM web_events
WHERE channel NOT IN ('organic', 'adwords')

3. All the companies whose names do not start with 'C'.
Answer:
SELECT name
FROM accounts
WHERE name NOT LIKE 'C%'

4. All companies whose names do not contain the string 'one' somewhere in the name.
Answer:
SELECT name
FROM accounts
WHERE name NOT LIKE '%one%'

5. All companies whose names do not end with 's'.
Answer:
SELECT name
FROM accounts
WHERE name NOT LIKE '%s'
