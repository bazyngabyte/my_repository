# DDL Pizza Hut

create database pizzahut;
use pizzahut;

create table pizza_types (
pizza_type_id varchar(200) primary key not null,
`name` varchar(200),
category varchar(200),
ingredients varchar(200)
);

create table pizzas (
pizza_id varchar(20) primary key not null,
pizza_type_id varchar(20),
size char(10),
price float(8),
foreign key (pizza_type_id) references pizza_types (pizza_type_id)
);

create table orders (
order_id int primary key not null,
`date` date,
`time` time
);

create table order_details (
order_details_id int primary key not null,
order_id int,
pizza_id varchar(20),
quantity int,
foreign key (order_id) references orders (order_id),
foreign key (pizza_id) references pizzas (pizza_id)
);