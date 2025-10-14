/* 
	First Create the database then populate it with the csv files provided...
*/
CREATE DATABASE Parch_Posey;
USE Parch_Posey;

/*
	Q1: select only the id, account_id, and occurred_at columns for all orders in the orders table
*/


/*
	Q2: query that displays all the data in the occurred_at, account_id, 
    and channel columns of the web_events table, and limits the output to only the first 15 rows.
*/


/*
	Q3: Write a query to return the 10 earliest orders in the orders table. Include the id, occurred_at, and total_amt_usd.
*/


/*
	Q4: Write a query to return the top 5 orders in terms of the largest total_amt_usd. Include the id, account_id, and total_amt_usd.
*/


/*
	Q5: Write a query to return the lowest 20 orders in terms of the smallest total_amt_usd. Include the id, account_id, and total_amt_usd.
*/

/*
	Q6: Write a query that displays the order ID, account ID, and total dollar amount for all the orders, 
    sorted first by the account ID (in ascending order), and then by the total dollar amount (in descending order).
*/


/*
	Q7: Now write a query that again displays order ID, account ID, and total dollar amount for each order, 
    but this time sorted first by total dollar amount (in descending order), and then by account ID (in ascending order).
*/


/*
	Q8: Pulls the first 5 rows and all columns from the orders table that have a dollar amount of gloss_amt_usd greater than or equal to 1000.
*/

/*
	Q9: Filter the accounts table to include the company name, website,
    and the primary point of contact (primary_poc) just for the Exxon Mobil company in the accounts table
*/


/*
	Q10: Create a column that divides the standard_amt_usd by the standard_qty to find the unit price for standard paper for each order. 
    Limit the results to the first 10 orders, and include the id and account_id fields.
*/



/*
	Q11: Write a query that finds the percentage of revenue that comes from poster paper for each order. You will need to use only the columns 
    that end with _usd. (Try to do this without using the total column.) Display the id and account_id fields also.
*/



/*
	Q12: Use the accounts table to find
	All the companies whose names start with 'C'.
	All companies whose names contain the string 'one' somewhere in the name.
	All companies whose names end with 's'.
*/


/*
	Q13: Use the accounts table to find the account name, primary_poc, and sales_rep_id for Walmart, Target, and Nordstrom.
*/


/*
	Q14: Use the accounts table to find the account name, primary_poc, and sales_rep_id for all stores except Walmart, Target, and Nordstrom.
*/


/*
	Q15: Use the web_events table to find all information regarding individuals who were contacted via the channel of organic or adwords.
*/


/*
	Q16: Write a query that returns all the orders where the standard_qty is over 1000, the poster_qty is 0, and the gloss_qty is 0.
*/



/*
	Q17: Using the accounts table, find all the companies whose names do not start with 'C' and end with 's'.
*/


/*
	Q18: query that displays the order date and gloss_qty data for all orders where gloss_qty is between 24 and 29.
*/

/*
	Q19: Use the web_events table to find all information regarding individuals who were contacted via the organic or adwords channels, 
    and started their account at any point in 2016, sorted from newest to oldest.
*/


/*
	Q20: Try pulling all the data from the accounts table, and all the data from the orders table.
*/


/*
	Q21: Try pulling standard_qty, gloss_qty, and poster_qty from the orders table, and the website and the primary_poc from the accounts table.
*/


/*
	Q22:Provide a table for all web_events associated with the account name of Walmart. There should be three columns. Be sure to include the primary_poc, 
    time of the event, and the channel for each event. Additionally, you might choose to add a fourth column to assure only Walmart events were chosen.
*/

/*
	Q23:Provide a table that provides the region for each sales_rep along with their associated accounts. Your final table should include three columns:
    the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to the account name.
*/


/*
	Q24:Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order.
    A few accounts have 0 for total, so I divided by (total + 0.01) to assure not dividing by zero.
*/


/*
	Q25:Provide a table that displays the region for each sales_rep along with their associated accounts. This time only for the Midwest region. 
    Your final table should include three columns: the region name, the sales rep name, and the account name. 
    Sort the accounts alphabetically (A-Z) according to the account name.
*/


/*
	Q26:Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for accounts 
    where the sales rep has a first name starting with S and in the Midwest region. Your final table should include three columns: 
    the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to the account name.
*/


/*
	Q27:Provide a table with the region for each sales_rep and their associated accounts. This time only for accounts where the sales rep has a last name 
    starting with K and in the Midwest region. Your final table should include three columns: the region name, the sales rep name, and the account name.
    Sort the accounts alphabetically (A-Z) according to the account name.
*/


/*
	Q28:Provide the name for each region for every order, and the account name and the unit price they paid (total_amt_usd/total) for the order. 
    However, you should only provide the results if the standard order quantity exceeds 100. 
    Your final table should have 3 columns: region name, account name, and unit price.
*/


/*
	Q29: Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order.
    However, you should only provide the results if the standard order quantity exceeds 100 and the poster order quantity exceeds 50. 
    Your final table should have 3 columns: region name, account name, and unit price. Sort for the smallest unit price first.
*/


/*
	Q30:
	Find the total amount of poster_qty paper ordered in the orders table.
	Find the total amount of standard_qty paper ordered in the orders table.
	Find the total dollar amount of sales using the total_amt_usd in the orders table.
	Find the total amount spent on standard_amt_usd and gloss_amt_usd paper for each order in the orders table. 
    This should give a dollar amount for each order in the table.
	Find the standard_amt_usd per unit of standard_qty paper. Your solution should use both aggregation and a mathematical operator.
*/


/*
	Q31:
	When was the earliest order ever placed? You only need to return the date.
	Try performing the same query as in question 1 without using an aggregation function.
	When did the most recent (latest) web_event occur?
	Try to perform the result of the previous query without using an aggregation function.
	Find the mean (AVERAGE) amount spent per order on each paper type, as well as the mean amount of each paper type purchased per order. 
    Your final answer should have 6 values - one for each paper type for the average number of sales, as well as the average amount.
*/



/*
	Q32: Which account (by name) placed the earliest order? Your solution should have the account name and the date of the order.
*/


/*
	Q33: Find the total sales in usd for each account. You should include two columns - 
    the total sales for each company's orders in usd and the company name.
*/



/*
	Q34: Via what channel did the most recent (latest) web_event occur, which account was associated with this web_event? Your query should return only
    three values - the date, channel, and account name.
*/


/*
	Q35:Find the total number of times each type of channel from the web_events was used. Your final table should have two columns - 
    the channel and the number of times the channel was used.
*/


/*
	Q36: Who was the primary contact associated with the earliest web_event?
*/


/*
	Q37: What was the smallest order placed by each account in terms of total usd. Provide only two columns - 
    the account name and the total usd. Order from smallest dollar amounts to largest.
*/


/*
	Q38: How many of the sales reps have more than 5 accounts that they manage?
*/


/*
	Q39: How many accounts have more than 20 orders?
*/


/*
	Q40: Which account has the most orders?
*/

