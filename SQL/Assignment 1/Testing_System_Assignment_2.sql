-- testing_system_assignmen_2
-- author: Nguyen Van Vu

-- questions 1 + 2
drop database if exists `testing_system_assignmen_1`;
create database `testing_system_assignmen_1`;
use `testing_system_assignmen_1`;

CREATE TABLE `Department` (
	DepartmentID int unsigned auto_increment primary key,
    DepartmentName nvarchar(500) not null
);

create table `Position` (
	PositionID int unsigned auto_increment primary key,
    PositionName enum ('Dev', 'Test', 'Scrum Master', 'PM')
	);
    
    create table `Account`(
		AccountID int unsigned primary key,
        Email char(50) not null unique key,
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
    TypeName char(50) not null
);

create table `CategoryQuestion`(
	CategoryID int  unsigned primary key,
    CategoryName char(50) not null
);

create table `Question`(
	QuestionID int unsigned primary key,
    Content char(100) not null,
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
    Content char(50) not null,
    QuestionID int unsigned not null,
    isCorrect bit default 1,
    foreign key(QuestionID) references Question(QuestionID)
);

 create table `Exam`(
	ExamID int unsigned primary key,
    Code char(50) not null,
    Title char(50) not null,
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
 
 -- add data Department
 insert into Department(DepartmentName, DepartmentID) 
 values					(N'marketing', 1),
						(N'sale', 2), 
                        (N'bao ve', 3),
                        (N'nhan su', 4),
                        (N'ky thuat', 5),
                        (N'tai chinh', 6),
                        (N'pho giam doc', 7),
                        (N'giam doc', 8),
                        (N'thu ki', 9),
                        (N'ban hang', 10);

-- add data position
insert into position (PositionName, PositionID)
values					( N'dev', 2),
						( N'test', 3),
                        ( N'PM', 4),
                        ( N'Scrum Master', 1);
                        
-- add data Account
insert into Account (AccountID, Email, Username, FullName, 
DepartmentID, PositionID, CreateDate)
values					(1, 'huanhoahong@gamil.com', 'huanhoahong', 'Nguyen Huan', 2, 2, '20221228'),
						(2, 'khabanh@gmail.com', 'khabanh', 'Nguyen Van Kha', 3, 3, '20221230'),
                        (3, 'xinmotlanthua@gmail.com', 'xinmotlanthua', 'Nguyen Van B', 4, 4, '20221229'),
                        (4, 'vtiacademy@gmail.com', 'vtiacademy', 'VTI', 1, 1, '20220127');

-- add data Group
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate)
values					(1, N'marketing group', 1, '20230103'),
						(2, N'room_sale', 2, '20230104'),
						(3, N'development', 3, '20230105');
-- add data GroupAccount
insert into `GroupAccount` (GroupID, AccountID, JoinDate)
values						(1, 1, '20230104'),
							(2, 2, '20230104'),
                            (3, 3, '20230104');
-- add data TypeQuestion (TypeID, TypeName) 
insert into `TypeQuestion` (TypeID, TypeName)
values				(1, N'Essay'),
					(2, N'Multiple-Choice');
-- add data CategoryQuestion
insert into `CategoryQuestion` (CategoryID, CategoryName)  
values					(1, N'SOL'),
						(2, N'Java'),
                        (3, N'front_end'),
                        (4, N'advanced_java');
-- add data Question
insert into `Question` (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
values					(1, N'the nao la SQL', 1, 1, 1, 20230104),
						(2, N'the nao la Java', 2, 2, 2, 20230104),
                        (3, N'the nao la front_end', 3, 2, 3, 20230104),
                        (4, N'the nao la advanced_java', 4, 1, 4, 20230104);


-- add data Answer
insert into `Answer` (AnswerID, QuestionID, isCorrect, Content)
values					(1, 1, 0, N'cau 1'), 
						(2, 2, 1, N'cau 2'),
                        (3, 3, 1, N'cau 3'),
                        (4, 4, 0, N'cau 4');

-- add data   Exam                    
insert into `Exam` (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate)
values					(1, 'SQL1', N'De thi mon SQL', 1, 60, 1, 20230104),
						(2, 'Java1', N'De thi mon Java', 2, 60, 2, 20230104),
                        (3, 'front_end1', N'de thi front_end basic',3, 60, 3, 20230104),
                        (4, 'advanced_java1', N'de thi advanced_java',4, 60, 4, 20230104);

-- add data ExamQuestion
insert into `ExamQuestion` (ExamID, QuestionID)
values					(1, 1),
						(2, 2);




 
 
 

 
