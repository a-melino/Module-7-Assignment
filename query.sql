-- Group all transactions by card
SELECT card, COUNT(id) AS "transactions"
FROM transaction
GROUP BY card
ORDER BY transactions DESC;



-- Group all transactions by cardholder
SELECT card_holder.name, COUNT(transaction.id) AS "transactions"
FROM credit_card
JOIN card_holder ON card_holder.id = credit_card.cardholder_id
JOIN transaction ON transaction.card = credit_card.card
GROUP BY card_holder.name
ORDER BY transactions DESC;

-- Group all transactions by cardholder
SELECT ch.id, ch.name, COUNT(t.id) AS transactions
FROM card_holder ch
JOIN credit_card cc ON ch.id = cc.cardholder_id
JOIN transaction t ON cc.card = t.card
GROUP BY ch.id, ch.name
ORDER BY transactions DESC;



-- Count transactions for each cardholder that are less than $2.00
SELECT ch.id, ch.name, COUNT(t.id) AS transactions
FROM card_holder ch
JOIN credit_card cc ON ch.id = cc.cardholder_id
JOIN transaction t ON cc.card = t.card
WHERE t.amount < 2.00
GROUP BY ch.id, ch.name
ORDER BY transactions DESC;



-- Get the top 100 transactions by price between 7am-9am
SELECT t.id, t.amount
FROM transaction t
WHERE (EXTRACT(HOUR FROM t.date) >= 7 AND EXTRACT(HOUR FROM t.date) < 9)
ORDER BY t.amount DESC
LIMIT 100;

-- Get the top 100 transactions by price between 7am-9am, with cardholder names
SELECT ch.name AS cardholder_name, t.id, t.amount
FROM transaction t
JOIN credit_card cc ON t.card = cc.card
JOIN card_holder ch ON cc.cardholder_id = ch.id
WHERE (EXTRACT(HOUR FROM t.date) >= 7 AND EXTRACT(HOUR FROM t.date) < 9)
ORDER BY t.amount DESC
LIMIT 100;



-- Get the top 100 transactions by price outside the hours of 7am-9am, with cardholder names
SELECT ch.name AS cardholder_name, t.id, t.amount
FROM transaction t
JOIN credit_card cc ON t.card = cc.card
JOIN card_holder ch ON cc.cardholder_id = ch.id
WHERE NOT (EXTRACT(HOUR FROM t.date) >= 7 AND EXTRACT(HOUR FROM t.date) < 9)
ORDER BY t.amount DESC
LIMIT 100;



-- Count transactions for each merchant that are less than $2.00
SELECT m.name AS merchant_name, COUNT(t.id) AS transactions
FROM transaction t
JOIN merchant m ON t.id_merchant = m.id
WHERE t.amount < 2.00
GROUP BY m.name
ORDER BY transactions DESC;


