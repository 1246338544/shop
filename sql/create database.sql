create database shop；
use shop
create table user(id int primary key auto_increment, name nvarchar(255), password varchar(255));
create table product(id int primary key auto_increment, name nvarchar(255) not null, price float not null );
create table order_shop//TODO 创建订单表