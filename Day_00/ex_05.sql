select concat(
	name, '(', 'age:', age, ',gender', ':', '''', gender, '''', ',address', ':', '''', address, '''', ')'
) as person_info
from person
order by person_info;