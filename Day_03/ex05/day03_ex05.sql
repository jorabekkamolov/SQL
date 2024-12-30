select pizzeria.name as pizzeria_name
from pizzeria
join person_visits on person_visits.pizzeria_id = pizzeria.id
join person on person_visits.person_id = person.id
where person.name = 'Andrey'

except

select pizzeria.name as pizzeria_name
from pizzeria
join menu on menu.pizzeria_id = pizzeria.id
join person_order on person_order.menu_id = menu.id
join person on person.id = person_order.person_id
where person.name = 'Andrey'