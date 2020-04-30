--Таблица: Дата, цена, товар
--Цены есть не на любую дату. Если цена не изменялась, то записи в таблице не будет
--Пока не появилась новая цена – действует старая
--Найдем цену на заданный товар и дату

select distinct product_id, price
from test
	where moment<'2020-09-15' and moment in
	(select max(moment) 
 		from test
 		where moment<'2020-09-15'
 			group by product_id)

--скорректированая версия
select price from test
where moment <= '2020-03-15' and product_id = 1 
order by moment desc
limit 1;