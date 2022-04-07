CREATE DATABASE training;
USE training;

CREATE TABLE Trainer_info (
Trainer_id VARCHAR(20) PRIMARY KEY UNIQUE,
    Salutation VARCHAR(7),
    Trainer_Name VARCHAR(30),
    Trainer_Location VARCHAR(30),
    Trainer_Track VARCHAR(15),
    Trainer_Qualification VARCHAR(100),
    Trainer_Experiance INT(11),
    Trainer_Email VARCHAR(100),
    Trainer_Password VARCHAR(20)
);


CREATE TABLE Batch_info (
Batch_Id VARCHAR(20) PRIMARY KEY UNIQUE,
Batch_Owner  VARCHAR(30),
Batch_BU_Name VARCHAR(30)
   
);


CREATE TABLE Module_info (
Module_Id  VARCHAR(20) PRIMARY KEY UNIQUE,
Module_Name   VARCHAR(40),
Module_Duration  INT(11)
);


CREATE TABLE Associate_info (
Associate_Id  VARCHAR(20) PRIMARY KEY UNIQUE,
    Salutation VARCHAR(7),
    Associate_Name VARCHAR(30),
    Associate_Location VARCHAR(30),
    Associate_Track VARCHAR(15),
    Associate_Qualification VARCHAR(200),
    Associate_Email VARCHAR(100),
    Associate_Password VARCHAR(20)
);

CREATE TABLE Questions  (
Question_Id  VARCHAR(20) PRIMARY KEY UNIQUE,
Module_Id   VARCHAR(20),
Question_Text  VARCHAR(900),
    FOREIGN KEY (Module_Id) REFERENCES Module_info(Module_Id)
);


CREATE TABLE Associate_Status (
Associate_Id VARCHAR(20),
    Module_Id   VARCHAR(20),
    Batch_Id  VARCHAR(20),
    Start_Date VARCHAR(20),
    End_Date VARCHAR(20),
    AFeedbackGiven VARCHAR(20),
    TFeedbackGiven VARCHAR(20),
FOREIGN KEY (Module_Id) REFERENCES Module_info(Module_Id),
FOREIGN KEY (Batch_Id) REFERENCES Batch_info(Batch_Id)
   
);

CREATE TABLE Trainer_Feedback (
Trainer_id VARCHAR(20),
    Question_Id  VARCHAR(20),
    Batch_Id VARCHAR(20),
    Module_Id  VARCHAR(20),
    Trainer_Rating INT(11),
    FOREIGN KEY (Trainer_id) REFERENCES Trainer_info(Trainer_id),
    FOREIGN KEY (Question_Id) REFERENCES Questions(Question_Id),
    FOREIGN KEY (Batch_Id) REFERENCES Batch_info(Batch_Id),
    FOREIGN KEY (Module_Id) REFERENCES Module_info(Module_Id)
);


CREATE TABLE Associate_Feedback (
Associate_Id VARCHAR(20),
    Question_Id  VARCHAR(20),
    Module_Id  VARCHAR(20),
    Associate_Rating INT(11),
    FOREIGN KEY (Associate_Id) REFERENCES Associate_info(Associate_Id),
    FOREIGN KEY (Question_Id) REFERENCES Questions(Question_Id),
    FOREIGN KEY (Module_Id) REFERENCES Module_info(Module_Id)
);

CREATE TABLE Login_Details (
	User_Id VARCHAR(20) PRIMARY KEY UNIQUE,
    User_Password VARCHAR(20)
);

ALTER TABLE Associate_Status
ADD COLUMN Trainer_Id VARCHAR(20);

ALTER TABLE Associate_Status
ADD CONSTRAINT FK_Trainer_Id
FOREIGN KEY (Trainer_Id) REFERENCES Trainer_info(Trainer_Id);

