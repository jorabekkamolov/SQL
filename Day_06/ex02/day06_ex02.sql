select
	person.name,
	menu.pizza_name,
	menu.price,
	round(menu.price * (100 - person_discounts.discount) / 100) as discount_price,
	pizzeria.name
from person_order
join person on person_order.person_id = person.id
join menu on person_order.menu_id = menu.id
join pizzeria on menu.pizzeria_id = pizzeria.id
join person_discounts on pizzeria.id = person_discounts.pizzeria_id 
and person.id = person_discounts.person_id
order by person.name, menu.pizza_name;