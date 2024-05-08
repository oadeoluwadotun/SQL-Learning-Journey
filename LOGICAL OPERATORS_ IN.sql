The IN operator is useful for working with both numeric and text columns.
This operator allows you to use an =, but for more than one item of that
particular column. We can check one, two or many column values for which we want
to pull data, but all within the same query. In the upcoming concepts, you will
see the OR operator that would also allow us to perform these tasks, but the
IN operator is a cleaner way to write these queries.

Expert Tip
In most SQL environments, although not in our Udacity''s classroom, you can use
single or double quotation marks - and you may NEED to use double quotation
marks if you have an apostrophe within the text you are attempting to pull.

In our Udacity SQL workspaces, note you can include an apostrophe by putting two
single quotes together. For example, Macy''s in our workspace would be 'Macy''s'.

Questions using IN operator
1. Use the accounts table to find the account name, primary_poc, and
sales_rep_id for Walmart, Target, and Nordstrom.
Answer:
SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name IN ('Walmart', 'Target', 'Nordstrom')
ORDER BY sales_rep_id

2. Use the web_events table to find all information regarding individuals who
 were contacted via the channel of organic or adwords.
Answer:
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords')
