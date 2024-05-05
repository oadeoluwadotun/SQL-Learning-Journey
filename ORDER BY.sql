/*The ORDER BY statement allows us to sort our results using the data in any column.
If you are familiar with Excel or Google Sheets, using ORDER BY is similar to sorting a sheet using a column.
A key difference, however, is that using ORDER BY in a SQL query only has temporary effects,
for the results of that query, unlike sorting a sheet by column in Excel or Sheets.

In other words, when you use ORDER BY in a SQL query, your output will be sorted that way,
but then the next query you run will encounter the unsorted data again.
It is important to keep in mind that this is different than using common spreadsheet software,
where sorting the spreadsheet by column actually alters the data in that sheet until you undo or change that sorting.
This highlights the meaning and function of a SQL "query."

The ORDER BY statement always comes in a query after the SELECT and FROM statements,
but before the LIMIT statement. If you are using the LIMIT statement,
it will always appear last. As you learn additional commands,
the order of these statements will matter more.

Pro Tip
Remember DESC can be added after the column in your ORDER BY statement to sort in descending order,
as the default is to sort in ascending order.
Q: Write a query to return the top 5 orders in terms of largest total_amt_usd.
Include the id, account_id, and total_amt_usd.*/

Ans:
SELECT id, occurred_at, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC
LIMIT 5

Q: Write a query to return the lowest 20 orders in terms of smallest total_amt_usd.
Include the id, account_id, and total_amt_usd.

Ans:
SELECT id, occurred_at, total_amt_usd
FROM orders
ORDER BY total_amt_usd
LIMIT 20

Q: Write a query to return the 10 earliest orders in the orders table.
Include the id, occurred_at, and total_amt_usd.

Ans:
SELECT id, occurred_at, total_amt_usd
FROM orders
ORDER BY occurred_at
LIMIT 10

"Next, we saw that we can ORDER BY more than one column at a time.
When you provide a list of columns in an ORDER BY command, the sorting occurs
using the leftmost column in your list first, then the next column from the left,
and so on.  We still have the ability to flip the way we order using DESC."

Q: Write a query that displays the order ID, account ID, and total dollar amount
for all the orders, sorted first by the account ID (in ascending order),
and then by the total dollar amount (in descending order).
Ans:
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY account_id, total_amt_usd DESC

Q: Now write a query that again displays order ID, account ID, and total dollar
amount for each order, but this time sorted first by total dollar amount
(in descending order), and then by account ID (in ascending order).
Ans:
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC, account_id

'In query #1, all of the orders for each account ID are grouped together,
and then within each of those groupings, the orders appear from the greatest
order amount to the least. In query #2, since i sorted by the total dollar
amount first, the orders appear from greatest to least regardless of which
account ID they were from. Then they are sorted by account ID next.
(The secondary sorting by account ID is difficult to see here, since only if
there were two orders with equal total dollar amounts would there need to be
any sorting by account ID.)'
