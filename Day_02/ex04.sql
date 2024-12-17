select menu.pizza_name, pizzeria.name, menu.price
from menu
join pizzeria on pizzeria.id = menu.pizzeria_id
where menu.pizza_name = 'mushroom pizza' or menu.pizza_name = 'pepperoni pizza'
order by menu.pizza_name, pizzeria.name;
