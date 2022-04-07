SHOW DATABASES;
CREATE DATABASE coffee_store;
USE coffee_store;

CREATE TABLE products(
	id  INT auto_increment PRIMARY KEY,
    name VARCHAR(30),
    price DECIMAL(3,2)
);

-- CREATE TABLE  Owners(
-- 	owner_ID VARCHAR(10),
--     owner_name VARCHAR(20),
--     address VARCHAR(20),
--     phone_no BIGINT,
--     email_id VARCHAR(20)
-- );
SHOW TABLES;

CREATE TABLE customers(
	id INT auto_increment PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    gender ENUM('M','F'),
    phone_number VARCHAR(11)
);
show tables;

CREATE TABLE orders(
	id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    order_time DATETIME,
    FOREIGN KEY(product_id) REFERENCES products(id),
    FOREIGN KEY(customer_id) REFERENCES customers(id)
);

SELECT * FROM products;

ALTER TABLE products
ADD COLUMN coffee_origin VARCHAR(30);

-- ALTER TABLE cars
-- ADD COLUMN Car_Regno VARCHAR(10);

-- ALTER TABLE hotel_details CHANGE `rating` `hotel_rating` VARCHAR(20);

ALTER TABLE customers MODIFY customer_id INT;


-- ALTER TABLE products
-- DROP COLUMN coffee_origin;

SELECT * FROM products;

INSERT INTO products(name,price,coffee_origin)
VALUES ('Espresso',2.50,'Brazil');

INSERT INTO products(name,price,coffee_origin)
VALUES ('Latte',3.50,'indonesia'),('Americano',3.00,'Barzil'),('Flat white',3.50,'indonesia'),('filter',3.00,'india');

-- INSERT INTO rentals(rental_id,customer_id,car_id,pickup_date, return_date,km_driven,fare_amount)
-- VALUES('R001','C007','V004','2018-03-10','2018-03-10','800','9000'),
-- 	  ('R002','C001','V007','2018-03-11','2018-03-12','200','3000'),
--       ('R003','C007','V003','2018-04-15','2018-04-15','100','1500'),
--       ('R004','C007','V001','2018-05-16','2018-05-18','1000','10000'),
--       ('R005','C004','V005','2018-05-10','2018-05-12','900','11000'),
--       ('R006','C004','V006','2018-05-20','2018-05-21','200','2500');

UPDATE products
SET coffee_origin = 'sri lanka'
WHERE id = 7;

SET SQL_SAFE_UPDATES = 0;
UPDATE products
SET price = 3.25,coffee_origin = 'Ethiopia'
WHERE name = 'Americano';

-- UPDATE customers
-- SET phone_no = 9876543210
-- WHERE customer_id = 'CUST1004';

INSERT INTO customers (first_name, last_name, gender, phone_number)
VALUES ('Chris','Martin','M','01123147789'),('Emma','Law','F','01123439899'),('Mark','Watkins','M','01174592013'),('Daniel','Williams','M',NULL),('Sarah','Taylor','F','01176348290'),('Katie','Armstrong','F','01145787353'),('Michael','Bluth','M','01980289282'),('Kat','Nash','F','01176987789'),('Buster','Bluth','M','01173456782'),('Charlie',NULL,'F','01139287883'),('Lindsay','Bluth','F','01176923804'),('Harry','Johnson','M',NULL),('John','Smith','M','01174987221'),('John','Taylor','M',NULL),('Emma','Smith','F','01176984116'),('Gob','Bluth','M','01176985498'),('George','Bluth','M','01176984303'),('Lucille','Bluth','F','01198773214'),('George','Evans','M','01174502933'),('Emily','Simmonds','F','01899284352'),('John','Smith','M','01144473330'),('Jennifer',NULL,'F',NULL),('Toby','West','M','01176009822'),('Paul','Edmonds','M','01966947113');

