create table cart
(
	id int auto_increment
		primary key,
	product_id int not null,
	user_name varchar(255) not null,
	number int unsigned default '1' not null,
	order_id bigint unsigned ,
	constraint cart_pk
		unique (product_id, user_name)
);

create table order_shop
(
	id int auto_increment
		primary key,
	user_id int null,
	product_id int null,
	number int unsigned not null
);

create table product
(
	id int auto_increment
		primary key,
	name varchar(255) charset utf8 not null,
	price float not null,
	number int unsigned not null
);

create table user
(
	name varchar(255) charset utf8 not null
		primary key,
	password varchar(255) null
);