INSERT INTO Trainer_Info (Trainer_Id,Salutation,Trainer_Name,Trainer_Location,Trainer_Track,Trainer_Qualification,Trainer_Experiance,Trainer_Email,Trainer_Password)
VALUES ('F001','Mr.','PANKAJ GHOSH','Pune','Java','Bachelor of Technology',12,'Pankaj.Ghosh@alliance.com','fac1@123' ),
('F002','Mr.','SANJAY RADHAKRISHNAN ','Bangalore','DotNet','Bachelor of Technology',12,'Sanjay.Radhakrishnan@alliance.com','fac2@123'),
('F003','Mr.','VIJAY MATHUR','Chennai','Mainframe','Bachelor of Technology',10,'Vijay.Mathur@alliance.com','fac3@123'),
('F004','Mrs.','NANDINI NAIR','Kolkata','Java','Master of Computer Applications',9,'Nandini.Nair@alliance.com','fac4@123'),
('F005','Miss.','ANITHA PAREKH','Hyderabad','Testing','Master of Computer Applications',6,'Anitha.Parekh@alliance.com','fac5@123'),
('F006','Mr.','MANOJ AGRAWAL' ,'Mumbai','Mainframe','Bachelor of Technology',9,'Manoj.Agrawal@alliance.com','fac6@123'),
('F007','Ms.','MEENA KULKARNI','Coimbatore','Testing','Bachelor of Technology',5,'Meena.Kulkarni@alliance.com','fac7@123'),
('F009','Mr.','SAGAR MENON ','Mumbai','Java','Master of Science In Information Technology',12,'Sagar.Menon@alliance.com','fac8@123');

INSERT INTO Batch_Info (Batch_Id,Batch_Owner,Batch_BU_Name)
VALUES ('B001','MRS.SWATI ROY','MSP'),
('B002','MRS.ARURNA K','HEALTHCARE'),
('B003','MR.RAJESH KRISHNAN','LIFE SCIENCES'),
('B004','MR.SACHIN SHETTY','BFS'),
('B005','MR.RAMESH PATEL','COMMUNICATIONS'),
('B006','MRS.SUSAN CHERIAN','RETAIL & HOSPITALITY'),
('B007','MRS.SAMPADA JAIN','MSP'),
('B008','MRS.KAVITA REGE','BPO'),
('B009','MR.RAVI SEJPAL','MSP');

INSERT INTO Module_Info (Module_Id,Module_Name,Module_Duration )
VALUES ('O10SQL','Oracle 10g SQL ',16 ),
('O10PLSQL','Oracle 10g PL/ SQL ',16),
('J2SE','Core Java SE 1.6',288) ,
('J2EE','Advanced Java EE 1.6',80),
('JAVAFX','JavaFX 2.1',80) ,
('DOTNT4','.Net Framework 4.0 ',50),
('SQL2008','MS SQl Server 2008',120),
('MSBI08','MS BI Studio 2008',158) ,
('SHRPNT','MS Share Point ',80 ),
('ANDRD4','Android 4.0',200 ),
('EM001','Instructor',0 ),
('EM002','Course Material',0),
('EM003','Learning Effectiveness',0),
('EM004','Environment',0),
('EM005','Job Impact',0 ),
('TM001','Attendees',0 ),
('TM002','Course Material',0),
('TM003','Environment',0 );

INSERT INTO Associate_Info (Associate_Id,Salutation,Associate_Name,Associate_Location,Associate_Track,Associate_Qualification,Associate_Email,Associate_Password )
VALUES ('A001','Miss.','GAYATHRI NARAYANAN','Gurgaon','Java','Bachelor of Technology','Gayathri.Narayanan@hp.com','tne1@123'),
('A002','Mrs.','RADHIKA MOHAN','Kerala','Java','Bachelor of Engineering In Information Technology','Radhika.Mohan@cognizant.com','tne2@123'),
('A003','Mr.','KISHORE SRINIVAS','Chennai','Java','Bachelor of Engineering In Computers','Kishore.Srinivas@ibm.com','tne3@123'),
('A004','Mr.','ANAND RANGANATHAN','Mumbai','DotNet','Master of Computer Applications','Anand.Ranganathan@finolex.com','tne4@123'),
('A005','Miss.','LEELA MENON','Kerala','Mainframe','Bachelor of Engineering In Information Technology','Leela.Menon@microsoft.com','tne5@123'),
('A006','Mrs.','ARTI KRISHNAN','Pune','Testing','Master of Computer Applications','Arti.Krishnan@cognizant.com','tne6@123'),
('A007','Mr.','PRABHAKAR SHUNMUGHAM','Mumbai','Java','Bachelor of Technology','Prabhakar.Shunmugham@honda.com','tne7@123');