INSERT INTO orders (product_id,customer_id,order_time) 
VALUES (1,1,'2017-01-01 08-02-11'),(1,2,'2017-01-01 08-05-16'),(5,12,'2017-01-01 08-44-34'),(3,4,'2017-01-01 09-20-02'),(1,9,'2017-01-01 11-51-56'),(6,22,'2017-01-01 13-07-10'),(1,1,'2017-01-02 08-03-41'),(3,10,'2017-01-02 09-15-22'),(2,2,'2017-01-02 10-10-10'),(3,13,'2017-01-02 12-07-23'),(1,1,'2017-01-03 08-13-50'),(7,16,'2017-01-03 08-47-09'),(6,21,'2017-01-03 09-12-11'),(5,22,'2017-01-03 11-05-33'),(4,3,'2017-01-03 11-08-55'),(3,11,'2017-01-03 12-02-14'),(2,23,'2017-01-03 13-41-22'),(1,1,'2017-01-04 08-08-56'),(3,10,'2017-01-04 11-23-43'),(4,12,'2017-01-05 08-30-09'),(7,1,'2017-01-06 09-02-47'),(3,18,'2017-01-06 13-23-34'),(2,16,'2017-01-07 09-12-39'),(2,14,'2017-01-07 11-24-15'),(4,5,'2017-01-08 08-54-11'),(1,1,'2017-01-09 08-03-11'),(6,20,'2017-01-10 10-34-12'),(3,3,'2017-01-10 11-02-11'),(4,24,'2017-01-11 08-39-11'),(4,8,'2017-01-12 13-20-13'),(1,1,'2017-01-14 08-27-10'),(4,15,'2017-01-15 08-30-56'),(1,7,'2017-01-16 10-02-11'),(2,10,'2017-01-17 09-50-05'),(1,1,'2017-01-18 08-22-55'),(3,9,'2017-01-19 09-00-19'),(7,11,'2017-01-19 11-33-00'),(6,12,'2017-01-20 08-02-21'),(3,14,'2017-01-21 09-45-50'),(5,2,'2017-01-22 10-10-34'),(6,24,'2017-01-23 08-32-19'),(6,22,'2017-01-23 08-45-12'),(6,17,'2017-01-23 12-45-30'),(2,11,'2017-01-24 08-01-27'),(1,1,'2017-01-25 08-05-13'),(6,11,'2017-01-26 10-49-10'),(7,3,'2017-01-27 09-23-57'),(7,1,'2017-01-27 10-08-16'),(3,18,'2017-01-27 10-13-09'),(4,19,'2017-01-27 11-02-40'),(3,10,'2017-01-28 08-03-21'),(1,2,'2017-01-28 08-33-28'),(1,12,'2017-01-28 11-55-33'),(1,13,'2017-01-29 09-10-17'),(6,6,'2017-01-30 10-07-13'),(1,1,'2017-02-01 08-10-14'),(2,14,'2017-02-02 10-02-11'),(7,10,'2017-02-02 09-43-17'),(7,20,'2017-02-03 08-33-49'),(4,21,'2017-02-04 09-31-01'),(5,22,'2017-02-05 09-07-10'),(3,23,'2017-02-06 08-15-10'),(2,24,'2017-02-07 08-27-26'),(1,1,'2017-02-07 08-45-10'),(6,11,'2017-02-08 10-37-10'),(3,13,'2017-02-09 08-58-18'),(3,14,'2017-02-10 09-12-40'),(5,4,'2017-02-10 11-05-34'),(1,2,'2017-02-11 08-00-38'),(3,8,'2017-02-12 08-08-08'),(7,20,'2017-02-12 09-22-10'),(1,1,'2017-02-13 08-37-45'),(5,2,'2017-02-13 12-34-56'),(4,3,'2017-02-14 08-22-43'),(5,4,'2017-02-14 09-12-56'),(3,5,'2017-02-15 08-09-10'),(6,7,'2017-02-15 09-05-12'),(1,8,'2017-02-15 09-27-50'),(2,9,'2017-02-16 08-51-12'),(3,10,'2017-02-16 13-07-46'),(4,11,'2017-02-17 08-03-55'),(4,12,'2017-02-17 09-12-11'),(5,10,'2017-02-17 11-41-17'),(6,18,'2017-02-17 13-05-56'),(7,19,'2017-02-18 08-33-27'),(1,17,'2017-02-19 08-12-31'),(1,1,'2017-02-20 09-50-17'),(3,5,'2017-02-20 09-51-29'),(4,6,'2017-02-20 10-43-39'),(3,1,'2017-02-21 08-32-17'),(1,1,'2017-02-21 10-30-11'),(3,2,'2017-02-21 11-08-45'),(4,3,'2017-02-22 11-46-32'),(2,15,'2017-02-22 13-35-16'),(6,13,'2017-02-23 08-34-48'),(4,24,'2017-02-24 08-32-03'),(2,13,'2017-02-25 08-03-12'),(7,17,'2017-02-25 09-34-23'),(7,23,'2017-02-25 11-32-54'),(5,12,'2017-02-26 11-47-34'),(6,4,'2017-02-27 12-12-34'),(1,1,'2017-02-28 08-59-22');

