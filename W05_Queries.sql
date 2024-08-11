USE art_gallery;

-- 1

SELECT artfile
FROM artwork
WHERE period = 'Impressionism';

-- 2
SELECT a.artfile
FROM artwork a
JOIN artwork_has_keyword ahk ON a.artwork_id = ahk.artwork_id
JOIN keyword k ON ahk.keyword_id = k.keyword_id
WHERE k.keyword LIKE '%flower%';

-- 3
SELECT ar.fname, ar.lname, aw.title
FROM artist ar
LEFT JOIN artwork aw ON ar.artist_id = aw.artist_id;

USE magazine ;

-- 4
SELECT m.magazineName, s.subscriberLastName, s.subscriberFirstName
FROM subscription s
JOIN magazine m ON s.magazine_id = m.magazine_id
ORDER BY m.magazineName;

-- 5
SELECT m.magazineName
FROM subscription s
JOIN magazine m ON s.magazine_id = m.magazine_id
WHERE s.subscriberLastName = 'Sanders' AND s.subscriberFirstName = 'Samantha';

USE employees;

-- 6
SELECT e.first_name, e.last_name
FROM employees e
JOIN dept_emp ed ON e.emp_no = ed.emp_no
JOIN departments d ON ed.dept_no = d.dept_no
WHERE d.dept_name = 'Customer Service'
ORDER BY e.last_name ASC
LIMIT 5;

-- 7
SELECT e.first_name, e.last_name, s.salary, d.dept_name
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
JOIN dept_emp ed ON e.emp_no = ed.emp_no
JOIN departments d ON ed.dept_no = d.dept_no
WHERE e.first_name = 'Berni' AND e.last_name = 'Genin'
ORDER BY s.to_date DESC
LIMIT 1;

USE bike;
-- 8
SELECT ROUND(AVG(quantity)) AS average_quantity
FROM stock;

-- 9
SELECT DISTINCT p.product_name
FROM stock s
JOIN product p ON s.product_id = p.product_id
WHERE s.quantity = 0
ORDER BY p.product_name;

-- 10 
SELECT c.category_name, SUM(s.quantity) AS total_inventory
FROM stock s
JOIN product p ON s.product_id = p.product_id
JOIN category c ON p.category_id = c.category_id
WHERE s.store_id = 2
GROUP BY c.category_name
ORDER BY total_inventory ASC;

USE employees;
-- 11
SELECT COUNT(*) AS total_employees
FROM employees;

-- 12
SELECT d.dept_name,
       FORMAT(AVG(s.salary), 2) AS avg_salary
FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN salaries s ON de.emp_no = s.emp_no
GROUP BY d.dept_name
HAVING AVG(s.salary) < 60000;

-- 13
SELECT d.dept_name,
       COUNT(e.emp_no) AS female_count
FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN employees e ON de.emp_no = e.emp_no
WHERE e.gender = 'F'
GROUP BY d.dept_name
ORDER BY d.dept_name;

