with RECURSIVE t as (
	select gr.id, gr.name, gr.parent, gg.name parent_name
	from client_groups gr join client_groups gg on gg.id = gr.parent
	union all 
		  select gg.id, gg.name, t.parent, gp.name from client_groups as gg 
			join t on t.id = gg.parent
			join client_groups gp on gp.id = t.parent)

select distinct cl.id client_id, cl.name client_name, cl.client_groups groups_id, g.name group_name
	from client cl join client_groups g on cl.client_groups = g.id
union all
select cl.id, cl.name, t.parent, t.parent_name from client cl
	join t on t.id = cl.client_groups
order by client_id;