select person.name
from person
join person_order on person.id = person_order.person_id
join menu on menu.id = person_order.menu_id 
	and menu.pizza_name in ('pepperoni pizza', 'mushroom pizza')
where person.address in ('Moscow', 'Samara')
	and person.gender = 'male'
order by person.name desc;	