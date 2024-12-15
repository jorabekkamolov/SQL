select order_date, 
       (select concat(temp.name, '(age:', temp.age, ')')) as person_info
from person_order
natural join (select id as person_id, name, age from person) as temp
order by order_date, person_info;
