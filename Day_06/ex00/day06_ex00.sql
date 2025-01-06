-- Salom bu narsa day 06 da aytilgani dek 
-- day o3 dagi ozgarishlarni saqlash kerak 
-- va ular bilan day06 da ishlanadi shuni uchun agar kerak bolsa


-- insert into menu
-- (id, pizzeria_id, pizza_name, price)
-- values (19, 2, 'greek pizza', 800);


-- insert into menu
-- (id, pizzeria_id, pizza_name, price)
-- values(
-- 	(select max(id) + 1 from menu),
-- 	(select id from pizzeria where name = 'Dominos'),
-- 	'sicilian pizza', 900
-- );


-- insert into person_visits
-- 	(id, person_id, pizzeria_id, visit_date)
-- values(
-- 	(select max(id) + 1 from person_visits),
-- 	(select id from person where name = 'Denis'),
-- 	(select id from pizzeria where name = 'Dominos'),
-- 	'2022-02-24'
-- );

-- insert into person_visits
-- 	(id, person_id, pizzeria_id, visit_date)
-- values(
-- 	(select max(id) + 1 from person_visits),
-- 	(select id from person where name = 'Irina'),
-- 	(select id from pizzeria where name = 'Dominos'),
-- 	'2022-02-24'
-- );


-- insert into person_order
-- 	(id, person_id, menu_id, order_date)
-- values(
-- 	(select max(id) + 1 from person_order),
-- 	(select id from person where name = 'Denis'),
-- 	(select id from menu where pizza_name = 'sicilian pizza'),
-- 	'2022-02-24'
-- );

-- insert into person_order
-- 	(id, person_id, menu_id, order_date)
-- values(
-- 	(select max(id) + 1 from person_order),
-- 	(select id from person where name = 'Irina'),
-- 	(select id from menu where pizza_name = 'sicilian pizza'),
-- 	'2022-02-24'
-- );


-- update menu 
-- set price = price - price * 0.1
-- where pizza_name = 'greek pizza';


-- INSERT INTO person_order(id, person_id, menu_id, order_date)
-- SELECT
-- 		generate_series(
--           	(SELECT MAX(id) FROM person_order) + 1,
--         	(SELECT MAX(id) FROM person) + (SELECT MAX(id) FROM person_order),
--           	1
--         ),
--         generate_series(
--         		(SELECT MIN(id) FROM person), (SELECT MAX(id) FROM person)
--         ),
--         (SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
--         '2022-02-25';


-- delete from person_order
-- where order_date = '2022-02-25';

-- delete from menu
-- where pizza_name = 'greek pizza';

-- Bu esa task
create table person_discounts(
	id bigint primary key,
	person_id bigint not null,
	pizzeria_id bigint not null,
	discount numeric(10, 2),
	constraint fk_person_discounts_person_id foreign key (person_id) references person(id),
	constraint fk_person_discounts_pizzeria_id foreign key (pizzeria_id) references pizzeria(id)
);
-- Bu esa task