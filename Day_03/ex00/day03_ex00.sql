select menu.pizza_name as pizza_name, menu.price as pizza_price, pizzeria.name as pizzeria_name, person_visits.visit_date
from pizzeria
join person_visits on pizzeria.id = person_visits.pizzeria_id
join menu on pizzeria.id = menu.pizzeria_id
join person on person.id = person_visits.person_id
where person.name = 'Kate' and menu.price between 800 and 1000
order by pizza_name, pizza_price, pizzeria_name;