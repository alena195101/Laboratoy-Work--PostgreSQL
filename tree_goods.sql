with RECURSIVE t as (
	select g.id, g.name, g.parent, gp.name parent_name
	from goods_groups g join goods_groups gp on gp.id = g.parent
	union all 
		  select gg.id, gg.name, t.parent, gp.name from goods_groups as gg 
			join t on t.id = gg.parent
			join goods_groups gp on gp.id = t.parent)

select * from t;
