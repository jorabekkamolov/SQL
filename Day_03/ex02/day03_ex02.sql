select menu.pizza_name, menu.price, (select name from pizzeria where menu.pizzeria_id = pizzeria.id) as pizzeria_name
from menu
left join person_order on person_order.menu_id = menu.id
where person_order.menu_id is null
order by menu.pizza_name, menu.price;