-- INSERT INTO Department(department_id, department_name, department_block_number)
-- VALUES(1,'CSE',3),(2,'IT',3),(3,'SE',3);
SELECT * FROM customers;
SELECT * FROM orders;


SELECT * FROM products
WHERE price>3.0 and coffee_origin = 'indonesia';

SELECT * FROM customers
WHERE phone_number is not NULL;

-- SELECT customer_id, customer_name, address,phone_no from customers
-- WHERE email_id is NOT NULL
-- ORDER BY customer_id;

SELECT first_name, phone_number FROM customers
WHERE gender = 'F' and last_name = 'Bluth';

-- SELECT department_name FROM Department
-- WHERE department_block_number = 3
-- ORDER BY department_name
SELECT * FROM customers
WHERE gender = 'M' and phone_number is NULL;


SELECT  car_id,car_name,car_type FROM cars
WHERE car_name = 'Maruthi' and car_type = 'Sedan';

SELECT * FROM orders;

SELECT product_id,customer_id,order_time FROM orders
WHERE customer_id BETWEEN 5 AND 10;

-- SELECT partner_id,partner_name,phone_no FROM delivery_partners
-- WHERE rating BETWEEN 3 AND 5
-- ORDER BY partner_id;



SELECT * FROM customers
-- WHERE last_name LIKE '%o%';
ORDER BY last_name ASC;


SELECT * FROM products
-- ORDER BY  price ASC;
ORDER BY  price DESC;

SELECT name,price FROM products
WHERE coffee_origin IN ('sri lanka','indonesia')
ORDER BY name;

SELECT name AS coffee FROM products;
SELECT * FROM products;


SELECT DISTINCT last_name FROM customers
ORDER BY last_name;

SELECT name, price AS retail_price, coffee_origin FROM products; 

SELECT * FROM orders
WHERE order_time BETWEEN '2017-02-01' AND '2017-02-28'
AND customer_id = 1
ORDER BY order_time ASC
LIMIT 3;


SELECT * FROM products;
SELECT * FROM orders;

SELECT products.name ,products.price, orders.order_time FROM orders
INNER JOIN products  ON orders.product_id = products.id
ORDER BY orders.order_time;

-- SELECT s.student_name, d.department_name FROM Student s
-- INNER JOIN Department d ON s.department_id = d.department_id
-- WHERE s.city = 'Coimbatore'
-- ORDER BY s.student_name;

-- SELECT c.car_id, c.car_name, o.owner_name FROM cars c
-- JOIN owners o ON o.owner_id = c.owner_id 
-- WHERE c.car_type = 'Hatchback' OR c.car_type = 'SUV'
-- ORdER By c.car_id;
UPDATE orders
SET customer_id = null
WHERE id = 1;

