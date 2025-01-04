create view v_price_with_discount as(
	select person.name, menu.pizza_name, menu.price,
	cast(menu.price - menu.price * 0.1 as integer) as discount_price
	from person_order
	join person on person_order.person_id = person.id
	join menu on menu.id = person_order.menu_id
	order by person.name, menu.pizza_name
)

-- select *
-- from v_price_with_discount

-- drop view v_price_with_discount
