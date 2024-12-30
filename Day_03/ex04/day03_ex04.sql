(select pizzeria.name as pizzeria_name
from menu
	join person_order on person_order.menu_id = menu.id
	join pizzeria on pizzeria.id = menu.pizzeria_id
	join person on person.id = person_order.person_id
where person.gender = 'male'
except
select pizzeria.name as pizzeria_name
from menu
	join person_order on person_order.menu_id = menu.id
	join pizzeria on pizzeria.id = menu.pizzeria_id
	join person on person.id = person_order.person_id
where person.gender = 'female')

union

(select pizzeria.name as pizzeria_name
from menu
	join person_order on person_order.menu_id = menu.id
	join pizzeria on pizzeria.id = menu.pizzeria_id
	join person on person.id = person_order.person_id
where person.gender = 'female'
except
select pizzeria.name as pizzeria_name
from menu
	join person_order on person_order.menu_id = menu.id
	join pizzeria on pizzeria.id = menu.pizzeria_id
	join person on person.id = person_order.person_id
where person.gender = 'male')