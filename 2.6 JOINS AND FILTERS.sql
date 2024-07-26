SELECT order.*, accounts.*
 FROM orders
 LEFT JOIN accounts
 ON orders.account_id = accounts.id
 AND accounts.sales_rep_id = 321500

This filters the rows with sales_rep_id 321500 before joining it to the
matching rows in the orders table.

The AND clause is read as a part of the ON clause. So Logic in the ON clause
reduces the rows before joining the tables.

The WHERE clause can also be used here, but Logic in the WHERE clause occurs
after the JOIN occurs.


A simple rule to remember this is that, when the database executes this query,
it executes the join and everything in the ON clause first. Think of this as
building the new result set. That result set is then filtered using the WHERE
clause.

The fact that this example is a left join is important. Because inner joins only
return the rows for which the two tables match, moving this filter to the ON
clause of an inner join will produce the same result as keeping it in the WHERE
clause.

Note:
If you have two or more columns in your SELECT that have the same name after
the table name such as accounts.name and sales_reps.name you will need to alias
them. Otherwise it will only show one of the columns. You can alias them
like accounts.name AS AcountName, sales_rep.name AS SalesRepName
