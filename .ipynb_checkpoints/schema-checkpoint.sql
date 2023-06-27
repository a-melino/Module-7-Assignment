CREATE TABLE card_holder (
  id INT PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE credit_card (
  card VARCHAR(20) PRIMARY KEY,
  cardholder_id INT,
  FOREIGN KEY (cardholder_id) REFERENCES card_holder(id)
);

CREATE TABLE merchant_category (
  id INT PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE merchant (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  id_merchant_category INT,
  FOREIGN KEY (id_merchant_category) REFERENCES merchant_category(id)
);

CREATE TABLE transaction (
  id INT PRIMARY KEY,
  date TIMESTAMP,
  amount FLOAT,
  card VARCHAR(20),
  id_merchant INT,
  FOREIGN KEY (card) REFERENCES credit_card(card),
  FOREIGN KEY (id_merchant) REFERENCES merchant(id)
);

