When we JOIN tables together, it is nice to give each table an alias.
Frequently an alias is just the first letter of the table name. You actually
saw something similar for column names in the Arithmetic Operators concept.

Example:

FROM tablename AS t1
JOIN tablename2 AS t2
Before, you saw something like:

SELECT col1 + col2 AS total, col3
Frequently, you might also see these statements without the AS statement. Each
of the above could be written in the following way instead, and they would still
produce the exact same results:

FROM tablename t1
JOIN tablename2 t2
and

SELECT col1 + col2 total, col3
Aliases for Columns in Resulting Table
While aliasing tables is the most common use case. It can also be used to alias
the columns selected to have the resulting table reflect a more readable name.

Example:

Select t1.column1 aliasname, t2.column2 aliasname2
FROM tablename AS t1
JOIN tablename2 AS t2
The alias name fields will be what shows up in the returned table instead of t1.column1 and t2.column2

aliasname	aliasname2
example row	example row
example row	example row
