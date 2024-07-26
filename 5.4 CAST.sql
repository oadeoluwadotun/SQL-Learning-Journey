Additional functionality for working with dates including:

1. TO_DATE
2. CAST
3. Casting with ::

DATE_PART('month', TO_DATE(month, 'month')) here changed a month name into the
number associated with that particular month.

Then you can change a string to a date using CAST. CAST is actually useful to
change lots of column types. Commonly you might be doing as you saw here, where
you change a string to a date using CAST(date_column AS DATE). However, you
might want to make other changes to your columns in terms of their data types.
You can see other examples here(opens in a new tab).

In this example, you also saw that instead of CAST(date_column AS DATE),
you can use date_column::DATE.

Expert Tip
Most of the functions presented in this lesson are specific to strings. They
won’t work with dates, integers or floating-point numbers. However, using any
of these functions will automatically change the data to the appropriate type.

LEFT, RIGHT, and TRIM are all used to select only certain elements of strings,
but using them to select elements of a number or date will treat them as
strings for the purpose of the function. Though we didn''t cover TRIM in this
lesson explicitly, it can be used to remove characters from the beginning and
end of a string. This can remove unwanted spaces at the beginning or end of a
row that often happen with data being moved from Excel or other storage systems.

There are a number of variations of these functions, as well as several other
string functions not covered here. Different databases use subtle variations on
these functions, so be sure to look up the appropriate database’s syntax if
you’re connected to a private database. The Postgres literature(opens in a
  new tab) contains a lot of the related functions.


  CAST Quizzes
  Tasks to complete:
1. Write a query to look at the top10 rows to understand the columns and the
raw data in the dataset called sf_crime_data.
2. Remembering back to the lesson on dates, what is the format that dates should
use in SQL.
3. Look at the date column in the sf_crime_data table. Notice the date is not in
the correct format
4. Write a query to change the date into the correct SQL format. You will need
to use at least SUBSTR and CONCAT to perform this operation.
5. Once you have created a column in the correct format, use either CAST or ::
to convert this to a date.

Answer:
SELECT date,
CAST(CONCAT(SUBSTR(date,7,4), '-', SUBSTR(date,1,2),'-', SUBSTR(date,4,2)) AS date)
        AS new_date
FROM sf_crime_data
LIMIT 10

Answer Page:
SELECT date orig_date, (SUBSTR(date, 7, 4) || '-' || LEFT(date, 2) || '-' || SUBSTR(date, 4, 2))::DATE new_date
FROM sf_crime_data;
