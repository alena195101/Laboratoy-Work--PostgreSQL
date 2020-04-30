create or REPLACE function f(n integer)
returns table (col integer) as $$
BEGIN
return QUERY select * from generate_series(1,n) ;
end;
$$
LANGUAGE plpgsql;

select * from 
f(5) t1, lateral f(t1);