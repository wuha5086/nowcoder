select 
    t1.video_id,
    round(avg(if(timestampdiff(second,start_time,end_time)>=t1.duration,1,0)),3) as avg_comp_play_rate
from tb_video_info t1
left join tb_user_video_log t2
on t1.video_id = t2.video_id
where year(start_time) = 2021
group by t1.video_id
order by avg_comp_play_rate desc