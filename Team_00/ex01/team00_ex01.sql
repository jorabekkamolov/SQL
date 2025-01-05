with recursive roads as (
	select cities.point1 as path,
	cities.point1, cities.point2, cities.cost
	from cities
	where cities.point1 = 'a'
	union
	select concat(roads.path, ',', cities.point1) as path,
	cities.point1, cities.point2, cities.cost + roads.cost
	from roads
	join cities on cities.point1 = roads.point2
	where path not like concat('%', cities.point1, '%')
	), answers as (
		select cost as total_cost,
		concat('{', path, ',', roads.point2, '}') as tour
		from roads
		where length(roads.path) = 7 and roads.point2 = 'a'
	)

select *
FROM answers
where total_cost = (
    select min(total_cost)
    from answers
)
union all
select *
FROM answers
where total_cost = (
    select max(total_cost)
    from answers
)
order by 1;