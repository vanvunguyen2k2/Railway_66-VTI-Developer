drop database if exists `salemanagement`;
create database `salemanagement`;
drop table if exists `customers`;
create table customers (
    customers_id int,
    first_name varchar (50),
    last_name varchar (10),
    email_address varchar (10),
    number_of_complaints int 

);

create table sales (
    purchase_number int,
    date_of_purchase date,
    customers_id int,
    item_code varchar (10)
);

create table items(
   item_code varchar (10),
   item varchar (10),
   unit_price_usd int,
   company_id int,
   company varchar (20),
   headquaters_phone_number varchar (6)
);