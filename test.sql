--Переписать запрос без слов GROUP BY используя стандартные возможности SQL

select distinct key1,key2,
    (select sum(data1) 
     from t as t1
     where t1.key1 = t2.key1 and t1.key2 = t2.key2),
     (select min(data2)
      from t as t1
      where t1.key1 = t2.key1 and t1.key2 = t2.key2)
 from t as t2