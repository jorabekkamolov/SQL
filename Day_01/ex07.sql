select order_date, (select concat(person.name, '(age:', person.age, ')')) as person_info
from person_order
join person on person_order.person_id = person.id
order by order_date, person_info;