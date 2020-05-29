--Создание измерений и фактов

-- Создаем:
--Продажа: Сумма, Кол-во, Объем, Вес, Себестоимость,
--Измерение: Дата, Клиент, Склад, Товар

--Товар
create table goods_dim 
(  
	id serial,
	ggroup1 text,
	ggroup2 text,
	name text,
	primary key(id)
);
create index idx_goods_ggroup1
on goods_dim(ggroup1);

insert into goods_dim(ggroup1, ggroup2,name)
select gg.name ggroup1,gg1.name ggroup2, g.name from goods g
left join goods_groups gg on gg.id = g.g_group
left join goods_groups gg1 on gg1.id = gg.parent
order by g.id;
update goods_dim set ggroup2= 'прочее'
where ggroup2 is null;

--Клиент
create table client_dim(
	id serial,
	name text,
	address text,
	city text,
	region text,
	primary key(id)
);
insert into client_dim(name,address,city,region)
select cl.name,cl.address, c.name city, r.name r_name
from client cl
join city c on c.id = cl.city
join region r on r.id=c.region;

--Склад
create table storage_dim
(
	id serial,
	name text,
	primary key(id)
);
insert into storage_dim
select * from storage;

--Продажа:Сумма, Кол-во, Объем, Вес, Себестоимость,
create table sales
(
	id serial,
	ddate date,
	good int,
	storage int,
	client int,
	ssum    decimal(18,4),
	quantity decimal(18,4),
	volume  decimal(18,4),
	weight  decimal(18,4),
	value   decimal(18,4),
	primary key(id)
);
insert into sales (ddate,good,storage,client, ssum,quantity,volume,weight,value)
select r.ddate, rg.goods, r.storage, r.client,rg.price*rg.volume ssum, rg.volume quantity,
g.length*g.height*g.width volume, g.weight*rg.volume weight,
(select sum(incg.price*ir.volume) from incgoods incg
join irlink ir on ir.i_id=incg.id and ir.i_subid=incg.subid
where r_id=r.id and r_subid=rg.subid) as value
from recept r
join recgoods rg on rg.id=r.id
join goods g on g.id = rg.goods

--Покупка: Сумма, Кол-во, Объем, Вес,
--Измерение: Дата, Клиент, Склад, Товар
create table purchase
(
	id serial,
	ddate date,
	good int,
	storage int,
	client int,
	ssum    decimal(18,4),
	remains decimal(18,4),
	volume  decimal(18,4),
	weight  decimal(18,4),
	primary key(id)
);
insert into purchase (ddate,good,storage,client, ssum,quantity,volume,weight)
select inc.ddate, incg.goods, inc.storage,inc.client, incg.price*incg.volume ssum, incg.volume quantity,
g.length*g.height*g.width volume, g.weight*incg.volume weight
from income inc
join incgoods incg on incg.id=inc.id
join goods g on g.id = incg.goods


--Остатки: Сумма, Кол-во, Объем, Вес,
--Остатки на каждый день из периода: '2018-01-02' – '2020-12-16'
--Измерение: Дата, Склад, Товар

create table remains (id serial, goods int, storage int, ddate date, remains decimal(18,4),
					 ssum decimal(18,4), volume decimal(18,4), weight decimal(18,4));
insert into remains(goods,storage, ddate,ssum, remains )
select
  ii.goods_id,
  ii.storage_id,
  d.d ddate,
  (select incg.price from income inc join incgoods incg on incg.id = inc.id
  	where inc.ddate < d.d and inc.storage = ii.storage_id and incg.goods = ii.goods_id  limit 1),
  coalesce((select sum(ig.volume) from
    income i join incgoods ig on i.id = ig.id
   where i.ddate < d.d and i.storage = ii.storage_id and ig.goods = ii.goods_id
 ),0) -
  coalesce((select sum(rg.volume) from
    recept r join recgoods rg on r.id = rg.id
   where r.ddate < d.d and r.storage = ii.storage_id and rg.goods = ii.goods_id
 ),0) remains
from
  (select i.storage storage_id, ig.goods goods_id
    from income i join incgoods ig on i.id = ig.id
   UNION
   select r.storage storage_id, rg.goods goods_id
    from recept r join recgoods rg on r.id = rg.id
  ) ii,
  GENERATE_SERIES('2018-01-02'::DATE, '2020-12-16', '1 day') d;
update remains set ssum = remains.ssum*r.remains
from remains r 
where r.id = remains.id;	

update remains set volume = g.height*g.width*g.length*inc.storage*incg.goods*remains.remains
from income inc
join incgoods incg on incg.id=inc.id
join goods g on g.id = incg.goods
where g.id=remains.goods and inc.storage=remains.storage;

update remains set weight = g.weight*remains.remains
from income inc
join incgoods incg on incg.id=inc.id
join goods g on g.id = incg.goods
where g.id=remains.goods and inc.storage=remains.storage;

update remains set ssum =0
where ssum is null;

