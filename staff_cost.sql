create view  staff_cost as
select 
	r.date,
	s.first_name,
	s.last_name,
	s.hourly_rate,
	shift.start_time,
	shift.end_time,
	round((hour(timediff(shift.end_time,shift.start_time))*60+ minute(timediff(shift.end_time,shift.start_time)))/60, 2) as hour_in_shift,
	round((hour(timediff(shift.end_time,shift.start_time))*60+ minute(timediff(shift.end_time,shift.start_time)))/60*hourly_rate,2) as staff_cost
from
	rota r
left join staff s on r.staff_id = s.staff_id
left join shift on r.shift_id = shift.shift_id