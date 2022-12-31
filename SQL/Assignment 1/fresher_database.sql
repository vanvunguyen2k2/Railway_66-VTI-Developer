drop database if exists `fresher_database`;
create database `fresher_database`;
use `fresher_database`;
create table `Trainee` (
	TraineeID int,
    Full_Name varchar (11),
    Birth_Date date,
    Gender varchar (3),
    ET_IQ varchar (15),
    ET_Gmath varchar (15),
    ET_English varchar (30),
    Training_Class int,
    Evaluation_Notes varchar (5)
);