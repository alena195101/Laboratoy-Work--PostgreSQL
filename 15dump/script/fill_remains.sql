-- как можно заполнять остатки, но я так не делала
with r as (select
  ii.goods_id goods,
  ii.storage_id as storage,
  coalesce((select sum(ig.volume) from
    income i join incgoods ig on i.id = ig.id
   where i.ddate < (select max(ddate) from recept)
			and i.storage = ii.storage_id and ig.goods = ii.goods_id),0) -
  coalesce((select sum(rg.volume) from
    recept r join recgoods rg on r.id = rg.id
   where r.ddate < (select max(ddate) from recept)
			and r.storage = ii.storage_id and rg.goods = ii.goods_id),0) volume
from
  (select i.storage storage_id, ig.goods goods_id
    from income i join incgoods ig on i.id = ig.id
   UNION
   select r.storage storage_id, rg.goods goods_id
    from recept r join recgoods rg on r.id = rg.id
  ) ii
order by ii.storage_id, ii.goods_id)
insert into remains
select inc.id,incg.subid, incg.goods, inc.storage, inc.ddate,r.volume 
from income inc
join incgoods incg on incg.id = inc.id
join r on r.goods = incg.goods and r.storage=inc.storage
where inc.ddate in  (select min(inc.ddate)
					from income inc
					join incgoods incg on incg.id = inc.id
					group by incg.goods, inc.storage)
order by inc.storage, incg.goods


insert into irlink(i_id,i_subid,r_id,r_subid,goods,volume)
values
  (36,36,4,4,1,272),
  (10,10,48,48,6,410),
  (27,27,9,9,8,100),
  (26,26,50,50,8,167),
  (23,23,7,7,9,102),
  (40,40,16,16,9,229),
  (4,4,26,26,10,84),
  (4,4,8,8,10,84),
  (41,41,37,37,11,346),
  (22,22,2,2,12,42),
  (5,5,13,13,12,99),
  (28,28,1,1,15,145),
  (9,9,1,1,15,40),
  (9,9,14,14,15,41),
  (46,46,12,12,17,370),
  (42,42,10,10,19,15),
  (42,42,44,44,19,15),
  (45,45,36,36,19,245),
  (25,25,15,15,19,134),
  (14,14,41,41,20,362)

--Добавить имя группы товаров и имя родительской группы товаров
alter table goods add id_parent int       
update goods set pgr_name = gg.name
from goods_groups gg 
where goods.g_group = gg.id;

update goods set pgr_name = gg.name
from goods_groups gg 
where goods.g_group = gg.id;

update goods set id_parent = gg.parent
from goods_groups gg 
where goods.g_group = gg.id;

update goods set pgr_name = gg.name
from goods_groups gg 
where goods.id_parent = gg.id;

alter table goods drop id_parent;







