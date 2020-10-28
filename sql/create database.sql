create database shop;
use shop;
create table user(name nvarchar(255) primary key, password varchar(255));
create table product(id int primary key auto_increment, name nvarchar(255) not null, price float not null );
create table order_shop(id int primary key auto_increment,user_id int  REFERENCES user(name),product_id int  REFERENCES product(id));
create table cart(id int auto_increment primary key,product_id int not null references product(
id), user_name varchar(255) not null references user(user_name));