DROP TABLE products;

CREATE TABLE products (
  id SERIAL4,
  name VARCHAR(255),
  description VARCHAR(255),
  stock INT,
  buy_cost INT,
  sell_price INT
);
