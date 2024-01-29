## Create GHA Company Database 
create database Company_sales;
use Company_sales;
##Create Tables and insert values

Create table supplier (
id_supplier int not null,
name varchar(100) not null,
primary key (id_supplier)
);
INSERT INTO supplier (id_supplier,name)
values
(606216,'the Kicker'),
(97259,'Kwik'),
(876999,'Sellzio'),
(810729,'United parts'),
(982926,'Monumental'),
(501408,'Sterling'),
(490248,'Bioshell'),
(923765,'Inko inc.'),
(589683,'Ventio'),
(121160,'Quantumik');

create table product (
id_product int not null,
name varchar(100),
description varchar(100),
current_status varchar(100),
id_supplier int not null,
primary key (id_product),
foreign key (id_supplier) references supplier(id_supplier)
) ;

insert into product (id_product,name,description,current_status,id_supplier)
values
(850,'Alpha','Alternator','stock',606216),
(237,'Beta','Starter','No Stock',589683),
(286,'Charlie','Bendix','Stock',982926),
(427,'Delta','Regulator','No Stock',490248),
(262,'Echo','Ignition Coil','No Stock',501408),
(499,'Fox','Armature','Stock',97259),
(941,'Golf','Spark Plug','Stock',810729),
(417,'Hotel','Alternator Pulley','Stock',876999),
(508,'India','Brake Pads','stock',923765),
(406,'Jupiter','Speedometer','Stock',121160);

create table customer (
id_customer int not null,
name varchar(100),
tax_index varchar(200),
primary key (id_customer)
);

insert into customer (id_customer,name,tax_index) 
values
(7473,'Bristol','703xlk9'),
(8627,'Biking Reggio','814vyu26'),
(2305,'Cafe Twin','630lter27'),
(5193,'Europarts','806rcs24'),
(8009,'Moto Ricambi','769qsd25'),
(9985,'Auto 24','180wik48'),
(8251,'Race Cafe','771jab10'),
(6187,'Euroshell','293xop11'),
(6047,'Pista 24','728dyw8'),
(5300,'Diesel N20','829wtl27');

create table contact_information (
id_add int,
id_company int,
Address varchar(200),
number int,
city varchar(20),
primary key(id_add),
foreign key (id_company) references customer(id_customer)
);

insert into contact_information (id_add,id_company,Address,number,city)
values
(1,7473,'Via messina',48,'Roma'),
(2,8627,'Via zandall',27,'Milano'),
(3,5193,'Via Cantabria',25,'Roma'),
(4,9985,'Via Acri',10,'Bologna'),
(5,6187,'Piazza Bianca',54,'Firenze'),
(6,6047,'Via Crispi',89,'Napoli'),
(7,5300,'Via Milano',25,'Napoli'),
(8,8251,'Via Nomentana',85,'Roma'),
(9,8009,'Via Reggio',12,'Palermo'),
(10,2305,'Via cantabria',87,'Madrid');

create table sales_representative (
id_salesrep int,
name varchar(50),
last_name varchar(50),
DNI int not null,
primary key (id_salesrep)
);

insert into sales_representative (id_salesrep,name,last_name,DNI)
values
(107,'Simone','Leonardi',1188),
(215,'Amelia','Lazzaro',3308),
(237,'Francesco','Maresca',1768),
(113,'Sara','Bedusa',3465),
(221,'Paolo','Scatolini',1051),
(140,'Vittorio','Martini',2156),
(181,'Eugenio','Rinaldi',2614),
(170,'Gigi','Bellini',2935),
(277,'Sambi','Ventura',3319),
(202,'Peppe','Falabella',2756);

create table sales (
invoice varchar(50),
id_customer int,
id_salesrep int,
date date,
primary key(invoice),
foreign key (id_customer) references customer(id_customer),
foreign key(id_salesrep) references sales_representative(id_salesrep)
);

insert into sales (invoice,id_customer,id_salesrep,date)
values
('4872YX',5193,221,'2022-06-26'),
('4925YF',9985,170,'2022-05-26'),
('4862KL',6187,202,'2022-04-26'),
('4446LL',8009,221,'2022-03-26'),
('4740SU',7473,181,'2022-02-26'),
('4629KV',8627,140,'2022-01-26'),
('4213OZ',2305,113,'2022-07-26'),
('4920EJ',8251,221,'2022-08-26'),
('4211UX',6047,107,'2022-09-26'),
('4812EF',5300,277,'2022-05-26');

create table order_placed (
invoice varchar(50),
order_number int,
id_product int,
quantity int,
unit_price int,
primary key (invoice,order_number),
foreign key (invoice) references sales(invoice),
foreign key (id_product) references product(id_product)
);

insert into order_placed(invoice,order_number,id_product,quantity,unit_price)
values
('4740SU',214,499,200,120),
('4920EJ',229,286,100,50),
('4925YF',283,850,180,350),
('4872YX',260,237,85,180),
('4213OZ',225,427,30,75),
('4211UX',105,237,75,69),
('4862KL',256,262,120,96),
('4446LL',275,941,52,100),
('4629KV',124,417,45,46),
('4812EF',251,850,89,120);
