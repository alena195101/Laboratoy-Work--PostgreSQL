--Написать запросы

--1)Покупки: Город, Дата, Номер документа, Название группы товара, Название товара, Объем. Выборка за второй квартал 2020 года, Объемом более 10 м3
select income.ddate,income.ndoc, city.name,client.name,goods.name,
		(goods.width*goods.height*goods.length*incgoods.volume) as volume
from income
join client on income.client=client.id
join city on city.id=client.city
join incgoods on incgoods.id = income.id
join goods on goods.id = incgoods.goods
join goods_groups on goods_groups.id = goods.g_group

where date_part('month', income.ddate) in (4,5,6) 
and date_part('year',income.ddate)=2020
and (goods.width*goods.height*goods.length*incgoods.volume) > 10


--2)Продажи: Адрес, Дата, Номер документа, Название склада, Название товара, Вес, Сумма. Выборка за февраль 2020 года по региону Москва, только по товарам по которым были покупки в 2019 году.
--Выбрать 10 случайных записей из запроса с продажами.
with goods2019 AS(
  select goods.id,goods.name,goods.weight from goods
    join incgoods on incgoods.goods = goods.id
    join income on income.id= incgoods.id
    where date_part('year',income.ddate)=2019
)

select client.address, recept.ddate,recept.ndoc,
 storage.name,goods2019.name,(goods2019.weight*recgoods.volume) as weight,
 (recgoods.volume*recgoods.price) as summ
from recept

join client on recept.client=client.id
join storage on storage.id=recept.storage
join recgoods on recgoods.id = recept.id
join goods2019 on goods2019.id = recgoods.goods
join city on city.id = client.city
join region on region.id = city.region

where date_part('month',recept.ddate)=2 and date_part('year',recept.ddate)=2020
and region.name = 'Москва'

ORDER BY random() limit 10