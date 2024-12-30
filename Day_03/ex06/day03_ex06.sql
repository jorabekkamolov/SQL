-- select
-- 	temp.pizza_name,
-- 	(select name from pizzeria where pizzeria.id = temp.pizzeria_id),
-- 	(select name from pizzeria where pizzeria.id = pizzeria_id),
-- 	temp.price
-- from menu as temp
-- where exists(
-- 	select pizzeria_id
-- 	from menu
-- 	where temp.pizza_name = menu.pizza_name and temp.price = menu.price and temp.pizzeria_id != menu.pizzeria_id
-- )
-- order by temp.pizza_name;

SELECT menu1.pizza_name,
    pizzeria1.name AS pizzeria_name_1,
    pizzeria2.name AS pizzeria_name_2,
    menu1.price
FROM menu AS menu1
JOIN menu AS menu2 ON menu2.price = menu1.price
JOIN pizzeria AS pizzeria1 ON pizzeria1.id = menu1.pizzeria_id
JOIN pizzeria AS pizzeria2 ON pizzeria2.id = menu2.pizzeria_id
WHERE menu1.id > menu2.id AND menu1.pizza_name = menu2.pizza_name
ORDER BY pizza_name;