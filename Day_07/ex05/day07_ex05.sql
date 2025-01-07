select distinct p.name
from person p
join person_order po on p.id = po.person_id
order by p.name;