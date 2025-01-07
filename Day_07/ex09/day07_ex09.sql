select person.address,
	round(max(person.age) - (min(person.age)*1. / max(person.age)), 2) as formula,
	round(avg(person.age), 2) as average,
	(max(person.age) - (min(person.age) / max(person.age))) > round(avg(person.age), 2) as comparison
from person
group by person.address
order by person.address;
