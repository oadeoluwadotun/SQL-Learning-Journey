Position allows you to specify a sub-string, then it returns the numerical value
equal to how far away from the left that particular character appears.


1. POSITION
2. STRPOS
3. LOWER
4. UPPER

POSITION takes a character and a column, and provides the index where that
character is for each row. The index of the first position is 1 in SQL. If you
come from another programming language, many begin indexing at 0. Here, you saw
that you can pull the index of a comma as POSITION(',' IN city_state).


STRPOS provides the same result as POSITION, but the syntax for achieving those
results is a bit different as shown here: STRPOS(city_state, ',').


Note, both POSITION and STRPOS are case sensitive, so looking for A is
different than looking for a.


Therefore, if you want to pull an index regardless of the case of a letter, you
might want to use LOWER or UPPER to make all of the characters lower or uppercase.

Quizzes POSITION & STRPOS
You will need to use what you have learned about LEFT & RIGHT, as well as what
you know about POSITION or STRPOS to do the following quizzes.

1. Use the accounts table to create first and last name columns that hold the first
and last names for the primary_poc.
Answer:
SELECT primary_poc,
LEFT(primary_poc, POSITION(' ' IN primary_poc)) AS fisrt_name,
RIGHT(primary_poc,(LENGTH(primary_poc)-POSITION(' ' IN primary_poc))) AS last_name
FROM accounts
Answer Page:
SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ') -1 ) first_name,
   RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name
FROM accounts;
2. Now see if you can do the same thing for every rep name in the sales_reps table.
Again provide first and last name columns.
Answer:
SELECT LEFT(name, POSITION(' ' IN name)) AS fisrt_name,
RIGHT(name,(LENGTH(name)-POSITION(' ' IN name))) AS last_name
FROM sales_reps
Answer PAge:
SELECT LEFT(name, STRPOS(name, ' ') -1 ) first_name,
          RIGHT(name, LENGTH(name) - STRPOS(name, ' ')) last_name
FROM sales_reps;
