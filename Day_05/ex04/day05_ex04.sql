create unique index idx_menu_unique on menu(pizzeria_id, pizza_name);
set enable_seqscan = off;
explain analyze
select distinct pizzeria_id, pizza_name
from menu
where pizza_name = 'sausage pizza';