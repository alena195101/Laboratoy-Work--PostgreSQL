--Создаем базу данных
create table region
(
	id SERIAL, name text,
	PRIMARY KEY(id)
 );
create table city
(
	id SERIAL, name text, region int REFERENCES region(id),
	PRIMARY KEY(id)
 );
create table storage
(
	id SERIAL, name text,
	PRIMARY KEY(id)
 );          
create table client
(	
	id SERIAL, 
	name text,
	address text,
	city int REFERENCES city(id),
	PRIMARY KEY(id)
 );                                 
create table recept
(
	id SERIAL, ddate date,
	ndoc int,
	client int REFERENCES client(id),
	storage int REFERENCES storage(id),
	PRIMARY KEY(id)
);  
create table income
( 
	id SERIAL, ddate date,
	ndoc int,
	client int REFERENCES client(id),
	storage int REFERENCES storage(id),
	PRIMARY KEY(id)
); 
create table goods_groups
(
	id SERIAL, name text,
	parent int REFERENCES goods_groups(id),
	PRIMARY KEY(id)
);  
create table goods
(
	id SERIAL, g_group int REFERENCES goods_groups(id),
	name text,weight decimal(18,4), length decimal(18,4),
	height decimal(18,4), width decimal(18,4),
	PRIMARY KEY(id)
); 
create table recgoods
(
	id int REFERENCES recept(id),
	subid int,
	goods int REFERENCES goods(id), volume int,
	price decimal(18,4),
	PRIMARY KEY(id)
);  
create table incgoods
(
	id int REFERENCES income(id),
	subid int,
	goods int REFERENCES goods(id), volume int,
	price decimal(18,4),
	PRIMARY KEY(id)
);
create table cassa_income
(
    id serial PRIMARY KEY,
    ddate date,
    summ int,
    client int REFERENCES client (id)
);

create table bank_income
(
    id serial PRIMARY KEY,
    ddate date,
    summ int,
    client int REFERENCES client (id)
);

create table cassa_recept
(
    id serial PRIMARY KEY,
    ddate date,
    summ int,
    client int REFERENCES client (id)
);

create table bank_recept
(
    id serial PRIMARY KEY,
    ddate date,
    summ int,
    client int REFERENCES client (id)
);

create table irlink(
  id serial,
  i_id int references income(id),
  i_subid int,
  r_id int references recept(id),
  r_subid int,
  goods int references goods(id),
  volume int,
  primary key(id)
);
