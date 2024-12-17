select person.name
from person
join person_order on person.id = person_order.person_id
join menu on menu.id = person_order.menu_id 
and menu.pizza_name in ('pepperoni pizza', 'cheese pizza')
where person.gender = 'female'
group by person.name
having count(distinct menu.pizza_name) = 2
order by person.name;