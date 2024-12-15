select object_name
from (
	select name as object_name, 'person' as temp
	from person
	union all
	select pizza_name as object_name, 'menu' as temp
	from menu
) as combined
order by temp desc, object_name;