-- TESTING_SYSTEM_ASSIGNMEN_2
-- AUTHOR: NGUYEN VAN VU

-- QUESTIONS 1 + 2
DROP DATABASE IF EXISTS `TESTING_SYSTEM_ASSIGNMEN_1`;
CREATE DATABASE `TESTING_SYSTEM_ASSIGNMEN_1`;
USE `TESTING_SYSTEM_ASSIGNMEN_1`;

CREATE TABLE `DEPARTMENT` (
	DEPARTMENTID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DEPARTMENTNAME NVARCHAR(500) NOT NULL
);

CREATE TABLE `POSITION` (
	POSITIONID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    POSITIONNAME ENUM ('DEV', 'TEST', 'SCRUM MASTER', 'PM')
	);
    
    CREATE TABLE `ACCOUNT`(
		ACCOUNTID INT UNSIGNED PRIMARY KEY,
        EMAIL CHAR(50) NOT NULL UNIQUE KEY,
        USERNAME NVARCHAR(50) NOT NULL,
        FULLNAME NVARCHAR(50) NOT NULL,
        DEPARTMENTID INT UNSIGNED NOT NULL,
        POSITIONID INT UNSIGNED NOT NULL,
        CREATEDATE DATETIME DEFAULT NOW(),
        FOREIGN KEY(DEPARTMENTID) REFERENCES DEPARTMENT(DEPARTMENTID),
		FOREIGN KEY(POSITIONID) REFERENCES `POSITION`(POSITIONID)
);

 CREATE TABLE `GROUP`(
	GROUPID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    GROUPNAME VARCHAR(50) NOT NULL,
    CREATORID INT UNSIGNED,
    CREATEDATE DATETIME DEFAULT NOW(),
    FOREIGN KEY(CREATORID) REFERENCES ACCOUNT(ACCOUNTID)
    
 );

CREATE TABLE `GROUPACCOUNT`(
	GROUPID INT UNSIGNED NOT NULL,
    ACCOUNTID INT UNSIGNED NOT NULL,
    JOINDATE DATETIME DEFAULT NOW(),
    PRIMARY KEY (GROUPID,ACCOUNTID),
    FOREIGN KEY(GROUPID) REFERENCES `GROUP`(GROUPID),
    FOREIGN KEY(ACCOUNTID) REFERENCES `ACCOUNT`(ACCOUNTID)
    
);

CREATE TABLE `TYPEQUESTION`(
	TYPEID INT UNSIGNED PRIMARY KEY,
    TYPENAME CHAR(50) NOT NULL
);

CREATE TABLE `CATEGORYQUESTION`(
	CATEGORYID INT  UNSIGNED PRIMARY KEY,
    CATEGORYNAME CHAR(50) NOT NULL
);

CREATE TABLE `QUESTION`(
	QUESTIONID INT UNSIGNED PRIMARY KEY,
    CONTENT CHAR(100) NOT NULL,
    CATEGORYID INT UNSIGNED NOT NULL,
    TYPEID INT UNSIGNED NOT NULL,
    CREATORID INT UNSIGNED NOT NULL,
    CREATEDATE DATETIME DEFAULT NOW(),
    FOREIGN KEY (CATEGORYID) REFERENCES CATEGORYQUESTION(CATEGORYID),
    FOREIGN KEY (TYPEID) REFERENCES TYPEQUESTION(TYPEID),
    FOREIGN KEY (CREATORID) REFERENCES ACCOUNT(ACCOUNTID)
);

CREATE TABLE `ANSWER`(
	ANSWERID INT UNSIGNED PRIMARY KEY,
    CONTENT CHAR(50) NOT NULL,
    QUESTIONID INT UNSIGNED NOT NULL,
    ISCORRECT BIT DEFAULT 1,
    FOREIGN KEY(QUESTIONID) REFERENCES QUESTION(QUESTIONID)
);

 CREATE TABLE `EXAM`(
	EXAMID INT UNSIGNED PRIMARY KEY,
    CODE CHAR(50) NOT NULL,
    TITLE CHAR(50) NOT NULL,
    CATEGORYID INT UNSIGNED NOT NULL,
    DURATION INT UNSIGNED NOT NULL,
    CREATORID INT UNSIGNED NOT NULL,
    CREATEDATE DATETIME DEFAULT NOW(),
    FOREIGN KEY(CATEGORYID) REFERENCES CATEGORYQUESTION(CATEGORYID),
	FOREIGN KEY(CREATORID) REFERENCES ACCOUNT(ACCOUNTID)
 );
 
 CREATE TABLE `EXAMQUESTION`(
	EXAMID INT UNSIGNED NOT NULL,
    QUESTIONID INT UNSIGNED NOT NULL,
    FOREIGN KEY(EXAMID) REFERENCES EXAM(EXAMID),
	FOREIGN KEY(QUESTIONID) REFERENCES QUESTION(QUESTIONID),
	PRIMARY KEY(EXAMID,QUESTIONID)
 );
 
 -- ADD DATA DEPARTMENT
 INSERT INTO DEPARTMENT(DEPARTMENTNAME, DEPARTMENTID) 
 VALUES					(N'MARKETING', 1),
						(N'SALE', 2), 
                        (N'BAO VE', 3),
                        (N'NHAN SU', 4),
                        (N'KY THUAT', 5),
                        (N'TAI CHINH', 6),
                        (N'PHO GIAM DOC', 7),
                        (N'GIAM DOC', 8),
                        (N'THU KI', 9),
                        (N'BAN HANG', 10);

