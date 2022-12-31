-- testing_system_assignmen_2
-- author: Nguyen Van Vu

drop database if exists `testing_system_assignmen_1`;
create database `testing_system_assignmen_1`;
use `testing_system_assignmen_1`;

CREATE TABLE `Department` (
	DepartmentID int unsigned auto_increment primary key,
    DepartmentName nvarchar(30) not null
);

create table `Position` (
	PositionID int unsigned auto_increment primary key,
    PositionName enum ('Dev', 'Test', 'Scrum Master', 'PM')
	);
    
    create table `Account`(
		AccountID int unsigned primary key,
        Email varchar(50) not null unique key,
        Username nvarchar(50) not null,
        FullName nvarchar(50) not null,
        DepartmentID int unsigned not null,
        PositionID int unsigned not null,
        CreateDate datetime default now(),
        foreign key(DepartmentID) references Department(DepartmentID),
		foreign key(PositionID) references `Position`(PositionID)
);

 create table `Group`(
	GroupID int unsigned primary key auto_increment,
    GroupName varchar(50) not null,
    CreatorID int unsigned,
    CreateDate datetime default now(),
    foreign key(CreatorID) references Account(AccountID)
    
 );

create table `GroupAccount`(
	GroupID int unsigned not null,
    AccountID int unsigned not null,
    JoinDate datetime default now(),
    primary key (GroupID,AccountID),
    foreign key(GroupID) references `Group`(GroupID),
    foreign key(AccountID) references `Account`(AccountID)
    
);

create table `TypeQuestion`(
	TypeID int unsigned primary key,
    TypeName nvarchar(50) not null
);

create table `CategoryQuestion`(
	CategoryID int  unsigned primary key,
    CategoryName nvarchar(50) not null
);

create table `Question`(
	QuestionID int unsigned primary key,
    Content nvarchar(100) not null,
    CategoryID int unsigned not null,
    TypeID int unsigned not null,
    CreatorID int unsigned not null,
    CreateDate datetime default now(),
    foreign key (CategoryID) references CategoryQuestion(CategoryID),
    foreign key (TypeID) references TypeQuestion(TypeID),
    foreign key (CreatorID) references Account(AccountID)
);

create table `Answer`(
	AnswerID int unsigned primary key,
    Content nvarchar(50) not null,
    QuestionID int unsigned not null,
    isCorrect bit default 1,
    foreign key(QuestionID) references Question(QuestionID)
);

 create table `Exam`(
	ExamID int unsigned primary key,
    Code char(10) not null,
    Title nvarchar(50) not null,
    CategoryID int unsigned not null,
    Duration int unsigned not null,
    CreatorID int unsigned not null,
    CreateDate datetime default now(),
    foreign key(CategoryID) references CategoryQuestion(CategoryID),
	foreign key(CreatorID) references Account(AccountID)
 );
 
 create table `ExamQuestion`(
	ExamID int unsigned not null,
    QuestionID int unsigned not null,
    foreign key(ExamID) references Exam(ExamID),
	foreign key(QuestionID) references Question(QuestionID),
	primary key(ExamID,QuestionID)
 );
 