SELECT o.id,c.phone_number,c.last_name,o.order_time FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id 
ORDER BY o.order_time
LIMIT 10;


-- joining products,customers, orders tables

SELECT p.name, p.price,c.first_name,c.last_name, o.order_time FROM products p
JOIN orders o ON p.id = o.product_id
JOIN customers c ON c.id = o.customer_id
WHERE c.last_name = 'Martin'
ORDER BY o.order_time;

-- SELECT o.order_id, c.customer_name, h.hotel_name, o.order_amount FROM orders o
-- JOIN customers c ON c.customer_id = o.customer_id
-- JOIN hotel_details h ON h.hotel_id = o.hotel_id
-- ORDER BY o.order_id;

SELECT CONCAT(first_name," ",last_name) AS full_name from customers;

SELECT SUBSTRING(first_name,2) AS short_name FROM customers;

-- SELECT CONCAT(owner_name,owner_id) AS username , CONCAT(SUBSTRING(owner_name,3),owner_id) AS password FROM owners;

-- SELECT order_date, sum(total_order) AS total_order FRom orders
-- GROUP BY order_date
-- ORDER BY  order_date;

-- SELECT DISTINCT o.owner_id, o.owner_name,o.address,o.phone_no FROM owners o
-- JOIN cars c ON c.owner_id = o.owner_id
-- WHERE c.cars_type LIKE '%M%'
-- ORDER BY o.owner_id;

-- SELECT DISTINCT h.hotel_id,h.hotel_name,rating from hotel_details h
-- JOIN orders o ON o.hotel_id = h.hotel_id
-- WHERE o.order_date BETWEEN '2019-07-01' AND '2019-07-31'
-- ORDER BY o.order_date DESC;

-- SELECT rental_id, car_id,customer_id, km_driven FROM rentals
-- WHERE pickup_date >= '2019-08-01' and pickup_date<= '2019-08-31'
-- ORDER by rental_id;

-- SELECT car_id, COUNT(car_id) AS no_of_trips FROM rentals
-- GROUP BY car_id
-- ORDER BY car_id;


-- SELECT  partner_id,partner_name,(
-- 	case
--     WHEN rating >=4 THEN 'GOOD'
--     WHEN rating >=2 AND rating<4 THEN 'AVERAGE'
--     ELSE 'WORST'
--     END
--     )
--     AS review
--     FROM delivery_partners
--     ORDER BY partner_id;

-- SELECT customer_id,customer_name,(
-- 	CASE
-- 		WHEN email_id is NULL THEN 'NA'
-- 		WHEN address is NULL THEN  email_id
-- 		ELSE address
--     END
--     ) AS contact_details
--     FROM customers
--     ORDER BY customer_id;


-- SELECT h.hotel_id,h.hotel_name,h.hotel_type FROM hotel_details h
-- JOIN orders o ON o.hotel_id = h.hotel_id
-- WHERE MONTH(o.order_date) = '5'  is NULL
-- ORDER BY hotel_id; 

-- SELECT h.hotel_id,h.hotel_name,COUNT(o.hotel_id) AS no_of_orders FROM hotel_details h
-- JOIN orders o ON o.hotel_id = h.hotel_id
-- GROUP BY o.hotel_id
-- ORDER BY h.hotel_id;

-- SELECT cars.car_id, cars.car_name,cars,car_type FROM cars c
-- JOIN rentals r ON  r.car_id = c.car_id
-- WHERE rentals.pickup_date is NULL
-- ORDER BY car_id;

-- SELECT CONCAT(hotel_name,"is a ",hotel_type,"hotel") AS hotel_info FROM hotel_details;

-- SELECT CONCAT(customer_id,' is',email_id) AS customer_mail_info FROM customers;
 