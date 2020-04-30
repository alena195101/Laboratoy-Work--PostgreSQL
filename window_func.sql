select r.id,r.ndoc, r.ddate, rg.goods, r.client, 
		rg.volume*rg.price summ, avg(rg.volume*rg.price) 
		over (partition by date_part('month',r.ddate),rg.goods)  avg_sum,
		sum(rg.volume*rg.price) over (order by r.ddate) save_summ
from recept r
join recgoods rg
on r.id = rg.id;