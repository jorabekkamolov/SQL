insert into person_visits
	(id, person_id, pizzeria_id, visit_date)
values(
	(select max(id) + 1 from person_visits),
	(select id from person where person.name = 'Dmitriy'),
	(select distinct pizzeria.id
	from pizzeria
	join menu on menu.pizzeria_id = pizzeria.id
	join mv_dmitriy_visits_and_eats as mv on mv.pizzeria_name != pizzeria.name
	where menu.price < 800 limit 1
	),
	'2022-01-08'
)

-- select *
-- from mv_dmitriy_visits_and_eats

-- refresh materialized view mv_dmitriy_visits_and_eats
