select person.name, count(*) as count
from person_visits
join person on person.id = person_visits.person_id
group by person.name
having count(*) > 3;