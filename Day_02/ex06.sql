select menu.pizza_name as pizza_name, pizzeria.name as pizzeria_name
from (
	select id
	from person
	where name = 'Denis' or name = 'Anna') as person_name
join person_order on person_order.person_id = person_name.id
join menu on menu.id = person_order.menu_id
join pizzeria on pizzeria.id = menu.pizzeria_id
order by pizza_name, pizzeria_name;
