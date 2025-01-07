with answer as ((select pizzeria.name, count(*) as count, 'visit' as action_type
from person_visits
join pizzeria on pizzeria.id = person_visits.pizzeria_id
group by pizzeria.name
order by count desc
limit 3)
union all
(select pizzeria.name, count(*) as count, 'order' as action_type
from person_order
join menu on menu.id = person_order.menu_id
join pizzeria on pizzeria.id = menu.pizzeria_id
group by pizzeria.name
order by count desc
limit 3))

select name, sum(count) as total_count
from answer
group by name
order by total_count desc, name asc;

