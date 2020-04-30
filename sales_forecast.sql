CREATE OR REPLACE FUNCTION my_f(alpha decimal(18,4))
RETURNS table(client INTEGER, goods integer, mass decimal(18,4), errors DECIMAL(18,4), ddate date) AS $$
DECLARE
prev_mass integer;
prev_client integer;
prev_goods integer;
prev_predict_mass decimal(18,4);
predict_mass decimal(18,4);

curs CURSOR FOR select r.client, rg.goods, sum(g.weight * rg.volume) mass, r.ddate
          from recept r
          join recgoods rg on rg.id = r.id
          join goods g  on rg.goods = g.id
          where r.ddate between '2019-01-02' and'2019-12-31'
          group by r.ddate,r.client, rg.goods;
BEGIN
	OPEN curs;
  CREATE TEMP TABLE t (
    client INTEGER, goods integer, mass decimal(18,4), errors DECIMAL(18,4), ddate date
  );
 prev_goods = -666;
 prev_client = -666;
 prev_predict_mass = 0;
LOOP
	FETCH curs INTO client,goods,mass,ddate;
    EXIT WHEN NOT FOUND;
    IF prev_goods != goods  and prev_client != client THEN
		predict_mass = alpha*mass;
	ELSE
		predict_mass = alpha*mass+(1-alpha)*prev_predict_mass;
	END IF;
	prev_goods = goods;
	prev_predict_mass = predict_mass;

	insert INTO t(client,goods,mass,errors,ddate) values(client,goods,predict_mass,ABS(predict_mass-mass),ddate);
END LOOP;
  CLOSE curs;
  RETURN QUERY select t.client, t.goods, t.mass, T.errors, t.ddate from t;
  drop table t;
END;
$$
LANGUAGE plpgsql;

select * from my_f(4);