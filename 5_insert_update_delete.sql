--1) Давайте создадим и заполним таблицу по поставкам в разрезе дней и складов: 
-- Дата, Склад, Сумма руб., Объем м3, Число разных товаров
create table inc
(ddate date,STORAGE TEXT, summ DECIMAL(18,4), valume int, count_goods int);
insert into inc(ddate, STORAGE, summ, valume, count_goods)
select income.ddate,
		storage.name, 
		sum(incgoods.volume*incgoods.price) as summ,
		sum(goods.height*goods.width*goods.length*incgoods.volume)as volume,count(distinct incgoods.goods)                 
from income
join storage on income.storage = storage.id
join incgoods on income.id = incgoods.id
join goods on goods.id = incgoods.goods
group by income.ddate,storage.name;

--3) Давайте заведем у Склада поле Признак активности.
ALTER TABLE storage ADD COLUMN active int;

--4) Написать запрос, который установит Признак = 1, если со склада были продажи более чем на 10000 руб. за последний месяц.
with mounth_rec as (
	select recept.storage,sum(recgoods.volume*recgoods.price) as summ 
	from recept
	join recgoods
	on recept.id = recgoods.id
	where recept.ddate > date_trunc('month', current_date - interval '1' month)
	group by recept.storage
	having sum(recgoods.volume*recgoods.price)>10000)

UPDATE storages SET active = 1
WHERE id in (select storage from  mounth_rec);

select * from storages;

--5) Давайте удалим из таблицы товаров все товары по которым не было продаж и поставок
Delete from goods
where id not in (select goods from recgoods) and id not in (select goods from incgoods)
RETURNING *
