drop function if exists fnc_persons_female();
drop function if exists fnc_persons_female();

create or replace function fnc_persons(pgender varchar default 'female')
returns table(
	id person.id%type,
	name person.name%type,
	age person.age%type,
	gender person.gender%type,
	address person.address%type
) as $$
select id, name, age, gender, address
from person
where gender = pgender;
$$ language sql;

select * from fnc_persons(pgender := 'male');
