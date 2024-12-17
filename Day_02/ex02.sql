select coalesce(p.name, '-') as person_name, date_temp.visit_date,
coalesce(pi.name, '-') as pizza_name
from (select *
from person_visits
where visit_date between '2022-01-01' and '2022-01-03') as date_temp
full join person p on p.id = date_temp.person_id
full join pizzeria pi on pi.id = date_temp.pizzeria_id
order by person_name, visit_date, pizza_name