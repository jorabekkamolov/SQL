create function fnc_person_visits_and_eats_on_date(
	pperson varchar default 'Dmitriy',
	pprice numeric default 500,
	pdate date default '2022-01-08'
) returns table(name varchar) as $$
begin
	return query
	select pizzeria.name
	from pizzeria
	join menu on menu.pizzeria_id = pizzeria.id and menu.price < pprice
	join person_visits on person_visits.pizzeria_id = pizzeria.id and person_visits.visit_date = pdate
	join person on person.id = person_visits.person_id and person.name = pperson;
end;
$$ language plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);


select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
-- drop function fnc_person_visits_and_eats_on_date
