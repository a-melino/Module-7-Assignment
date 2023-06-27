-- Group all transactions by card
SELECT card, COUNT(id) AS "transactions"
FROM transaction
GROUP BY card



-- Group all transactions by cardholder
SELECT card_holder.name, COUNT(transaction.id) AS "transactions"
FROM credit_card
JOIN card_holder ON card_holder.id = credit_card.cardholder_id
JOIN transaction ON transaction.card = credit_card.card
GROUP BY card_holder.name

-- Group all transactions by cardholder
SELECT ch.id, ch.name, COUNT(t.id) AS transaction_count
FROM card_holder ch
JOIN credit_card cc ON ch.id = cc.cardholder_id
JOIN transaction t ON cc.card = t.card
GROUP BY ch.id, ch.name;



-- Count transactions for each cardholder that are less than $2.00
SELECT ch.id, ch.name, COUNT(t.id) AS transaction_count
FROM card_holder ch
JOIN credit_card cc ON ch.id = cc.cardholder_id
JOIN transaction t ON cc.card = t.card
WHERE t.amount < 2.00
GROUP BY ch.id, ch.name;



-- Get the top 100 transactions by price between 7am-9am
SELECT t.id, t.amount
FROM transaction t
WHERE t.date >= '2018-01-01 07:00:00' AND t.date <= '2018-12-31 09:00:00'
ORDER BY t.amount DESC
LIMIT 100;

-- Get the top 100 transactions by price between 7am-9am, with cardholder names
SELECT ch.name AS cardholder_name, t.id, t.amount
FROM transaction t
JOIN credit_card cc ON t.card = cc.card
JOIN card_holder ch ON cc.cardholder_id = ch.id
WHERE t.date >= '2018-01-01 07:00:00' AND t.date <= '2018-12-31 09:00:00'
ORDER BY t.amount DESC
LIMIT 100;

