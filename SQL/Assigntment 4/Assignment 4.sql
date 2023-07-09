DROP DATABASE IF EXISTS assignment_0044;
CREATE DATABASE IF NOT EXISTS assignment_004;
USE assignment_004;

-- Tạo bảng department
DROP TABLE IF EXISTS department;
CREATE TABLE IF NOT EXISTS department (
    department_id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50) NOT NULL
);

-- Tạo bảng position
DROP TABLE IF EXISTS position;
CREATE TABLE IF NOT EXISTS position (
    position_id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    position_name ENUM('Dev', 'Test', 'Scrum Master', 'PM') NOT NULL
);

-- Tạo bảng account
DROP TABLE IF EXISTS account;
CREATE TABLE IF NOT EXISTS account (
    account_id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(50) NOT NULL UNIQUE,
    username VARCHAR(50) NOT NULL UNIQUE,
    full_name VARCHAR(50) NOT NULL,
    department_id TINYINT UNSIGNED,
    position_id TINYINT UNSIGNED,
    created_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (department_id) REFERENCES department (department_id),
    FOREIGN KEY (position_id) REFERENCES position (position_id)
);

-- Tạo bảng group
DROP TABLE IF EXISTS `group`;
CREATE TABLE IF NOT EXISTS `group` (
    group_id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    group_name VARCHAR(50) NOT NULL,
    creator_id TINYINT UNSIGNED,
    created_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (creator_id) REFERENCES `account` (account_id)
);

-- Tạo bảng group_account
DROP TABLE IF EXISTS group_account;
CREATE TABLE IF NOT EXISTS group_account (
    group_id TINYINT UNSIGNED,
    account_id TINYINT UNSIGNED,
    joined_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    PRIMARY KEY (group_id, account_id),
    FOREIGN KEY (group_id) REFERENCES `group` (group_id),
    FOREIGN KEY (account_id) REFERENCES `account` (account_id)
);

-- Tạo bảng type_question
DROP TABLE IF EXISTS type_question;
CREATE TABLE IF NOT EXISTS type_question (
    type_id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    type_name ENUM('Essay', 'Multiple-Choice') NOT NULL
);

-- Tạo bảng category_question
DROP TABLE IF EXISTS category_question;
CREATE TABLE IF NOT EXISTS category_question (
    category_id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL
);

-- Tạo bảng question
DROP TABLE IF EXISTS question;
CREATE TABLE IF NOT EXISTS question (
    question_id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(50) NOT NULL,
    category_id TINYINT UNSIGNED,
    type_id TINYINT UNSIGNED,
    creator_id TINYINT UNSIGNED,
    created_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (category_id) REFERENCES category_question (category_id),
    FOREIGN KEY (type_id) REFERENCES type_question (type_id),
    FOREIGN KEY (creator_id) REFERENCES `account` (account_id)
);

-- Tạo bảng answer
DROP TABLE IF EXISTS answer;
CREATE TABLE IF NOT EXISTS answer (
    answer_id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(50) NOT NULL,
    question_id TINYINT UNSIGNED,
    is_correct BOOLEAN NOT NULL,
    FOREIGN KEY (question_id) REFERENCES question (question_id)
);

-- Tạo bảng exam
DROP TABLE IF EXISTS exam;
CREATE TABLE IF NOT EXISTS exam (
    exam_id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `code` CHAR(10) NOT NULL,
    title VARCHAR(50) NOT NULL,
    category_id TINYINT UNSIGNED,
    duration TINYINT UNSIGNED NOT NULL,
    creator_id TINYINT UNSIGNED,
    created_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (category_id) REFERENCES category_question (category_id),
    FOREIGN KEY (creator_id) REFERENCES `account` (account_id)
);

-- Tạo bảng exam_question
DROP TABLE IF EXISTS exam_question;
CREATE TABLE IF NOT EXISTS exam_question (
    exam_id TINYINT UNSIGNED,
    question_id TINYINT UNSIGNED,
    PRIMARY KEY (exam_id, question_id),
    FOREIGN KEY (exam_id) REFERENCES exam (exam_id),
    FOREIGN KEY (question_id) REFERENCES question (question_id)
);

-- Thêm dữ liệu cho bảng department
INSERT INTO department  (department_name)
VALUES                  ('Marketing'    ),
                        ('Sale'         ),
                        ('Bảo vệ'       ),
                        ('Nhân sự'      ),
                        ('Kỹ thuật'     ),
                        ('Tài chính'    ),
                        ('Phò giám đốc' ),
                        ('Giám đốc'     ),
                        ('Thư kí'       ),
                        ('Bán hàng'     ); 

-- Thêm dữ liệu cho bảng position
INSERT INTO `position`  (position_name )
VALUES                  ('Dev'         ),
                        ('Test'        ),
                        ('Scrum Master'),
                        ('PM'          );

