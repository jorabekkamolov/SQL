with day_generator as (
	select missing_date::date
	from generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) as missing_date)
select missing_date
from day_generator
left join (
	select visit_date
	from person_visits
	where person_id = 1 or person_id = 2) as temp on missing_date = visit_date
where visit_date is null
order by visit_date;