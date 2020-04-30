Create table region(id SERIAL, 
					name text,
 					PRIMARY KEY(id)
 				);
Create table city(id SERIAL, 
			name text, 
			region int REFERENCES region(id),
		 	PRIMARY KEY(id)
 	);

insert into region(name)
values('регион 1'),('регион 2'); 
             
insert into city (name, region)
select 'город '||t::text,
(select id from region where t > 0 
 order by random() limit 1 )
from
     generate_series(101,200) t  ;    

create table storage(id SERIAL,
					 name text,
 					PRIMARY KEY(id)
 					);            
Create table client
(id SERIAL, 
 name text,
 address text,
 city int REFERENCES city(id),
 PRIMARY KEY(id));               
                   
create table recept(id SERIAL,
					 ddate date,
 					ndoc int,
 					client int REFERENCES client(id),
 					storage int REFERENCES storage(id),
 					PRIMARY KEY(id)
 					);  
create table income(id SERIAL, 
				ddate date,
 				ndoc int,
				 client int REFERENCES client(id),
				 storage int REFERENCES storage(id),
				 PRIMARY KEY(id)
				);
create table goods_groups(id SERIAL,
						name text,
						parent int REFERENCES goods_groups(id),
 						PRIMARY KEY(id)
					);  
create table goods(id SERIAL,
				g_group int REFERENCES goods_groups(id),
				name text,
				weight decimal(18,4),
				length decimal(18,4),
				height decimal(18,4), 
				width decimal(18,4),
				PRIMARY KEY(id)
			); 
create table recgoods(id int REFERENCES recept(id),
					 subid int,
					 goods int REFERENCES goods(id), volume int,
					 price decimal(18,4),
					 PRIMARY KEY(id)
				);  
create table incgoods (id int REFERENCES income(id),
				 subid int,
				 goods int REFERENCES goods(id), volume int,
				 price decimal(18,4),
				 PRIMARY KEY(id)
				);
			


insert into client (name, address, city)
select ('клиент'||t)::text, ('адресс_'||t*2)::text,
           (select id from city where t > 0 
    order by random() limit 1 )  
from
     generate_series(11,40) t  ;             
   
insert into goods(g_group, name, weight, length,
                 height, width)            
select (select id from goods_groups where t > 0 
    order by random() limit 1 ),
('Товар '||t)::text, t*20, t, t+5, t+10.5               
from generate_series(1,100) t;             
             
insert into income (ddate, ndoc,storage,client)             
select ('2019-02-0'||t)::date, t*2,
(select id from storage where t > 0 
    order by random() limit 1 ),
(select id from client where t > 0 
    order by random() limit 1 )              
from generate_series(1,9) t;
             

insert into recept (ddate, ndoc,storage,client)
select ('2019-03-0'||t)::date, t*2,
(select id from storage where t > 0 
    order by random() limit 1 ),
(select id from client where t > 0 
    order by random() limit 1 )              
from
     generate_series(1,9) t  ;           
insert into goods_groups(name)
values ('группа товаров 1');             
             
insert into incgoods (id,subid, goods,volume,price )       
values
(1,1,1, 100,100),             
(3,2,2, 1000,150),             
(4,3,3, 2000,150),
(5,4,4, 150,1000)  ;
             

insert into recgoods (id,subid, goods,volume,price )           
values
(1,1,1, 10,50),             
(3,2,2, 1000,100),             
(4,3,3, 1500,150),
(5,4,4, 50,1000)  ;