Up to this point you have learned a lot about working with data using SQL.
This lesson will focus on three topics:

1. Subqueries
2. Table Expressions
3. Persistent Derived Tables
Both subqueries and table expressions are methods for being able to write a
query that creates a table, and then write a query that interacts with this
newly created table. Sometimes the question you are trying to answer doesn't
have an answer when working directly with existing tables in database.

However, if we were able to create new tables from the existing tables, we know
we could query these new tables to answer our question. This is where the
queries of this lesson come to the rescue.

If you can't yet think of a question that might require such a query, don't
worry because you are about to see a whole bunch of them!

Whenever we need to use existing tables to create a new table that we then want
to query again, this is an indication that we will need to use some sort of
subquery. In the next couple of concepts, we will walk through an example
together. Then you will get some practice tackling some additional problems on
your own.E'

TASK
1. Find the number of events that occur for each day for each channel
Answer:
SELECT DATE_TRUNC('day', occurred_at), channel, count(*) as event_count
FROM web_events
GROUP BY 1, 2
ORDER BY 1;

2. Create a subquery that simply provides all of the data from your first query.
Answer:
SELECT *
FROM
  (SELECT DATE_TRUNC('day', occurred_at), channel, count(*) as event_count
  FROM web_events
  GROUP BY 1, 2) sub


3. Find the average number of events for each channel.
Answer:
SELECT channel, AVG(event_count)
FROM
  (SELECT DATE_TRUNC('day', occurred_at), channel, count(*) as event_count
  FROM web_events
  GROUP BY 1, 2
  ) sub
GROUP BY 1
ORDER BY 2 DESC
