SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `university` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `university` ;

-- -----------------------------------------------------
-- Table `college`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `college` (
  `college_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`college_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `department` (
  `department_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `college_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`department_id`),
  INDEX `college_id_idx` (`college_id` ASC) VISIBLE,
  CONSTRAINT `department_ibfk_1`
    FOREIGN KEY (`college_id`)
    REFERENCES `college` (`college_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `course` (
  `course_id` INT NOT NULL AUTO_INCREMENT,
  `department_id` INT NULL DEFAULT NULL,
  `course_num` VARCHAR(10) NULL DEFAULT NULL,
  `course_title` VARCHAR(255) NULL DEFAULT NULL,
  `credits` INT NULL DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  INDEX `department_id_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `course_ibfk_1`
    FOREIGN KEY (`department_id`)
    REFERENCES `department` (`department_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student` (
  `student_id` INT NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(255) NULL DEFAULT NULL,
  `lname` VARCHAR(255) NULL DEFAULT NULL,
  `gender` CHAR(1) NULL DEFAULT NULL,
  `city` VARCHAR(255) NULL DEFAULT NULL,
  `state` VARCHAR(255) NULL DEFAULT NULL,
  `birthdate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`student_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `faculty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `faculty` (
  `faculty_id` INT NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(255) NULL DEFAULT NULL,
  `lname` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`faculty_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `section`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `section` (
  `section_id` INT NOT NULL AUTO_INCREMENT,
  `course_id` INT NULL DEFAULT NULL,
  `year` YEAR NULL DEFAULT NULL,
  `term` VARCHAR(10) NULL DEFAULT NULL,
  `faculty_id` INT NULL DEFAULT NULL,
  `capacity` INT NULL DEFAULT NULL,
  PRIMARY KEY (`section_id`),
  INDEX `course_id_idx` (`course_id` ASC) VISIBLE,
  INDEX `faculty_id_idx` (`faculty_id` ASC) VISIBLE,
  CONSTRAINT `section_ibfk_1`
    FOREIGN KEY (`course_id`)
    REFERENCES `course` (`course_id`),
  CONSTRAINT `section_ibfk_2`
    FOREIGN KEY (`faculty_id`)
    REFERENCES `faculty` (`faculty_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `enrollment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enrollment` (
  `enrollment_id` INT NOT NULL AUTO_INCREMENT,
  `student_id` INT NULL DEFAULT NULL,
  `section_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`enrollment_id`),
  INDEX `student_id_idx` (`student_id` ASC) VISIBLE,
  INDEX `section_id_idx` (`section_id` ASC) VISIBLE,
  CONSTRAINT `enrollment_ibfk_1`
    FOREIGN KEY (`student_id`)
    REFERENCES `student` (`student_id`),
  CONSTRAINT `enrollment_ibfk_2`
    FOREIGN KEY (`section_id`)
    REFERENCES `section` (`section_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;



-- Insert Data into College Table
INSERT INTO college (name) VALUES
    ('College of Physical Science and Engineering'),
    ('College of Business and Communication'),
    ('College of Language and Letters');

-- Insert Data into Department Table
INSERT INTO department (name, college_id) VALUES
    ('Computer Information Technology', 1),
    ('Economics', 2),
    ('Humanities and Philosophy', 3);

-- Insert Data into Course Table
INSERT INTO course (department_id, course_num, course_title, credits) VALUES
    (1, 'ITM 111', 'Intro to Databases', 3),
    (2, 'ECON 388', 'Econometrics', 4),
    (2, 'ECON 150', 'Micro Economics', 3),
    (3, 'HUM 376', 'Classical Heritage', 2);

-- Insert Data into Faculty Table
INSERT INTO faculty (fname, lname) VALUES
    ('Marty', 'Morring'),
    ('Nate', 'Norris'),
    ('Ben', 'Barrus'),
    ('John', 'Jensen'),
    ('Bill', 'Barney');

-- Insert Data into Student Table
INSERT INTO student (fname, lname, gender, city, state, birthdate) VALUES
    ('Paul', 'Miller', 'M', 'Dallas', 'TX', '1996-02-22'),
    ('Katie', 'Smith', 'F', 'Provo', 'UT', '1995-07-22'),
    ('Kelly', 'Jones', 'F', 'Provo', 'UT', '1998-06-22'),
    ('Devon', 'Merrill', 'M', 'Mesa', 'AZ', '2000-07-22'),
    ('Mandy', 'Murdock', 'F', 'Topeka', 'KS', '1996-11-22'),
    ('Alece', 'Adams', 'F', 'Rigby', 'ID', '1997-05-22'),
    ('Bryce', 'Carlson', 'M', 'Bozeman', 'MT', '1997-11-22'),
    ('Preston', 'Larsen', 'M', 'Decatur', 'TN', '1996-09-22'),
    ('Julia', 'Madsen', 'F', 'Rexburg', 'ID', '1998-09-22'),
    ('Susan', 'Sorensen', 'F', 'Mesa', 'AZ', '1998-08-09');

-- Insert Data into Section Table
INSERT INTO section (course_id, year, term, faculty_id, capacity) VALUES
    (1, 2019, 'Fall', 1, 30),
    (3, 2019, 'Fall', 2, 50),
    (3, 2019, 'Fall', 2, 50),
    (2, 2019, 'Fall', 3, 35),
    (4, 2019, 'Fall', 4, 30),
    (1, 2018, 'Winter', 1, 30),
    (1, 2018, 'Winter', 5, 35),
    (3, 2018, 'Winter', 2, 50),
    (3, 2018, 'Winter', 2, 50),
    (4, 2018, 'Winter', 4, 30);

-- Insert Data into Enrollment Table
INSERT INTO enrollment (student_id, section_id) VALUES
    (6, 7),
    (7, 6),
    (7, 8),
    (7, 10),
    (4, 5),
    (9, 9),
    (2, 4),
    (3, 4),
    (5, 4),
    (5, 5),
    (1, 1),
    (1, 3),
    (8, 9),
    (10, 6);

-- 1: Students, and their birthdays, of students born in September. 
-- Format the date to look like it is shown in the result set. Sort by the student's last name.
SELECT fname, lname, DATE_FORMAT(birthdate, '%M %d, %Y') AS birthdate
FROM student
WHERE MONTH(birthdate) = 9
ORDER BY lname;

-- 2: Student's age in years and days as of Jan. 5, 2017. Sorted from oldest to youngest. 
SELECT  lname, fname,
       TIMESTAMPDIFF(YEAR, birthdate, '2017-01-05') AS years,
       TIMESTAMPDIFF(DAY, birthdate, '2017-01-05') % 365 AS days,
       CONCAT(TIMESTAMPDIFF(YEAR, birthdate, '2017-01-05'), ' - Yrs, ', 
              TIMESTAMPDIFF(DAY, birthdate, '2017-01-05') % 365, ' days') AS 'years and days'
FROM student
ORDER BY birthdate;

-- 3: Students taught by John Jensen. Sorted by student's last name.
SELECT s.fname, s.lname
FROM enrollment e
JOIN section sec ON e.section_id = sec.section_id
JOIN faculty f ON sec.faculty_id = f.faculty_id
JOIN student s ON e.student_id = s.student_id
WHERE f.fname = 'John' AND f.lname = 'Jensen'
ORDER BY s.lname;

-- 4: Instructors Bryce will have in Winter 2018. Sort by the faculty's last name.
SELECT DISTINCT f.fname, f.lname
FROM enrollment e
JOIN section sec ON e.section_id = sec.section_id
JOIN faculty f ON sec.faculty_id = f.faculty_id
JOIN student s ON e.student_id = s.student_id
WHERE s.fname = 'Bryce' AND s.lname = 'Carlson' AND sec.term = 'Winter' AND sec.year = 2018
ORDER BY f.lname;

-- 5: Students that take Econometrics in Fall 2019. Sort by student last name.
SELECT s.fname, s.lname
FROM enrollment e
JOIN section sec ON e.section_id = sec.section_id
JOIN course c ON sec.course_id = c.course_id
JOIN student s ON e.student_id = s.student_id
WHERE c.course_title = 'Econometrics' AND sec.term = 'Fall' AND sec.year = 2019
ORDER BY s.lname;

-- 6: Report showing all of Bryce Carlson's courses for Winter 2018. Sort by the name of the course.
SELECT c.course_title
FROM enrollment e
JOIN section sec ON e.section_id = sec.section_id
JOIN course c ON sec.course_id = c.course_id
JOIN student s ON e.student_id = s.student_id
WHERE s.fname = 'Bryce' AND s.lname = 'Carlson' AND sec.term = 'Winter' AND sec.year = 2018
ORDER BY c.course_title;

-- 7: The number of students enrolled for Fall 2019
SELECT COUNT(DISTINCT e.student_id) AS student_count
FROM enrollment e
JOIN section sec ON e.section_id = sec.section_id
WHERE sec.term = 'Fall' AND sec.year = 2019;

-- 8: The number of courses in each college. Sort by college name.
SELECT col.name AS college_name, COUNT(DISTINCT c.course_id) AS course_count
FROM course c
JOIN department d ON c.department_id = d.department_id
JOIN college col ON d.college_id = col.college_id
GROUP BY col.name
ORDER BY col.name;

-- 9: The total number of students each professor can teach in Winter 2018. Sort by that total number of students (teaching capacity).
SELECT f.fname, f.lname, SUM(sec.capacity) AS total_capacity
FROM section sec
JOIN faculty f ON sec.faculty_id = f.faculty_id
WHERE sec.term = 'Winter' AND sec.year = 2018
GROUP BY f.faculty_id
ORDER BY total_capacity DESC;

-- 10: Each student's total credit load for Fall 2019, but only students with a credit load greater than three. 
-- Sort by credit load in descending order.
SELECT s.lname AS lname, s.fname AS fname, SUM(c.credits) AS Credits
FROM enrollment e
JOIN section sec ON e.section_id = sec.section_id
JOIN course c ON sec.course_id = c.course_id
JOIN student s ON e.student_id = s.student_id
WHERE sec.term = 'Fall' AND sec.year = 2019
GROUP BY s.student_id
HAVING SUM(c.credits) > 3
ORDER BY Credits DESC;

SELECT * FROM section WHERE term = 'Fall' AND year = 2019;

SELECT * FROM course;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
