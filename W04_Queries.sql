-- 1. Insert Artist Johannes Vermeer
USE art_gallery;
INSERT INTO artist (fname, lname, dob, dod, country, local_artist)
VALUES ('Johannes', 'Vermeer', 1632, 1674, 'Netherlands', 'n');



-- 2. List all Artist Records sorted by last name

SELECT * FROM artist
ORDER BY lname;

-- 3 update from datatbese
SET SQL_SAFE_UPDATES = 0;

UPDATE artist
SET dod = 1675
WHERE fname = 'Johannes' AND lname = 'Vermeer';

SET SQL_SAFE_UPDATES = 1;



-- 4. Delete Johannes Vermeer from the database

DELETE FROM artist
WHERE fname = 'Johannes' AND lname = 'Vermeer';

USE bike;
-- 5. List of customers from Houston, Texas with first and last names and phone numbers

SELECT first_name, last_name, phone
FROM customer
WHERE city = 'Houston';


-- 6. List of high-end bikes with discounted prices

SELECT product_name, list_price, 
       list_price - 500 AS 'Discount Price'
FROM product
WHERE list_price >= 5000
ORDER BY list_price DESC;


-- 7. List of all staff not from store_id 1 with their emails

SELECT first_name, last_name, email
FROM staff
WHERE store_id <> 1;


-- 8. List of bikes with 'spider' in the name

SELECT product_name, model_year, list_price
FROM product
WHERE product_name LIKE '%spider%';


-- 9. List of bikes priced between $500 and $550

SELECT product_name, list_price
FROM product
WHERE list_price BETWEEN 500 AND 550
ORDER BY list_price ASC;


-- 10. Customer details with phone number and city containing 'ach' or 'och', or last name William

USE bike;

SELECT first_name, last_name, phone, street, city, state, zip_code
FROM customer
WHERE phone IS NOT NULL
  AND (city LIKE '%ach%' OR city LIKE '%och%' OR last_name = 'William')
LIMIT 5;



-- 11. List of all products without the year at the end of the product_name

SELECT product_id, 
       RTRIM(SUBSTRING_INDEX(product_name, ' ', LENGTH(product_name) - LENGTH(REPLACE(product_name, ' ', '')) - 1)) AS 'product name without year'
FROM product
ORDER BY product_id
LIMIT 14;


-- 12. List the product name and divide the 2019 model year bike prices into 3 equal payments

SELECT product_name, 
       CONCAT('$', FORMAT(list_price / 3, 2)) AS 'One of 3 Payments'
FROM product
WHERE model_year = 2019;

USE magazine;
-- 13. List the magazine name with a 3% discount on the price

SELECT magazineName, 
       ROUND(magazinePrice - (magazinePrice * 0.03), 2) AS '3% off'
FROM magazine;


-- 14. Show the primary key of id from the subscriber table and the years since subscription started
SELECT 
    subscriberKey,
    ROUND(TIMESTAMPDIFF(YEAR, subscriptionStartDate, '2020-12-20')) AS 'years since subscription'
FROM 
    subscription;



-- 15. Show subscription start date, length, and end date formatted

SELECT subscriptionStartDate, subscriptionLength, 
       DATE_FORMAT(DATE_ADD(subscriptionStartDate, INTERVAL subscriptionLength YEAR), '%M %d, %Y') AS 'Subscription End'
FROM subscription;

