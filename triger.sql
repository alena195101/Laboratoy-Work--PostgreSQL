--тригер на update incgoods fifo


CREATE or REPLACE FUNCTION remains_refresh() RETURNS TRIGGER as $$ 
DECLARE t_row record;
cur_rec_volume integer;
cur_volume integer;
begin 
if (new.volume is NULL) then raise exception'Column value cannot be null!';
end if;

create temp table inc (
  id integer, subid integer, goods integer, 
	storage integer, ddate date, volume integer);
	
insert into inc(id, subid, goods,storage,ddate, volume )
select
  incg.id, incg.subid, incg.goods,inc.storage, inc.ddate,incg.volume
from income inc
join incgoods incg on inc.id = incg.id
where incg.goods = new.goods and inc.storage = (select storage from remains where id = new.id)
order by inc.ddate;

cur_rec_volume = (select sum(volume) from irlink 
						where i_id in (select id from inc) and i_subid in (select subid from inc));

if ((select sum(volume)- old.volume + new.volume from inc) < cur_rec_volume)
then raise exception 'income cannot be < recept';
end if;
update inc set volume=new.volume
where id = new.volume;

for t_row in select * from inc
loop
cur_volume = t_row.volume - cur_rec_volume;
if cur_volume < 0 then cur_volume = 0;
end if;
cur_rec_volume = cur_rec_volume - t_row.volume;
insert into irlink(i_id,i_subid,r_id,r_subid,goods,volume)
values (t_row.id,t_row.subid, (select r_id from irlink where i_id = new.id and i_subid=new.subid),
		   (select r_subid from irlink where i_id = new.id and i_subid=new.subid),
		   t_row.goods, (t_row.volume - cur_volume))
ON CONFLICT (id) DO
update set volume = (t_row.volume - cur_volume);

update remains set volume = cur_volume
where id = t_row.id and subid = t_row.subid;
EXIT WHEN cur_rec_volume <= 0;
END LOOP;
--убираем лишние строки
delete from remains
where volume = 0;

drop 
  table  inc;
return new;
end;
$$ language PLPGSQL;

create trigger tbu_incgoods
before update on incgoods
for each row execute procedure remains_refresh();
