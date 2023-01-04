-- Author: Nguyen Van Vu
-- sql assignment 2

-- Exer 1 Design a table
drop database if exists `fresher_database`;
create database `fresher_database`;
use `fresher_database`;
create table `Trainee` (
	TraineeID int unsigned primary key auto_increment,
    Full_Name char (20) not null,
    Birth_Date datetime default now(),
    Gender enum ('male', 'female', 'unknown'),
    ET_IQ tinyint not null,
    ET_Gmath tinyint not null,
    ET_English tinyint not null,
    Training_Class tinyint not null,
    Evaluation_Notes varchar (5),
    VTI_Account varchar(20) not null unique
);

-- Exer 2 Data Types
drop database if exists `sql assignment 2`;
create database `sql assignment 2`;
use `sql assignment 2`;
create table `Data types 1`(
	ID int  unsigned primary key auto_increment,
    Name varchar(20) not null unique,
    Code char(5) not null unique,
    ModifiedDate datetime default now()
);

-- Exer 3 Data Types 2
drop database if exists `sql assignment 3`;
create database `sql assignment 3`;
use `sql assignment 3`;
create table `Data types 2` (
	ID int unsigned primary key auto_increment,
    Name char(10) not null unique,
    BirthDate datetime default now() not null,
    Gender bit,
    IsDeletedFlag bit
);
