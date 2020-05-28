insert into region(name)
SELECT ('регион ' || t)::text
FROM generate_series(1, 4) t;
             
insert into city (name, region)
select 'город '||t::text,
		(select id from region where t > 0 order by random() limit 1 )
from generate_series(1,200) t ;   

insert into storage(name)
select ('склад ' || t)::text
from generate_series(1, 4) t; 

insert into client (name, address, city)
select ('клиент'||t)::text, ('адресс_'||t*2)::text,
        (select id from city where t > 0 order by random() limit 1 )  
from
    generate_series(1,40) t;

insert into recept(ddate, ndoc, client, storage)
select (select to_timestamp(1514678398+random()*63071999*1.5 +t-t)::date),
		t,
       (select client.id from client where t > 0 order by  random() limit 1),
       (select storage.id from storage where t > 0 order by  random() limit 1)
from generate_series(1, 100) t;

insert into income(ddate, ndoc, client, storage)
select (select to_timestamp(1514678398+random()*63071999*1.5 +t-t)::date),
		t,
       (select client.id from client where t > 0 order by  random() limit 1),
       (select storage.id from storage where t > 0 order by  random() limit 1)
from generate_series(1, 100) t;

insert into goods_groups(name, parent)
select ('группа товаров : ' || t)::text,
       (select id from goods_groups where t > 0 order by random() limit 1)
from generate_series(1, 5) t;

insert into goods(g_group, name, weight, length, height, width)            
select (select id from goods_groups where t > 0 order by random() limit 1 ),
		('товар '||t)::text, 
		(select * from generate_series(1, 10) where t > 0 order by random() limit 1), 
		(select * from generate_series(1, 20) where t > 0 order by random() limit 1),
      	(select * from generate_series(10, 50) where t > 0 order by random() limit 1),
      	(select * from generate_series(1, 20) where t > 0 order by random() limit 1)
from generate_series(1,20) t;

insert into recgoods(id, subid, goods, volume, price)
select t,
       t,
       (select goods.id from goods where t > 0 order by random() limit 1),
       (select * from generate_series(1, 500) where t > 0 order by random() limit 1),
       (select * from generate_series(1, 2000) where t > 0 order by random() limit 1)
from generate_series(1, 100) t;

insert into incgoods(id, subid, goods, volume, price)
select t,
       t,
       (select goods.id from goods where t > 0 order by random() limit 1),
       (select * from generate_series(1, 500) where t > 0 order by random() limit 1),
       (select * from generate_series(1, 2000) where t > 0 order by random() limit 1)
from generate_series(1, 100) t;

insert into  bank_income(ddate, summ, client)
select R.ddate, (R2.volume * R2.price) sum, R.client
from recept R
          join recgoods R2 on R.id = R2.id
limit 50000;

insert into cassa_income(ddate, summ, client)
select R.ddate, (R2.volume * R2.price) sum, R.client
from recept R
         join recgoods R2 on R.id = R2.id
limit 50000 OFFSET 50000;

insert into  bank_recept(ddate, summ, client)
select I.ddate, (I2.volume * I2.price) sum, I.client
from income I
         join incgoods I2 on I.id = I2.id
limit 50000;

insert into  cassa_recept(ddate, summ, client)
select I.ddate, (I2.volume * I2.price) sum, I.client
from income I
         join incgoods I2 on I.id = I2.id
limit 50000 offset 50000;





