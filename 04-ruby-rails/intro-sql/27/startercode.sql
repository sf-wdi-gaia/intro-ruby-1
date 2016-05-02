-- run this file with psql -f startercode.sql
-- Setup --
DROP DATABASE IF EXISTS library_app;  -- if the library_app database exists, remove it...
CREATE DATABASE library_app;          -- and recreate it

DROP TABLE authors;       -- go ahead and drop our tables as well
DROP TABLE products;      -- to be more careful, we could drop these tables IF EXISTS
DROP TABLE books;

CREATE TABLE authors (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(255),
	year_of_birth INTEGER,
	year_of_death INTEGER,
	created_at TIMESTAMP NOT NULL DEFAULT now()
);

CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	price NUMERIC NOT NULL DEFAULT 'NaN',
	quantity INTEGER NOT NULL DEFAULT 0
);

INSERT INTO products
	(name, price, quantity)
	VALUES
	('bookmark', 0.50, 200),
	('book cover', 2.00, 75),
	('bookbag', 65.00, 20),
	('bookbag', 50.00, 20),
	('reading light', 25.00, 10);