-- Thêm dữ liệu cho bảng account
INSERT INTO `account`   (email                           , username      , full_name           , department_id, position_id, created_date)
VALUES                  ('haidang29productions@gmail.com', 'dangblack'   , 'Nguyen Hai Dang'   , 5            , 1          , '2020-03-05'),
                        ('account1@gmail.com'            , 'quanganh'    , 'Tong Quang Anh'    , 1            , 2          , '2020-03-05'),
                        ('account2@gmail.com'            , 'vanchien'    , 'Nguyen Van Chien'  , 2            , 3          , '2020-03-07'),
                        ('account3@gmail.com'            , 'cocoduongqua', 'Duong Do'          , 3            , 4          , '2020-03-08'),
                        ('account4@gmail.com'            , 'doccocaubai' , 'Nguyen Chien Thang', 4            , 4          , '2020-03-10'),
                        ('dapphatchetngay@gmail.com'     , 'khabanh'     , 'Ngo Ba Kha'        , 6            , 3          , '2020-04-05'),
                        ('songcodaoly@gmail.com'         , 'huanhoahong' , 'Bui Xuan Huan'     , 7            , 2          , '2020-04-05'),
                        ('sontungmtp@gmail.com'          , 'tungnui'     , 'Nguyen Thanh Tung' , 8            , 1          , '2020-04-07'),
                        ('duongghuu@gmail.com'           , 'duongghuu'   , 'Duong Van Huu'     , 9            , 2          , '2020-04-07'),
                        ('vtiaccademy@gmail.com'         , 'vtiaccademy' , 'Vi Ti Ai'          , 10           , 1          , '2020-04-09');

-- Thêm dữ liệu cho bảng group
INSERT INTO `group` (group_name         , creator_id, created_date)
VALUES              ('Testing System'   , 5         , '2019-03-05'),
                    ('Developement'     , 1         , '2020-03-07'),
                    ('VTI Sale 01'      , 2         , '2020-03-09'),
                    ('VTI Sale 02'      , 3         , '2020-03-10'),
                    ('VTI Sale 03'      , 4         , '2020-03-28'),
                    ('VTI Creator'      , 6         , '2020-04-06'),
                    ('VTI Marketing 01' , 7         , '2020-04-07'),
                    ('Management'       , 8         , '2020-04-08'),
                    ('Chat with love'   , 9         , '2020-04-09'),
                    ('Vi Ti Ai'         , 10        , '2020-04-10');

-- Thêm dữ liệu cho bảng group_account
INSERT INTO group_account   (group_id, account_id, joined_date )
VALUES                      (1       , 1         , '2019-03-05'),
                            (2       , 2         , '2020-03-07'),
                            (3       , 3         , '2020-03-09'),
                            (4       , 4         , '2020-03-10'),
                            (5       , 5         , '2020-03-28'),
                            (6       , 6         , '2020-04-06'),
                            (7       , 7         , '2020-04-07'),
                            (8       , 8         , '2020-04-08'),
                            (9       , 9         , '2020-04-09'),
                            (10      , 10        , '2020-04-10');

-- Thêm dữ liệu cho bảng type_question
INSERT INTO type_question (type_name) VALUES ('Essay'), ('Multiple-Choice'); 

-- Thêm dữ liệu cho bảng category_question
INSERT INTO category_question   (category_name)
VALUES                          ('Java'       ),
                                ('ASP.NET'    ),
                                ('ADO.NET'    ),
                                ('SQL'        ),
                                ('Postman'    ),
                                ('Ruby'       ),
                                ('Python'     ),
                                ('C++'        ),
                                ('C Sharp'    ),
                                ('PHP'        ); 

-- Thêm dữ liệu cho bảng question
INSERT INTO question    (content          , category_id, type_id, creator_id, created_date)
VALUES                  ('Câu hỏi về Java', 1          , 1      , 1         , '2020-04-05'),
                        ('Câu Hỏi về PHP' , 10         , 2      , 2         , '2020-04-05'),
                        ('Hỏi về C#'      , 9          , 2      , 3         , '2020-04-06'),
                        ('Hỏi về Ruby'    , 6          , 1      , 4         , '2020-04-06'),
                        ('Hỏi về Postman' , 5          , 1      , 5         , '2020-04-06'),
                        ('Hỏi về ADO.NET' , 3          , 2      , 6         , '2020-04-06'),
                        ('Hỏi về ASP.NET' , 2          , 1      , 7         , '2020-04-06'),
                        ('Hỏi về C++'     , 8          , 1      , 8         , '2020-04-07'),
                        ('Hỏi về SQL'     , 4          , 2      , 9         , '2020-04-07'),
                        ('Hỏi về Python'  , 7          , 1      , 10        , '2020-04-07');

-- Thêm dữ liệu cho bảng answer
INSERT INTO answer  (content     , question_id, is_correct)
VALUES              ('Trả lời 01', 1          , 0         ),
                    ('Trả lời 02', 1          , 1         ),
                    ('Trả lời 03', 1          , 0         ),
                    ('Trả lời 04', 1          , 1         ),
                    ('Trả lời 05', 2          , 1         ),
                    ('Trả lời 06', 3          , 1         ),
                    ('Trả lời 07', 4          , 0         ),
                    ('Trả lời 08', 8          , 0         ),
                    ('Trả lời 09', 9          , 1         ),
                    ('Trả lời 10', 10         , 1         );

