drop database if exists `rap chieu phim`;
create database `rap chieu phim`;
use `rap chieu phim`;

create table `loai_ghe`(
	chairID mediumint unsigned primary key auto_increment,
    ten_ghe char(5) not null,
    so_ghe varchar(2) not null,
    foreign key ten_ghe references ghe(ghe_id)
);
