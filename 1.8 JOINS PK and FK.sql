Primary and Foreign Keys
Keys
Primary Key (PK)
A primary key is a unique column in a particular table. This is the first column
in each of our tables. Here, those columns are all called id, but that doesn''t
necessarily have to be the name. It is common that the primary key is the first
column in our tables in most databases.

Foreign Key (FK)
A foreign key is a column in one table that is a primary key in a different
table. We can see in the Parch & Posey ERD that the foreign keys are:

region_id
account_id
sales_rep_id
Each of these is linked to the primary key of another table.

Primary - Foreign Key Link
In Fig2 ERD, you can see that:
=>The region_id is the foreign key.
=>The region_id is linked to id - this is the primary-foreign key link that
  connects these two tables.
=>The crow''s foot shows that the FK can actually appear in many rows in the
  sales_reps table.
=>While the single line is telling us that the PK shows that id appears only
  once per row in this table.
If you look through the rest of the database, you will notice this is always
the case for a primary-foreign key relationship. In the next concept, you can
make sure you have this down!

JOIN More than Two Tables
This same logic can actually assist in joining more than two tables together.
Look at the three tables below. (Fig3)

'The Code'
If we wanted to join all three of these tables, we could use the same logic.
The code below pulls all of the data from all of the joined tables.

SELECT *
FROM web_events
JOIN accounts
ON web_events.account_id = accounts.id
JOIN orders
ON accounts.id = orders.account_id
'Alternatively, we can create a SELECT statement that could pull specific columns
from any of the three tables. Again, our JOIN holds a table, and ON is a link
for our PK to equal the FK.'

To pull specific columns, the SELECT statement will need to specify the table
that you are wishing to pull the column from, as well as the column name.
We could pull only three columns in the above by changing the select statement
to the below, but maintaining the rest of the JOIN information:

SELECT web_events.channel, accounts.name, orders.total

We could continue this same process to link all of the tables if we wanted.
For efficiency reasons, we probably don''t want to do this unless we actually 
need information from all of the tables.
