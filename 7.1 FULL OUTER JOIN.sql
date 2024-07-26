FULL OUTER JOIN
In earlier lessons, we covered inner joins, which produce results for which the
join condition is matched in both tables.


INNER JOIN Venn Diagram

SELECT column_name(s)
FROM Table_A
INNER JOIN Table_B ON Table_A.column_name = Table_B.column_name;

LEFT JOIN
Left joins also include unmatched rows from the left table, which is indicated
in the “FROM” clause.

SELECT column_name(s)
FROM Table_A
LEFT JOIN Table_B ON Table_A.column_name = Table_B.column_name;

RIGHT JOIN
Right joins are similar to left joins, but include unmatched data from the right
table -- the one that’s indicated in the JOIN clause.

SELECT column_name(s)
FROM Table_A
RIGHT JOIN Table_B ON Table_A.column_name = Table_B.column_name;

FULL OUTER JOIN
In some cases, you might want to include unmatched rows from both tables being
joined. You can do this with a full outer join.

SELECT column_name(s)
FROM Table_A
FULL OUTER JOIN Table_B ON Table_A.column_name = Table_B.column_name;

A common application of this is when joining two tables on a timestamp. Let’s
say you’ve got one table containing the number of item 1 sold each day, and
another containing the number of item 2 sold. If a certain date,
like January 1, 2018, exists in the left table but not the right, while another
date, like January 2, 2018, exists in the right table but not the left:

* a left join would drop the row with January 2, 2018 from the result set
* a right join would drop January 1, 2018 from the result set
* The only way to make sure both January 1, 2018 and January 2, 2018 make it
into the results is to do a full outer join. A full outer join returns unmatched
records in each table with null values for the columns that came from the
opposite table.

FULL OUTER JOIN (IF NULL)
If you wanted to return unmatched rows only, which is useful for some cases of
data assessment, you can isolate them by adding the following line to the end of
the query:

WHERE Table_A.column_name IS NULL OR Table_B.column_name IS NULL

Link: https://learn.udacity.com/courses/ud198/lessons/a869ee25-182d-40c8-b860-0f2bbf58be31/concepts/127f1470-67e4-45af-af2a-849222ecb00d?lesson_tab=lesson

QUIZ:
Finding Matched and Unmatched Rows with FULL OUTER JOIN
You’re not likely to use FULL JOIN (which can also be written as FULL OUTER JOIN)
too often, but the syntax is worth practicing anyway. LEFT JOIN and RIGHT JOIN
each return unmatched rows from one of the tables—FULL JOIN returns unmatched
rows from both tables. FULL JOIN is commonly used in conjunction with aggregations
to understand the amount of overlap between two tables.

Say you are an analyst at Parch & Posey and you want to see:
each account who has a sales rep and each sales rep that has an account (all of
the columns in these returned rows will be full) but also each account that does
not have a sales rep and each sales rep that does not have an account (some of
the columns in these returned rows will be empty)
This type of question is rare, but FULL OUTER JOIN is perfect for it. In the
following SQL Explorer, write a query with FULL OUTER JOIN to fit the above
described Parch & Posey scenario (selecting all of the columns in both of the
relevant tables, accounts and sales_reps) then answer the subsequent multiple
choice quiz.
--ANSWER:
SELECT *
FROM accounts a
FULL JOIN sales_reps s
ON a.sales_rep_id = s.id


SELECT *
FROM accounts a
FULL JOIN sales_reps s
ON a.sales_rep_id = s.id
WHERE a.sales_rep_id is NULL OR s.id is NULL