INSERT INTO Questions  (Question_Id,Module_Id,Question_Text )
VALUES ('Q001','EM001','Instructor knowledgeable and able to handle all your queries' ),
('Q002','EM001','All the topics in a particular course handled by the trainer without any gaps or slippages' ),
('Q003','EM002','The course materials presentation, handson,  etc. refered during the training are relevant and useful.'),
('Q004','EM002','The Hands on session adequate enough to grasp the understanding of the topic.') ,
('Q005','EM002','The reference materials suggested for each module are adequate. '),
('Q006','EM003','Knowledge and skills presented in this training are applicatible at your work' ),
('Q007','EM003','This training increases my proficiency level  '),
('Q008','EM004','The physical environment e.g. classroom space, air-conditioning was conducive to learning.'),
('Q009','EM004','The software/hardware environment provided was sufficient for the purpose of the training.') ,
('Q010','EM005','This training will improve your job performance. '),
('Q011','EM005','This training align with the business priorities and goals.' ),
('Q012','TM001','Participants were receptive and had attitude towards learning.' ),
('Q013','TM001','All participats gained the knowledge and the practical skills after this training.') ,
('Q014','TM002','The course materials presentation, handson,  etc. available for the session covers the entire objectives of the course.'),
('Q015','TM002','Complexity of the course is adequate for the particpate level.'),
('Q016','TM002','Case study and practical demos helpful in understanding of the topic') ,
('Q017','TM003','The physical environment e.g. classroom space, air-conditioning was conducive to learning.' ),
('Q018','TM003','The software/hardware environment provided was adequate  for the purpose of the training.');


INSERT INTO Associate_Status (Associate_Id,Module_Id,Batch_Id,Trainer_Id,Start_Date,End_Date )
VALUES ('A001','O10SQL','B001','F001','2000-12-15','2000-12-25' ),
('A002','O10SQL','B001','F001','2000-12-15','2000-12-25 '),
('A003','O10SQL','B001','F001','2000-12-15','2000-12-25' ),
('A001','O10PLSQL','B002','F002','2001-2-1','2001-2-12 '),
('A002','O10PLSQL','B002','F002','2001-2-1','2001-2-12' ),
('A003','O10PLSQL','B002','F002','2001-2-1','2001-2-12'),
('A001','J2SE','B003','F003','2002-8-20','2002-10-25' ),
('A002','J2SE','B003','F003','2002-8-20','2002-10-25 '),
('A001','J2EE','B004','F004','2005-12-1','2005-12-25' ),
('A002','J2EE','B004','F004','2005-12-1','2005-12-25 '),
('A003','J2EE','B004','F004','2005-12-1','2005-12-25' ),
('A004','J2EE','B004','F004','2005-12-1','2005-12-25 '),
('A005','JAVAFX','B005','F006','2005-12-4','2005-12-20' ),
('A006','JAVAFX','B005','F006','2005-12-4','2005-12-20 '),
('A006','SQL2008','B006','F007','2007-6-21','2007-6-28' ),
('A007','SQL2008','B006','F007','2007-6-21','2007-6-28 '),
('A002','MSBI08','B007','F006','2009-6-26','2009-6-29' ),
('A003','MSBI08','B007','F006','2009-6-26','2009-6-29 '),
('A004','MSBI08','B007','F006','2009-6-26','2009-6-29' ),
('A002','ANDRD4','B008','F005','2010-6-5','2010-6-28' ),
('A005','ANDRD4','B008','F005','2010-6-5','2010-6-28' ),
('A003','ANDRD4','B009','F005','2011-8-1','2011-8-20 '),
('A006','ANDRD4','B009','F005','2011-8-1','2011-8-20 ');


