
1. CONCAT
2. Piping ||
= Each of these will allow you to combine columns together across rows.

For example, first and last names stored in separate columns could be combined
together to create a full name:

        CONCAT(first_name, ' ', last_name) AS full_name

or with piping as

        first_name || ' ' || last_name AS full_name

Quizzes CONCAT
1. Each company in the accounts table wants to create an email address for each
primary_poc. The email address should be the first name of the
primary_poc . last name primary_poc @ company name .com.

Answer:
SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ') -1 ) first_name,
   RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name,
LOWER(LEFT(primary_poc, STRPOS(primary_poc, ' ') -1 ))
||'.'||LOWER(RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')))
||'@'||name||'.'||'com' As email
FROM accounts;

Answer: --(uSING WITH statement)
WITH email As (SELECT name, LEFT(primary_poc, STRPOS(primary_poc, ' ') -1 ) first_name,
RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name
FROM accounts)

SELECT first_name, last_name, first_name||'.'||last_name||'@'||name||'.'||'com' As email
FROM email;

2. You may have noticed that in the previous solution some of the company names
include spaces, which will certainly not work in an email address. See if you
can create an email address that will work by removing all of the spaces in the
account name, but otherwise your solution should be just as in question 1. Some
helpful documentation is here(opens in a new tab).

Answer:
SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ') -1 ) first_name,
   RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name,
LOWER(LEFT(primary_poc, STRPOS(primary_poc, ' ') -1 ))
||'.'||LOWER(RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')))
||'@'||LOWER(REPLACE(name, ' ', ''))||'.'||'com' As email
FROM accounts;

Answer: --(uSING WITH statement)
WITH email As (SELECT name, LEFT(primary_poc, STRPOS(primary_poc, ' ') -1 ) first_name,
RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name
FROM accounts)

SELECT first_name, last_name, LOWER(first_name||'.'||last_name||'@'||REPLACE(name,' ','')||'.'||'com') As email
FROM email;

3. We would also like to create an initial password, which they will change
after their first log in. The first password will be the first letter of the
primary_poc''s first name (lowercase), then the last letter of their first name
(lowercase), the first letter of their last name (lowercase), the last letter
of their last name (lowercase), the number of letters in their first name, the
number of letters in their last name, and then the name of the company they
are working with, all capitalized with no spaces.
Answer: (Components)
SELECT primary_poc,
LOWER(LEFT(primary_poc, 1)) first_name_firstlower,
       LOWER(RIGHT(LEFT(primary_poc, STRPOS(primary_poc, ' ') -1 ),1)) first_name_lastLower,
       LOWER(LEFT(RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')),1)) last_name_firstlower,
       LOWER(RIGHT(primary_poc, 1)) last_name_lastlower,
       LENGTH(LEFT(primary_poc, STRPOS(primary_poc, ' ') -1 )) lengthoffirst_name,
       LENGTH(RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' '))) lengthoflast_name,
       UPPER(REPLACE(name, ' ', '')) name_Upper_Nospace
FROM accounts;
Answer: (main)
SELECT LOWER(LEFT(primary_poc, 1))||''||
       LOWER(RIGHT(LEFT(primary_poc, STRPOS(primary_poc, ' ') -1 ),1))||''||
       LOWER(LEFT(RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')),1))||''||
       LOWER(RIGHT(primary_poc, 1))||''||
       LENGTH(LEFT(primary_poc, STRPOS(primary_poc, ' ') -1 ))||''||
       LENGTH(RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')))
       ||''||UPPER(REPLACE(name, ' ', '')) AS password
FROM accounts;
Answer: (Refined)
WITH email As (SELECT name, LEFT(primary_poc, STRPOS(primary_poc, ' ') -1 ) first_name,
RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name
FROM accounts)

SELECT first_name, last_name, LOWER(first_name||'.'||last_name||'@'||REPLACE(name,' ','')||'.'||'com') As email,
LOWER(LEFT(first_name,1)|||RIGHT(first_name,1)
     ||LEFT(last_name,1)||RIGHT(last_name,1))
     ||LENGTH(first_name)||LENGTH(last_name)
     ||UPPER(REPLACE(name, ' ', '')) AS password
FROM email;

Answer Page:
1. WITH t1 AS (
    SELECT LEFT(primary_poc,     STRPOS(primary_poc, ' ') -1 ) first_name,  RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name, name
    FROM accounts)
SELECT first_name, last_name, CONCAT(first_name, '.', last_name, '@', name, '.com')
FROM t1;
2. WITH t1 AS (
    SELECT LEFT(primary_poc,     STRPOS(primary_poc, ' ') -1 ) first_name,  RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name, name
    FROM accounts)
SELECT first_name, last_name, CONCAT(first_name, '.', last_name, '@', REPLACE(name, ' ', ''), '.com')
FROM  t1;
3. WITH t1 AS (
    SELECT LEFT(primary_poc,     STRPOS(primary_poc, ' ') -1 ) first_name,  RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name, name
    FROM accounts)
SELECT first_name, last_name, CONCAT(first_name, '.', last_name, '@', name, '.com'), LEFT(LOWER(first_name), 1) || RIGHT(LOWER(first_name), 1) || LEFT(LOWER(last_name), 1) || RIGHT(LOWER(last_name), 1) || LENGTH(first_name) || LENGTH(last_name) || REPLACE(UPPER(name), ' ', '')
FROM t1;
