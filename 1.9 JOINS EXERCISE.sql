JOIN Questions Part I
Question Mania
Now that you have been introduced to JOINs, let''s practice to build your skills
and comfort with this new tool. Below I have provided the ERD and a bunch of
questions. The solutions for the questions can be found on the next concept for
you to check your answers or just in case you get stuck!

Questions
1. Provide a table for all web_events associated with account name of Walmart.
There should be three columns. Be sure to include the primary_poc, time of the
event, and the channel for each event. Additionally, you might choose to add a
fourth column to assure only Walmart events were chosen.
Answer:
SELECT a.name, a.primary_poc, w.occurred_at, w.channel
FROM web_events w
JOIN accounts a
ON a.id = w.account_id
WHERE a.name = 'Walmart'

2. Provide a table that provides the region for each sales_rep along with their
associated accounts. Your final table should include three columns: the region
name, the sales rep name, and the account name. Sort the accounts alphabetically
(A-Z) according to account name.
Answer:
SELECT r.name region, s.name sales_rep, a.name account_name
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
ORDER BY a.name

3. Provide the name for each region for every order, as well as the account
name and the unit price they paid (total_amt_usd/total) for the order. Your
final table should have 3 columns: region name, account name, and unit price.
A few accounts have 0 for total, so I divided by (total + 0.01) to assure not
dividing by zero.
Answer:
SELECT r.name region, a.name account_name, o.total_amt_usd/(o.total+0.01) unit_price
FROM orders o
JOIN accounts a
ON a.id = o.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r
ON r.id = s.region_id

Expert Tip
You have had a bit of an introduction to these one-to-one and one-to-many
relationships when we introduced PKs and FKs. Notice, traditional databases do
not allow for many-to-many relationships, as these break the schema down pretty
quickly. A very good answer is provided here(opens in a new tab).

The types of relationships that exist in a database matter less to analysts,
but you do need to understand why you would perform different types of JOINs,
and what data you are pulling from the database. These ideas will be expanded
upon in the next concepts.

"This is the inner join Venn()Diagram"
