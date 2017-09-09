-- Drops the bamazon if it exists currently --
DROP DATABASE IF EXISTS bamazonDB;
-- Creates the "bamazon" database --
CREATE DATABASE bamazonDB;

-- Makes it so all of the following code will affect bamazon --
USE bamazonDB;

-- Creates the table "products" within bamazon --
CREATE TABLE products (
  -- Creates a numeric column called "id" which will automatically increment its default value as we create new rows. (unique id for each product) --
  item_id INTEGER(11) AUTO_INCREMENT NOT NULL,
  -- Makes a string column called "name" which cannot contain null --
  product_name VARCHAR(50) NOT NULL,
    -- Makes a string column called "name" which cannot contain null --
  department_name VARCHAR(30) NOT NULL,
  -- Makes an numeric column called "price" (cost to customer) --
  stock_quantity INTEGER(10) NOT NULL,
    -- Makes an numeric column called "stock_quantity" (how much of the product is available in stores) --
  price_$ DECIMAL(5,2) NOT NULL,
  -- Sets id as this table's primary key which means all data contained within it will be unique --
  PRIMARY KEY (item_id)
);

-- Creates new rows containing data in all named columns --
INSERT INTO products (item_id, product_name, department_name, stock_quantity, price_$)
VALUES (10001, "The Actor Speaks", "Books", 500, 32.00);

INSERT INTO products (item_id, product_name, department_name, stock_quantity, price_$)
VALUES (10002, "Harry Potter Complete Collection", "Books", 50, 87.00);

INSERT INTO products (item_id, product_name, department_name, stock_quantity, price_$)
VALUES (10003, "Leaders Eat Last", "Books", 200, 17.00);

INSERT INTO products (item_id, product_name, department_name, stock_quantity, price_$)
VALUES (10004, "Turn the Ship Around!", "Books", 100, 27.00);

INSERT INTO products (item_id, product_name, department_name, stock_quantity, price_$)
VALUES (10005, "The Personality Puzzle", "Books", 400, 50.00);

INSERT INTO products (item_id, product_name, department_name, stock_quantity, price_$)
VALUES (10006, "Xbox One Console", "Electronics", 100, 299.99);

INSERT INTO products (item_id, product_name, department_name, stock_quantity, price_$)
VALUES (10007, "2TB External Hard Drive", "Electronics", 100, 70.00);

INSERT INTO products (item_id, product_name, department_name, stock_quantity, price_$)
VALUES (10008, "16GB USB Drive", "Electronics", 100, 6.99);

INSERT INTO products (item_id, product_name, department_name, stock_quantity, price_$)
VALUES (10009, "32GB USB Drive", "Electronics", 500, 11.99);

INSERT INTO products (item_id, product_name, department_name, stock_quantity, price_$)
VALUES (10010, "64GB USB Drive", "Electronics", 300, 16.99);


SELECT * FROM products;
