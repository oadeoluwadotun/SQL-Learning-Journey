How You Can and Can''t Control Performance

One way to make a query run faster is to reduce the number of calculations that
need to be performed. Some of the high-level things that will affect the number
of calculations a given query will make include:
-Table size
-Joins
-Aggregations

Query runtime is also dependent on some things that you can’t really control
related to the database itself:
- Other users running queries concurrently on the database
- Database software and optimization (e.g., Postgres is optimized differently than Redshift)

Performance Tuning 1
* If you have time series data, limiting to a small time window can make your
queries run more quickly
* Testing your queries on a subset of data, finalizing your query, then removing
the subset limitation is a sound strategy
* When working with subqueries, limiting the amunt of data you are working with
in the place where it will be executed first willhave the maximum impact on query run time.

Performance Tuning 2
Make your joins less complicated. You can do a preaggregation in one table before
joining it to another table.

Performance Tuning 3
Add EXPLAIN at the beginning of a query to get a sense of how long it will take.
