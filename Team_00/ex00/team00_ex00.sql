create table cities (
	id bigint primary key,
	point1 varchar not null,
	point2 varchar not null,
	cost integer not null
);

insert into cities(id, point1, point2, cost) values(1, 'a', 'b', 10);
insert into cities(id, point1, point2, cost) values(2, 'b', 'a', 10);
insert into cities(id, point1, point2, cost) values(3, 'a', 'd', 20);
insert into cities(id, point1, point2, cost) values(4, 'd', 'a', 20);
insert into cities(id, point1, point2, cost) values(5, 'a', 'c', 15);
insert into cities(id, point1, point2, cost) values(6, 'c', 'a', 15);
insert into cities(id, point1, point2, cost) values(7, 'b', 'd', 25);
insert into cities(id, point1, point2, cost) values(8, 'd', 'b', 25);
insert into cities(id, point1, point2, cost) values(9, 'b', 'c', 35);
insert into cities(id, point1, point2, cost) values(10, 'c', 'b', 35);
insert into cities(id, point1, point2, cost) values(11, 'd', 'c', 30);
insert into cities(id, point1, point2, cost) values(12, 'c', 'd', 30);


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
order by 1;