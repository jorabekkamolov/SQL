select pizzeria.name
from (
	select id
	from person
	where name = 'Dmitriy') as person_id
join person_visits on person_visits.person_id = person_id.id and person_visits.visit_date = '2022-01-08'
join menu on person_visits.pizzeria_id = menu.pizzeria_id and menu.price < 800
join pizzeria on pizzeria.id = menu.pizzeria_id;