-- QUESTION -3
 UPDATE  Trainer_info
 SET Trainer_Password = 'nn4@123' 
 WHERE Trainer_Id = 'F004';
 
 -- QUESTION - 4
 DELETE FROM Associate_Status
 WHERE Associate_Id = 'A003' AND Module_Id = 'J2EE' AND Batch_Id='B004' AND Trainer_Id = 'F004' AND Start_Date = '2005-12-1' AND End_Date = '2005-12-25';
 
 -- QUESTION - 5
 SELECT * FROM Trainer_Info
 ORDER BY Trainer_Experiance DESC
 LIMIT 5;
 
 -- QUESTION - 6
 INSERT INTO Login_Details(User_Id,User_Password)
 VALUES ('U001','Admin@123'),
		('U002','Admin@123');        
ROLLBACK;

-- QUESTION - 8
DROP TABLE Login_Details;
SHOW  tables;

-- QUESTION 10

CREATE DATABASE  operators;
USE operators;

CREATE TABLE supplies(
	supplier_id INT(10) NOT NULL,
    supplier_name VARCHAR(50) NOT NULL,
    address VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(25),
    zip_code VARCHAR(10)
    );
    
SHOW tables;
describe supplies;

CREATE TABLE Course_Fee(
	Course_Code VARCHAR(20),
    Base_fees INT,
    Special_fees INT,
    Created_By VARCHAR(20),
    Updated_By VARCHAR(20)
    );
    
CREATE TABLE Course_fee(
	Course_Code VARCHAR(20),
    Base_fees INT,
    Special_fees INT,
    Discount INT);
    
INSERT INTO Course_Fee(Course_code, Base_fees, Special_fees,Created_By,Updated_By)
VALUES('1',120,123,'Ram','Ramesh'),
	  ('2',150,110,'Bala','Ram'),
      ('3',160,170,'Bala','Vinu'),
      ('4',170,235,'Ram','Ram'),
      ('5',190,100,'Vinod','Vinod');
      
ALTER TABLE Course_fee RENAME Course_fee_history;

SHOW TABLES;

-- QUESTION 11
SELECT Course_Code,Base_fees, Special_fees FROM Course_fee UNION SELECT Course_Code,Base_fees, Special_fees FROM Course_fee_history;

-- QUESTION 12
CREATE DATABASE cms;
USE cms;

CREATE TABLE Course_info(
	Course_code VARCHAR(20) PRIMARY KEY ,
    Course_name VARCHAR(20)NOT NULL,
    Course_description VARCHAR(25),
    Course_start_date Date,
    Course_duration INT,
    No_of_participants INT ,
    Course_type Char(3) 
    );
-- DROP TABLE Course_info;

CREATE TABLE Student_info(
	Student_id VARCHAR(10) PRIMARY KEY,
    First_name VARCHAR(20),
    Last_name VARCHAR(25),
    Address VARCHAR(150)
    );

CREATE TABLE Course_Fee(
	Course_Code VARCHAR(20),
    Base_fees INT,
    Special_fees INT,
    Created_By VARCHAR(20),
    Updated_By VARCHAR(20),
    Discount VARCHAR(10),
    FOREIGN KEY (Course_Code) REFERENCES Course_info(Course_code)
    );
    





-- QUESTION 12
-- USE operators;
INSERT INTO Course_fee(Base_fees)
VALUES(NULL),(NULL),(300),(175);

-- INSERT INTO Course_fee(Base_fees)
-- VALUES(NULL),(400);
 
SELECT Base_fees FROM Course_fee
order by Base_fees
limit 1;

SELECT Base_fees FROM Course_fee
order by Base_fees DESC
LIMIT 1;

-- QUESTION 14
ALTER TABLE Course_fee
ADD COLUMN infra_fees DECIMAL(5,3);

INSERT INTO Course_fee(infra_fees)
VALUES (45.751),(43.453),(23.678),(12.456);

SELECT Course_name,(CURDATE()-Course_start_date) AS 'no_of_days' FROM Course_info;

-- QUESTION 13
SELECT AVG(infra_fees) AS 'avg_infra_fee' FROM Course_fee;

-- QUESTION 15
SELECT CONCAT(Course_name,Course_code) FROM Course_info;