-- ADD DATA POSITION
INSERT INTO POSITION (POSITIONNAME, POSITIONID)
VALUES					( N'DEV', 2),
						( N'TEST', 3),
                        ( N'PM', 4),
                        ( N'SCRUM MASTER', 1);
                        
-- ADD DATA ACCOUNT
INSERT INTO ACCOUNT (ACCOUNTID, EMAIL, USERNAME, FULLNAME, 
DEPARTMENTID, POSITIONID, CREATEDATE)
VALUES					(1, 'HUANHOAHONG@GAMIL.COM', 'HUANHOAHONG', 'NGUYEN HUAN', 2, 2, '20221228'),
						(2, 'KHABANH@GMAIL.COM', 'KHABANH', 'NGUYEN VAN KHA', 3, 3, '20221230'),
                        (3, 'XINMOTLANTHUA@GMAIL.COM', 'XINMOTLANTHUA', 'NGUYEN VAN B', 4, 4, '20221229'),
                        (4, 'VTIACADEMY@GMAIL.COM', 'VTIACADEMY', 'VTI', 1, 1, '20220127');

-- ADD DATA GROUP
INSERT INTO `GROUP` (GROUPID, GROUPNAME, CREATORID, CREATEDATE)
VALUES					(1, N'MARKETING GROUP', 1, '20230103'),
						(2, N'ROOM_SALE', 2, '20230104'),
						(3, N'DEVELOPMENT', 3, '20230105');
-- ADD DATA GROUPACCOUNT
INSERT INTO `GROUPACCOUNT` (GROUPID, ACCOUNTID, JOINDATE)
VALUES						(1, 1, '20230104'),
							(2, 2, '20230104'),
                            (3, 3, '20230104');
-- ADD DATA TYPEQUESTION (TYPEID, TYPENAME) 
INSERT INTO `TYPEQUESTION` (TYPEID, TYPENAME)
VALUES				(1, N'ESSAY'),
					(2, N'MULTIPLE-CHOICE');
-- ADD DATA CATEGORYQUESTION
INSERT INTO `CATEGORYQUESTION` (CATEGORYID, CATEGORYNAME)  
VALUES					(1, N'SOL'),
						(2, N'JAVA'),
                        (3, N'FRONT_END'),
                        (4, N'ADVANCED_JAVA');
-- ADD DATA QUESTION
INSERT INTO `QUESTION` (QUESTIONID, CONTENT, CATEGORYID, TYPEID, CREATORID, CREATEDATE)
VALUES					(1, N'THE NAO LA SQL', 1, 1, 1, 20230104),
						(2, N'THE NAO LA JAVA', 2, 2, 2, 20230104),
                        (3, N'THE NAO LA FRONT_END', 3, 2, 3, 20230104),
                        (4, N'THE NAO LA ADVANCED_JAVA', 4, 1, 4, 20230104);


-- ADD DATA ANSWER
INSERT INTO `ANSWER` (ANSWERID, QUESTIONID, ISCORRECT, CONTENT)
VALUES					(1, 1, 0, N'CAU 1'), 
						(2, 2, 1, N'CAU 2'),
                        (3, 3, 1, N'CAU 3'),
                        (4, 4, 0, N'CAU 4');

-- ADD DATA   EXAM                    
INSERT INTO `EXAM` (EXAMID, CODE, TITLE, CATEGORYID, DURATION, CREATORID, CREATEDATE)
VALUES					(1, 'SQL1', N'DE THI MON SQL', 1, 60, 1, 20230104),
						(2, 'JAVA1', N'DE THI MON JAVA', 2, 60, 2, 20230104),
                        (3, 'FRONT_END1', N'DE THI FRONT_END BASIC',3, 60, 3, 20230104),
                        (4, 'ADVANCED_JAVA1', N'DE THI ADVANCED_JAVA',4, 60, 4, 20230104);

-- ADD DATA EXAMQUESTION
INSERT INTO `EXAMQUESTION` (EXAMID, QUESTIONID)
VALUES					(1, 1),
						(2, 2);
                        
                        




 
 
 

 
