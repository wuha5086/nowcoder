select 
  t1.dt,
  round(count(t2.uid)/count(t1.uid),2) as uv_left_rate
from
  (select 
    uid,
    min(date(in_time)) as dt
  from tb_user_log
  group by uid) t1
  left join
  (select 
     uid, date(in_time) as dt
   from tb_user_log
   union
   select
     uid, date(out_time) as dt
   from tb_user_log 
  ) t2
  on t1.uid = t2.uid and datediff(t2.dt,t1.dt) = 1
  where substring(t1.dt,1,7) = '2021-11'
  group by t1.dt
  order by t1.dt