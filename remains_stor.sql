--Посчитать остатки на складах по всем дням периода с 1 марта 2020 года по 14 марта 2020 года
with date_t as(
  select ('2020-03-01')::date+t ddate
     from generate_series(0,13) t)
        
select inc_t.ddate,inc_t.storage,inc_t.goods, 
case when rec_t.rec_vol is null then inc_t.inc_vol
when inc_t.inc_vol is null then -rec_t.rec_vol
    else(inc_t.inc_vol - rec_t.rec_vol)
end AS  remnants

 from 
  (select  date_t.ddate,inc.storage,incgoods.goods,  
                  sum(incgoods.volume) inc_vol
       from income inc
       join incgoods
        on incgoods.id=inc.id
       join date_t on inc.ddate<=date_t.ddate
   group by date_t.ddate,inc.storage,incgoods.goods
    ) as inc_t 
full join 
 (select  date_t.ddate, rec.storage,recgoods.goods,
                    sum(recgoods.volume) rec_vol
         from recept rec
          join recgoods on recgoods.id=rec.id 
      join date_t on rec.ddate<= date_t.ddate
  group by date_t.ddate,rec.storage,recgoods.goods
    )rec_t
on rec_t.storage=inc_t.storage and rec_t.goods=inc_t.goods
and rec_t.ddate=inc_t.ddate 

order by inc_t.ddate,inc_t.storage
