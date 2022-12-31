drop database if exists `testing_system_assignment_1`;
create database `testing_system_assignment_1`;
use `testing_system_assignment_1`;
create table department (
   DepartmentID int,
   DepartmentName varchar(50)
);

create table   Position (
   PositionID int,
   PositionName varchar(50)
);

create table  Account(
   AccountID int,
   Email varchar(10),
   Username varchar(10),
   FullName varchar(10),
   DepartmentID int,
   PositionID int,
   CreateDate date
   );
   
   create table `Group`(
	GroupID int,
	GroupName varchar(50),
	CreatorID int,
	CreateDate date
	);

create table GroupAccount(
	GroupID int,
    AccountID int,
    JoinDate date
);

create table  `TypeQuestion`(
	TypeID int,
    TypeName varchar(10)
);

create table `CategoryQuestion`(
	CategoryID int,
    CategoryName varchar(20)
);

create table Question(
	QuestionID int,
    Content varchar(50),
    CategoryID int,
    TypeID int,
    CreatorID int,
    CreateDate date
);

create table `Answer`(
	AnswerID int,
    Content varchar(50),
    QuestionID int,
    isCorrect varchar(10)
);

create table `Exam`(
	ExamID int,
    Code varchar(20),
    Title varchar(10),
    CategoryID int,
    Duration int,
    CreatorID int,
    CreateDate date
);

create table ExamQuestion(
	ExamID int,
    QuestionIDn int
);
