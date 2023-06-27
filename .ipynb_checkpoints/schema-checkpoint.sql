-- Create a table for the card_holder.csv data
CREATE TABLE card_holder (
  id INT PRIMARY KEY,
  name VARCHAR(255)
);

-- Create a table for the credit_card.csv data
CREATE TABLE credit_card (
  card VARCHAR(20) PRIMARY KEY,
  cardholder_id INT,
  FOREIGN KEY (cardholder_id) REFERENCES card_holder(id)
);

-- Create a table for the merchant_category.csv data
CREATE TABLE merchant_category (
  id INT PRIMARY KEY,
  name VARCHAR(255)
);

-- Create a table for the merchant.csv data
CREATE TABLE merchant (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  id_merchant_category INT,
  FOREIGN KEY (id_merchant_category) REFERENCES merchant_category(id)
);

-- Create a table for the transaction.csv data
CREATE TABLE transaction (
  id INT PRIMARY KEY,
  date TIMESTAMP,
  amount FLOAT,
  card VARCHAR(20),
  id_merchant INT,
  FOREIGN KEY (card) REFERENCES credit_card(card),
  FOREIGN KEY (id_merchant) REFERENCES merchant(id)
);

