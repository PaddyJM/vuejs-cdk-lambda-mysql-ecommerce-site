CREATE TABLE products (
  id int UNIQUE,
  name VARCHAR(255) UNIQUE
);

INSERT INTO products VALUES
(1, 'bread'),
(2, 'milk'),
(3, 'sugar'),
(4, 'cheese');

CREATE TABLE orders (
  id int UNIQUE,
  name VARCHAR(255),
  quantity int NOT NULL,
  FOREIGN KEY (name) REFERENCES products(name)
);

INSERT INTO orders VALUES
(1, 'bread', 3),
(2, 'milk', 7),
(3, 'sugar', 8),
(4, 'cheese', 9);

CREATE TABLE stock (
  id int UNIQUE,
  name VARCHAR(255),
  quantity int NOT NULL,
  location VARCHAR(255),
  FOREIGN KEY (name) REFERENCES products(name)
);

INSERT INTO stock VALUES
(1, 'bread', 100, 'site-001'),
(2, 'milk', 100, 'site-002'),
(3, 'sugar', 100, 'site-001'),
(4, 'cheese', 100, 'site-001');