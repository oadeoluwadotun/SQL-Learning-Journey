Here we looked at three new functions:

1. LEFT
2. RIGHT
3. LENGTH

LEFT pulls a specified number of characters for each row in a specified column
starting at the beginning (or from the left). As you saw here, you can pull the
first three digits of a phone number using LEFT(phone_number, 3).


RIGHT pulls a specified number of characters for each row in a specified column
starting at the end (or from the right). As you saw here, you can pull the last
eight digits of a phone number using RIGHT(phone_number, 8).


LENGTH provides the number of characters for each row of a specified column.
Here, you saw that we could use this to get the length of each phone number as
LENGTH(phone_number).

Quiz: LEFT & RIGHT
LEFT & RIGHT Quizzes
1. In the accounts table, there is a column holding the website for each company.
The last three digits specify what type of web address they are using.
Pull these extensions and provide how many of each website type exist in the
accounts table.
Ans:
SELECT DISTINCT RIGHT(website,3) AS web_type, COUNT(*)
FROM accounts
GROUP BY web_type
Answer Page:
SELECT RIGHT(website, 3) AS domain, COUNT(*) num_companies
FROM accounts
GROUP BY 1
ORDER BY 2 DESC;

2. There is much debate about how much the name (or even the first letter of a
  company name)(opens in a new tab) matters. Use the accounts table to pull the
  first letter of each company name to see the distribution of company names
  that begin with each letter (or number).
Ans:
SELECT LEFT(name,1) AS first_letter, COUNT(*)
FROM accounts
GROUP BY first_letter
ORDER BY 2 DESC
Answer page:
SELECT LEFT(UPPER(name), 1) AS first_letter, COUNT(*) num_companies
FROM accounts
GROUP BY 1
ORDER BY 2 DESC;

3. Use the accounts table and a CASE statement to create two groups: one group
of company names that start with a number and a second group of those company
names that start with a letter. What proportion of company names start with a
letter?
Ans:
SELECT name, CASE
    WHEN LEFT(name,1) BETWEEN 'A' AND 'Z' OR LEFT(name,1) BETWEEN 'a' AND 'z' THEN 'letter_name'
    WHEN LEFT(name,1) BETWEEN '0' AND '9' THEN 'Number_name' ELSE 'other' END AS name_type
FROM accounts
Correct Answer:
SELECT SUM(num) nums, SUM(letter) letters
FROM (SELECT name, CASE WHEN LEFT(UPPER(name), 1) IN ('0','1','2','3','4','5','6','7','8','9')
                          THEN 1 ELSE 0 END AS num,
            CASE WHEN LEFT(UPPER(name), 1) IN ('0','1','2','3','4','5','6','7','8','9')
                          THEN 0 ELSE 1 END AS letter
         FROM accounts) t1;
There are 350 company names that start with a letter and 1 that starts with a
number. This gives a ratio of 350/351 that are company names that start with a
letter or 99.7%.

4. Consider vowels as a, e, i, o, and u. What proportion of company names start
with a vowel, and what percent start with anything else?
Ans:
SELECT SUM(vowels) vowels, SUM(other) other
FROM (SELECT name, CASE WHEN LEFT(UPPER(name), 1) IN ('A','E','I','O','U')
                           THEN 1 ELSE 0 END AS vowels,
             CASE WHEN LEFT(UPPER(name), 1) IN ('A','E','I','O','U')
                          THEN 0 ELSE 1 END AS other
            FROM accounts) t1;
There are 80 company names that start with a vowel and 271 that start with
other characters. Therefore 80/351 are vowels or 22.8%. Therefore, 77.2% of
company names do not start with vowels.

*LOWER AND UPPER:
Used to LOWERCAE OR CAPITALISE ALL CHARACTERS OF A STRING
