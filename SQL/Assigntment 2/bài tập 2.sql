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
	position_name ENUM( 'Dev', 'Test',' Scrum Master',' PM') NOT NULL UNIQUE KEY
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

-- Tạo bảng group
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group`(
	group_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
    group_name VARCHAR(50) UNIQUE NOT NULL,
    creator_id TINYINT UNSIGNED ,
    create_date DATETIME DEFAULT NOW()
);
-- Tạo bảng group_account

DROP TABLE IF EXISTS group_account;
CREATE TABLE group_account(
	group_id TINYINT UNSIGNED NOT NULL,
    account_id TINYINT UNIQUE NOT NULL,
    join_date DATETIME DEFAULT NOW(),
	PRIMARY KEY (group_id, account_id);

    
    
    
-- Tạo bảng type_question

DROP TABLE IF EXISTS type_question;
CREATE TABLE type_question(
	type_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    type_name ENUM('Essay',' Multiple-Choice') NOT NULL UNIQUE KEY 
    );
-- Tạo bảng question

DROP TABLE IF EXISTS question;
 CREATE TABLE question(
	question_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
    content VARCHAR(150) NOT NULL, 
    category_id TINYINT UNSIGNED NOT NULL ,
    type_id TINYINT UNSIGNED NOT NULL ,
    creator_id TINYINT UNSIGNED NOT NULL ,
    create_date DATETIME DEFAULT NOW()
    );
-- Tạo bảng answer
    
DROP TABLE IF EXISTS answer;
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
    
    
INSERT INTO department(department_name)
VALUES				 ( ' Bảo vệ'),
					(' Kế toán '),
                    (' Tiếp khách'),
                    ( ' Kế hoạch');
                    
    
INSERT INTO position (position_name)
VALUES 		('Dev' ),
			('Test' ),
			('Scrum Master'),
			('PM' );
            
            
INSERT INTO `account` (email, username, fullname, department_id, position_id, create_date)
VALUES ('Email1@gmail.com' ,
'Username1' ,'Fullname1' , '5' , '1'
,'2020-03-05'),
('Email2@gmail.com' ,
'Username2' ,'Fullname2' , '1' , '2'
,'2020-03-05'),('Email3@gmail.com' , 'Username3' ,'Fullname3'
, '2' , '2' ,'2020-03-07'),
('Email4@gmail.com' , 'Username4' ,'Fullname4'
, '3' , '4' ,'2020-03-08'),
('Email5@gmail.com' , 'Username5' ,'Fullname5'
, '4' , '4' ,'2020-03-10'),
('Email6@gmail.com' , 'Username6' ,'Fullname6'
, '6' , '3' ,'2020-04-05'),
('Email7@gmail.com' , 'Username7' ,'Fullname7'
, '2' , '2' , NULL ),
('Email8@gmail.com' , 'Username8' ,'Fullname8'
, '8' , '1' ,'2020-04-07'),
('Email9@gmail.com' , 'Username9' ,'Fullname9'
, '2' , '2' ,'2020-04-07');


INSERT INTO `group` (group_name, creator_id, create_date)
VALUES 			('group1' , '1' , '2023/02/01' ),
				('group2' , '2' , '2023/02/03' ),
                ('group3' , '3' , '2023/02/05' ),
                ('group4' , '4' , '2023/03/03' ),
                ('group5' , '5' , '2023/03/02' ),
				('group6' , '6' , '2023/03/10' ),
                ('group7' , '7' , '2023/03/12' );
                
                
INSERT INTO group_account ( group_id , account_id , join_date )
VALUES 					  ( '1', '2', '2023/06/10'),
						  ( '3', '1', '2023/06/13'),
                          ( '2', '3', '2023/06/15'),
                          ( '4', '2', '2023/06/17'),
                          ( '5', '4', '2023/06/20'),
                          ( '6', '5', '2023/06/21');
                          

INSERT INTO type_question (type_name)
VALUES      ('Essay'),
            ('Multiple-Choice');
            
INSERT INTO question(content, category_id, type_id, creator_id, create_date)
VALUES				(' Câu hỏi về toán học', '1', '2', '3', '2022/02/01'),
					(' Câu hỏi về hoá học', '2', '3', '4', '2022/02/02'),
                    (' Câu hỏi về văn học', '3', '1', '1', '2022/02/04'),
                    (' Câu hỏi về vật lý', '4', ' 5', '8', '2022/02/06'),
                    (' Câu hỏi về địa lý', '6', '10', '5', '2022/02/15');
                    
 INSERT INTO answer( content, question_id, is_correct)
 VALUES				(' Câu trả lời 1', '2', '0'),
					(' Câu trả lời 2', '1', '1'),
                    (' Câu trả lời 3', ' 4', '1'),
                    (' Câu trả lời 4', '5', '0');
                    
INSERT INTO exam(`code`, title, category_id, duration, creator_id, create_date)
VALUES			('VN01', '
                    

                    
                    
            
         

            

                    

                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
	

            





