select person.address,
	pizzeria.name,
	count(*) as count_of_orders
from person_order
join menu on menu.id = person_order.menu_id
join pizzeria on pizzeria.id = menu.pizzeria_id
join person on person.id = person_order.person_id
group by person.address, pizzeria.name
order by person.address, pizzeria.name;