USE Parch_Posey;

/*
	Q1: How many accounts have more than 20 orders?
*/

SELECT t1.id, t1.name, ct
FROM 
(SELECT a.id, a.name, COUNT(*) ct
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.id, a.name
HAVING ct > 20) t1
ORDER BY ct DESC
LIMIT 1;


/*
	Q2:Find all orders with a total amount greater 
    than the average total amount for all orders.
*/
SELECT *
FROM orders
WHERE total_amt_usd > 
(SELECT AVG(total_amt_usd) FROM orders);

/*
	Q3: List the account names that have placed at least one order with 
    a total amount greater than $10,000
*/
SELECT name
FROM accounts 
WHERE id IN
(SELECT account_id
FROM orders
WHERE total_amt_usd > 10000);

SELECT a.name
FROM accounts a
JOIN orders o
ON o.account_id = a.id
AND o.total_amt_usd > 10000;

/*
	Q3: What is the top channel used by each account to market products?
*/

SELECT t3.id, t3.name, t3.channel, t3.ct
FROM (SELECT a.id, a.name, we.channel, COUNT(*) ct
     FROM accounts a
     JOIN web_events we
     On a.id = we.account_id
     GROUP BY a.id, a.name, we.channel) T3
JOIN (SELECT t1.id, t1.name, MAX(ct) max_chan
      FROM (SELECT a.id, a.name, we.channel, COUNT(*) ct
            FROM accounts a
            JOIN web_events we
            ON a.id = we.account_id
            GROUP BY a.id, a.name, we.channel) t1
      GROUP BY t1.id, t1.name) t2
ON t2.id = t3.id AND t2.max_chan = t3.ct
ORDER BY t3.id, t3.ct;


