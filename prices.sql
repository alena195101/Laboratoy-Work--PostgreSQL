--База должна состоять из:
--Партнеры
--Товары
--Прайс-листы с именем и списком цен. Цена на дату для товара до следующей по дате цены
--Группы товаров
--Группы товаров партнеров
--Прайс на группу товаров партнеров


create table partner (id SERIAL,
                      name text,
                      PRIMARY KEY(id)
                      );
create table goods_group(id SERIAL, 
                         name text,
                        PRIMARY KEY(id)
                        );
create table goods (id SERIAL, 
                    name text, 
                    id_group int REFERENCES goods_group(id),
                    PRIMARY KEY(id)
                    );
create table pricelist (id SERIAL,
                         name text,
                         PRIMARY KEY(id)
                         );
create table price_prlist (id SERIAL,
                         id_prlist int REFERENCES pricelist(id),
                         id_goods int REFERENCES goods(id),
                         price decimal(18,4),
                         ddate date,
                         PRIMARY KEY(id)
                         );  
create table group_part(id serial,
                        name text,
                        PRIMARY KEY(id));
create table ggroup_part(id serial,
                         id_ggroup_part int REFERENCES group_part(id),
                         id_goods_group int REFERENCES goods_group(id),
                         PRIMARY KEY(id)
                         );
create table price_ggroup(id serial,
                         id_prlist int REFERENCES pricelist(id),
                          id_ggroup_part int REFERENCES group_part(id),
                          id_partner int REFERENCES partner(id),
                          PRIMARY KEY(id)
                          );

insert into partner(name)
select ('партнер '||t)::text
from
     generate_series(1,20) t ;

insert into goods_group(name)
select ('группа товаров '||t)::text
from
     generate_series(1,10) t ;

insert into goods(name, id_group)
select ('товар '||t)::text,( select id from goods_group where t > 0 
                            order by random() limit 1 )  
from
     generate_series(1,50) t ;

insert into pricelist(name)
select ('прайс лист '||t)::text
from
     generate_series(1,20) t ;

insert into price_prlist(id_prlist,id_goods, price, ddate)
select ( select id from pricelist where t > 0 
                            order by random() limit 1 ),
        ( select id from goods where t > 0 
                            order by random() limit 1 ),
         t*2.5,
         '2020-03-01'::date+t
from generate_series(1,30) t ;

insert into group_part(name)
select ( 'группа товаров партнеров '||t)::text 
from
     generate_series(1,10) t ;

insert into ggroup_part(id_ggroup_part, id_goods_group)
select ( select id from group_part where t > 0 
                            order by random() limit 1 ),
        ( select id from goods_group where t > 0 
                            order by random() limit 1 )
from generate_series(1,30) t ;

insert into price_ggroup(id_prlist,id_ggroup_part, id_partner)
select ( select id from pricelist where t > 0 
                            order by random() limit 1 ),
        ( select id from group_part where t > 0 
                            order by random() limit 1 ),
        ( select id from partner where t > 0 
                            order by random() limit 1 )                   
from generate_series(1,30) t ;

--Давайте напишем вывод прайсов конкретного партнера на заданную дату


-- добавлю типовой пример данных, чтоб было наглядней
insert into pricelist(name)
values('Опт');
insert into goods_group(name)
values ('Мясные консервы'),('Молочные консервы');
insert into goods(name, id_group)
values('тушенка', 11),('сгущенка',12);
insert into price_prlist(id_prlist,id_goods, price, ddate)
values(21,52,150,'2020-03-04'),(21,51,55,'2020-03-04');

insert into price_ggroup(id_prlist,id_ggroup_part, id_partner)
values (21,5,4);

insert into ggroup_part(id_ggroup_part, id_goods_group)
values (5,11),(4,12);

--вывод прайсов конкретного партнера на заданную дату
with product  as (select pprl.id_goods, g.name, g.id_group, ggp.id_ggroup_part, pprl.price, pprl.ddate,pprl.id_prlist
from price_prlist pprl
join goods g on g.id = pprl.id_goods
join ggroup_part ggp on ggp.id_goods_group = g.id_group)

select distinct pr.name, pr.price from price_ggroup pgg
join product pr on pr.id_prlist = pgg.id_prlist and pgg.id_ggroup_part = pr.id_ggroup_part
where pgg.id_partner = 4 and pr.ddate = '2020-03-04';


--Давайте проверим что прайсы партнеров не пересекаются
--Для этого попробуем добавить данные, которые сломают основное бизнесс правило: "Нельзя партнеру продавать один и тот же товар по разной цене"
insert into pricelist(name)
values('Бакалея'),('Для выпечки');
insert into goods_group(name)
values ('Рассыпчатый товар');
insert into goods(name, id_group)
values('мука', 13);

insert into price_prlist(id_prlist,id_goods, price, ddate)
values(22,53,70,'2020-03-04'),(23,53,150,'2020-03-06');

insert into price_ggroup(id_prlist,id_ggroup_part, id_partner)
values (22,3,6),(23,3,6);

insert into ggroup_part(id_ggroup_part, id_goods_group)
values (3,13);

--Запрос, выдающий товар с различной ценой для партнера с номерами прайслистов
with t as (SELECT  tab.name, tab.id_goods,tab.ddate,tab.id_partner, count(*) 
           from (
             select distinct  g.name, pprl.id_goods, pprl.ddate, pgg.id_partner, pprl.id_prlist from price_prlist pprl
            join goods g on g.id = pprl.id_goods
            join ggroup_part ggp on ggp.id_goods_group = g.id_group
            join price_ggroup pgg on pprl.id_prlist = pgg.id_prlist and pgg.id_ggroup_part = ggp.id_ggroup_part) TAB
        group BY tab.name, tab.id_goods,tab.ddate,tab.id_partner
        having count(*)>1)
select g.name, pprl.id_goods, pprl.ddate, pgg.id_partner, string_agg(pprl.id_prlist::text,',') 
from price_prlist pprl
join goods g on g.id = pprl.id_goods
join ggroup_part ggp on ggp.id_goods_group = g.id_group
join price_ggroup pgg on pprl.id_prlist = pgg.id_prlist and pgg.id_ggroup_part = ggp.id_ggroup_part
where pprl.id_goods in(select id_goods from T) and pprl.ddate in (select ddate from T) and
            pgg.id_partner in (select id_partner from T)
group by g.name, pprl.id_goods, pprl.ddate, pgg.id_partner;
