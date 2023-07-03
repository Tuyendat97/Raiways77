-- Tạo database testing system assignment
DROP DATABASE IF EXISTS testing_system_assignment_1;
CREATE DATABASE IF NOT EXISTS testing_system_assignment_1;
USE testing_system_assignment_1;

-- Tạo bảng deparment
DROP TABLE IF EXISTS department;
CREATE TABLE department(
	department_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL UNIQUE KEY
    );
-- Tạo bảng position

DROP TABLE IF EXISTS  position;
CREATE TABLE `position`(
	positions_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	positions_name ENUM( 'Dev', 'Test',' Scrum_Master',' PM') NOT NULL UNIQUE KEY
	);
-- Tạo bảng account

DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`(
    account_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
    email VARCHAR(50) UNIQUE KEY NOT NULL,
    username VARCHAR(50) UNIQUE KEY NOT NULL ,
    fullname VARCHAR(50) UNIQUE KEY NOT NULL,
    department_id TINYINT UNSIGNED NOT NULL ,
    position_id TINYINT UNSIGNED NOT NULL,
    create_date DATETIME DEFAULT NOW()
    );

-- Tạo bảng group1
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group`(
	group_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
    group_name VARCHAR(50) UNIQUE NOT NULL,
    creator_id TINYINT UNSIGNED ,
    create_date DATETIME DEFAULT NOW()
);
-- Tạo bảng group_account

DROP TABLE group_acconut;
CREATE TABLE group_account(
	group_id TINYINT UNSIGNED ,
    account_id TINYINT UNIQUE NOT NULL,
    join_date DATETIME DEFAULT NOW(),
    PRIMARY KEY(group_id, account_id)
    );
    
-- Tạo bảng type_question

DROP TABLE type_question;
CREATE TABLE type_question(
	type_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    type_name ENUM('Essay',' Multiple-Choice') NOT NULL UNIQUE KEY 
    );
-- Tạo bảng question

DROP TABLE question;
 CREATE TABLE question(
	question_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
    content VARCHAR(150) NOT NULL, 
    category_id TINYINT UNSIGNED NOT NULL ,
    type_id TINYINT UNSIGNED NOT NULL ,
    creator_id TINYINT UNSIGNED NOT NULL ,
    create_date DATETIME DEFAULT NOW()
    );
-- Tạo bảng answer
    
DROP TABLE answer;
CREATE TABLE answer(
	answer_id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT ,
    content VARCHAR(100) NOT NULL,
    question_id TINYINT UNSIGNED  NOT NULL ,
    is_correct BIT DEFAULT 1
    );
-- Tạo bảng exam
  
DROP TABLE IF EXISTS exam;
CREATE TABLE exam(
	exam_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
    `code` CHAR(10) NOT NULL,
    title VARCHAR(50) NOT NULL, 
    category_id TINYINT UNSIGNED NOT NULL,
    duration TINYINT UNSIGNED NOT NULL,
    creator_id TINYINT UNSIGNED NOT NULL ,
    create_date DATETIME DEFAULT NOW() 
    );
-- Tạo bảng examquestion

DROP TABLE IF EXISTS examquestion;
CREATE TABLE examquestion(
	exam_id TINYINT UNSIGNED PRIMARY KEY ,
    question_id TINYINT  NOT NULL 
    );
    
    