-- Thêm dữ liệu cho bảng exam
INSERT INTO exam    (`code`   , title           , category_id, duration, creator_id, created_date)
VALUES              ('VTIQ001', 'Đề thi C#'     , 1          , 60      , 5         , '2019-04-05'),
                    ('VTIQ002', 'Đề thi PHP'    , 10         , 60      , 1         , '2019-04-05'),
                    ('VTIQ003', 'Đề thi C++'    , 9          , 120     , 2         , '2019-04-07'),
                    ('VTIQ004', 'Đề thi Java'   , 6          , 60      , 3         , '2020-04-08'),
                    ('VTIQ005', 'Đề thi Ruby'   , 5          , 120     , 4         , '2020-04-10'),
                    ('VTIQ006', 'Đề thi Postman', 3          , 60      , 6         , '2020-04-05'),
                    ('VTIQ007', 'Đề thi SQL'    , 2          , 60      , 7         , '2020-04-05'),
                    ('VTIQ008', 'Đề thi Python' , 8          , 60      , 8         , '2020-04-07'),
                    ('VTIQ009', 'Đề thi ADO.NET', 4          , 90      , 9         , '2020-04-07'),
                    ('VTIQ010', 'Đề thi ASP.NET', 7          , 90      , 10        , '2020-04-08');

-- Thêm dữ liệu cho bảng exam_question
INSERT INTO exam_question   (question_id, exam_id)
VALUES                      (1          , 1      ),
                            (2          , 2      ),
                            (3          , 3      ),
                            (4          , 4      ),
                            (5          , 5      ),
                            (6          , 6      ),
                            (7          , 7      ),
                            (8          , 8      ),
                            (9          , 9      ),
                            (10         , 10     );
                            
-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ 
  SELECT full_name, department_name
  FROM `account` 
  INNER JOIN department USING (department_id);

-- Question 2: Viết lệnh để lấy ra các account được tạo sau ngày 20/12/2010                            
  SELECT *
  FROM `account`
  WHERE created_date > '2010-12-20';
  
  -- Question 3: Viết lệnh để lấy ra tất cả các DEV 
  SELECT full_name, position_name
  FROM `account`
  INNER JOIN position USING ( position_id)
  WHERE position_name = 'Dev';
  
  -- Question 4: Viết lệnh để lấy ra phòng ban có >3 nhân viên 
  SELECT department_name ,COUNT(*) AS 'số lượng nhân viên '
  FROM `account`
  JOIN department USING ( department_id)
  GROUP BY department_id
  HAVING COUNT(*) > 0 ;
  
  -- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất 
SELECT content ,(question_id) AS 'Số lượng đề thi'
FROM question 
LEFT JOIN exam_question USING ( question_id)
GROUP BY question_id
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Question 6: Thống kê mỗi category question được sử dụng trong bao nhiêu question 
SELECT COUNT(*)
FROM category_question 
LEFT JOIN question USING( category_id)
GROUP BY category_id;

-- Question 7: Thống kê mỗi question được sử dụng trong bao nhiêu exam 
SELECT content ,COUNT(question_id)
FROM exam_question 
INNER JOIN question USING (question_id)
GROUP BY question_id;

-- Question 8: Lấy ra question có nhiều câu trả lời nhất 
SELECT question.content ,COUNT(*) AS 'số câu trả lời'
FROM answer
RIGHT JOIN question USING ( question_id)
GROUP BY question_id
ORDER BY COUNT(*) DESC 
LIMIT 1;

-- Question 9: Thống kê số lượng account trong mỗi group
SELECT group_name, COUNT(*)
FROM `group`
LEFT JOIN group_account USING ( group_id)
GROUP BY group_id;

-- Question 10: Tìm chức vụ có ít người nhất 
SELECT department_name, COUNT(department_id)
FROM department
LEFT JOIN `account` USING ( department_id)
GROUP BY department_id 
ORDER BY COUNT(department_id) ASC 
LIMIT 1;

-- Question 11: Thống kê mỗi phòng ban có bao nhiêu DEV, TEST, SCRUM MASTER, PM				
SELECT department_name, position_name,  COUNT(*) AS ' số lượng'
FROM `account` 
INNER JOIN position USING ( position_id)
INNER JOIN department USING (department_id)
GROUP BY position_id, department_id;

-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm : thông tin cơ bản của question,
-- loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì 
SELECT question.content, type_name, full_name, is_correct
FROM question 
JOIN type_question USING ( type_id)
JOIN category_question USING ( category_id)
JOIN answer USING ( question_id)
JOIN `account` ON (account_id= creator_id);

-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm 

SELECT type_name, COUNT(type_id) AS' số lượng câu hỏi' 
FROM question 
JOIN type_question USING ( type_id)
GROUP BY type_id;


-- Question 14 và 15: Lấy ra group không có account nào
SELECT group_name
FROM `group`
INNER JOIN group_account USING ( group_id)
WHERE account_id IS NULL;

-- Question 16: Lấy ra question không có answer nào 
SELECT question.content
FROM question 
LEFT JOIN answer USING ( question_id)
WHERE answer_id IS NULL; 



    
    
    
    