Self JOINs
One of the most common use cases for self JOINs is in cases where two events
occurred, one after another. As you may have noticed in the previous video,
using inequalities in conjunction with self JOINs is common.

Modify the query from the previous video, which is pre-populated in the SQL
Explorer below, to perform the same interval analysis except for the web_events
table. Also:

change the interval to 1 day to find those web events that occurred after, but
not more than 1 day after, another web event
add a column for the channel variable in both instances of the table in your query
You can find more on the types of INTERVALS (and other date related functionality)
in the Postgres documentation here(opens in a new tab).

SELECT o1.id AS o1_id,
       o1.account_id AS o1_account_id,
       o1.occurred_at AS o1_occurred_at,
       o2.id AS o2_id,
       o2.account_id AS o2_account_id,
       o2.occurred_at AS o2_occurred_at
  FROM orders o1
 LEFT JOIN orders o2
   ON o1.account_id = o2.account_id
  AND o2.occurred_at > o1.occurred_at
  AND o2.occurred_at <= o1.occurred_at + INTERVAL '28 days'
ORDER BY o1.account_id, o1.occurred_at

--ANSWER:
SELECT we1.id AS we_id,
       we1.account_id AS we1_account_id,
       we1.occurred_at AS we1_occurred_at,
       we1.channel AS we1_channel,
       we2.id AS we2_id,
       we2.account_id AS we2_account_id,
       we2.occurred_at AS we2_occurred_at,
       we2.channel AS we2_channel
  FROM web_events we1
 LEFT JOIN web_events we2
   ON we1.account_id = we2.account_id
  AND we1.occurred_at > we2.occurred_at
  AND we1.occurred_at <= we2.occurred_at + INTERVAL '1 day'
ORDER BY we1.account_id, we2.occurred_at
