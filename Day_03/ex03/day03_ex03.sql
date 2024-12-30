(select pizzeria.name as pizzeria_name
from pizzeria
	join person_visits on person_visits.pizzeria_id = pizzeria.id
	join person on person.id = person_visits.person_id
where person.gender = 'male'
except all
select pizzeria.name as pizzeria_name
from pizzeria
	join person_visits on person_visits.pizzeria_id = pizzeria.id
	join person on person.id = person_visits.person_id
where person.gender = 'female')

union all

(select pizzeria.name as pizzeria_name
from pizzeria
	join person_visits on person_visits.pizzeria_id = pizzeria.id
	join person on person.id = person_visits.person_id
where person.gender = 'female'
except all
select pizzeria.name as pizzeria_name
from pizzeria
	join person_visits on person_visits.pizzeria_id = pizzeria.id
	join person on person.id = person_visits.person_id
where person.gender = 'male')
