select order_date as temp_date, person_id
from person_order
intersect
select visit_date as temp_date, person_id
from person_visits
order by temp_date asc, person_id desc;