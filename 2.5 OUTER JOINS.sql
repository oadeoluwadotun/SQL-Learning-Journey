JOINs
Notice each of these new JOIN statements pulls all the same rows as an
INNER JOIN, which you saw by just using JOIN, but they also potentially pull
some additional rows.

If there is not matching information in the JOINed table, then you will have
columns with empty cells. These empty cells introduce a new data type called
NULL. You will learn about NULLs in detail in the next lesson, but for now you
have a quick introduction as you can consider any cell without data as NULL.
TYPES OF JOINS
1. INNER JOIN
2. OUTER JOIN
   I.) LEFT JOIN
   II.) RIGHT JOIN
   III.) FULL OUTER JOINs

JOIN Check In
   INNER JOINs
Notice every JOIN we have done up to this point has been an INNER JOIN. That is,
we have always pulled rows only if they exist as a match across two tables.

Our new JOINs allow us to pull rows that might only exist in one of the two
tables. This will introduce a new data type called NULL. This data type will be
discussed in detail in the next lesson.

   Quick Note
You might see the SQL syntax of

LEFT OUTER JOIN
   OR
RIGHT OUTER JOIN
These are the exact same commands as the LEFT JOIN and RIGHT JOIN.

OUTER JOINS
The last type of join is a full outer join. This will return the inner join
result set, as well as any unmatched rows from either of the two tables
being joined.

Again this returns rows that do not match one another from the two tables.
The use cases for a full outer join are very rare.

Similar to the above, you might see the language FULL OUTER JOIN, which is the
same as OUTER JOIN.

Solutions: LEFT and RIGHT JOIN
LEFT and RIGHT JOIN Solutions
This section is a walkthrough of those final two problems in the previous concept.
First, another look at the two tables we are working with:


INNER JOIN Question
The questions are aimed to assure you have a conceptual idea of what is
happening with LEFT and INNER JOINs before you need to use them for more
difficult problems.

For an INNER JOIN like the one here:

SELECT c.countryid, c.countryName, s.stateName
FROM Country c
JOIN State s
ON c.countryid = s.countryid;
We are essentially JOINing the matching PK-FK links from the two tables, as
shown in the below image (Fig4 Countrry and state).


The resulting table will look like:

countryid	countryName	stateName
1	India	Maharashtra
1	India	Punjab
2	Nepal	Kathmandu
3	United States	California
3	United States	Texas
4	Canada	Alberta
LEFT JOIN Question
The questions are aimed to assure you have a conceptual idea of what is
happening with LEFT and INNER JOINs before you need to use them for more
difficult problems.

For a LEFT JOIN like the one here:

SELECT c.countryid, c.countryName, s.stateName
FROM Country c
LEFT JOIN State s
ON c.countryid = s.countryid;
We are essentially JOINing the matching PK-FK links from the two tables, as we
did before, but we are also pulling all the additional rows from the Country
table even if they don''t have a match in the State table. Therefore, we obtain
all the rows of the INNER JOIN, but we also get additional rows from the table
in the FROM.


The resulting table will look like:

countryid	countryName	stateName
1	India	Maharashtra
1	India	Punjab
2	Nepal	Kathmandu
3	United States	California
3	United States	Texas
4	Canada	Alberta
5	Sri Lanka	NULL
6	Brazil	NULL
FINAL LEFT JOIN Note
If we were to flip the tables, we would actually obtain the same exact result
as the JOIN statement:

SELECT c.countryid, c.countryName, s.stateName
FROM State s
LEFT JOIN Country c
ON c.countryid = s.countryid;
This is because if State is on the LEFT table, all of the rows exist in the
RIGHT table again.


The resulting table will look like:

countryid	countryName	stateName
1	India	Maharashtra
1	India	Punjab
2	Nepal	Kathmandu
3	United States	California
3	United States	Texas
4	Canada	Alberta