-- QUESTION 16

USE cms;

-- QUESTION 17

INSERT INTO Course_info(Course_code,Course_name,Course_description,Course_start_date,Course_duration,No_of_participants,Course_type)
VALUES('1','JAVA','JAVA BASICS','2000-12-15',5,12,'CLR'),
	  ('2','PYTHON','PYTHON BASICS','2000-12-15',3,15,'EL'),
      ('3','.NET','BASICS','2000-12-15',5,10,'OF'),
      ('4','Core Java','MEDIUM','2005-12-1',5,15,'EL'),
      ('5','Oracle 10g','BASICS','2005-12-1',4,20,'CLR'),
      ('6','MS Share Point','ADVANCED','2005-12-5',2,26,'OF'),
      ('7','Android 4.0','BASICS','2005-12-5',3,30,'OF'),
      ('8','MS SQl Server 2008','MEDIUM','2005-12-10',6,15,'CLR');
SELECT * FROM Course_info;


-- QUESTION 18
SELECT Course_start_date,SUM(No_of_participants) AS 'total_students' FROM Course_info
GROUP By Course_start_date;

-- QUESTION 19
SELECT Course_start_date, SUM(NO_of_participants) AS 'total_students' FROM Course_info
WHERE Course_type = 'CLR'
GROUP BY Course_start_date;

-- QUESTION 20
SELECT Course_start_date, SUM(NO_of_participants)>10 AS 'total_students' FROM Course_info
WHERE Course_type = 'CLR'
GROUP BY Course_start_date;

-- QUESTION 21
SELECT Course_name,Course_duration FROM Course_info
ORDER BY  Course_duration DESC;

-- QUESTION 22
CREATE TABLE Student_courses(
	id INT  AUTO_INCREMENT PRIMARY KEY,
	Student_id VARCHAR(20),
    Course_code VARCHAR(20),
    FOREIGN KEY (Student_id) REFERENCES Student_info(Student_id),
    FOREIGN KEY (Course_code) REFERENCES Course_info(Course_code)
    );

INSERT INTO  Student_info(Student_id,First_name,Last_name)
VALUES ('1','TONY','STARK'),
	   ('2','CAPTAIN','AMERICA'),
       ('3','CAPTAIN','MARVELL'),
       ('4','HULK',NULL),
       ('5','BRUCE','BANNER'),
       ('6','DOCTOR','STRANGE');

INSERT INTO Student_courses(Student_id,Course_code)
VALUE ('1','2'),
	  ('2','2'),
      ('3','6'),
      ('5','4'),
      ('4','7'),
      ('6','2');
SELECT * FROM Student_info;
SELECT * FROM Student_courses;
-- describe Student_courses;

SELECT s.Student_id, s.First_name,s.Last_name,c.Course_code FROM Student_info s
JOIN Student_courses c ON c.Student_id = s.Student_id
WHERE c.Course_code = '2';

-- QUESTION 23
INSERT INTO Course_Fee(Course_Code,Discount)
VALUES ('1','10%'),
	   ('2','15%'),
       ('3','12%'),
       ('7','7%');

SELECT c.Course_name,c.Course_description FROM Course_info c
JOIN Course_Fee cf ON cf.Course_code = c.Course_code
WHERE cf.Discount is NOT NULL;

-- QUESTION 24
SELECT s.First_name, c.Course_code FROM Student_info s
JOIN Student_courses c ON c.Student_id = s.Student_id;

SELECT s.First_name,c.Course_code FROM Student_courses c
RIGHT JOIN Student_info s ON s.Student_id = c.Student_id;

-- QUESTION 25
SELECT Student_id FROM Student_courses s
WHERE Student_id IN (SELECT c.Course_code FROM Course_info c JOIN Course_Fee cf ON cf.Course_code = s.Course_code
WHERE cf.Base_fees<1500);

-- QUESTION 26
SELECT Student_id,First_name,Last_name FROM Student_info
WHERE Student_id IN (SELECT c.Course_code FROM Course_info c
		JOIN Course_Fee cf ON cf.Course_code = c.Course_code
        WHERE cf.Base_fees <1500);