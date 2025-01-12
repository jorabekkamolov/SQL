create or replace function fnc_persons_female()
returns table(
		id person.id%type,
		name person.name%type,
		age person.age%type,
		gender person.gender%type,
		address person.address%type
	) as $$
select id, name, age, gender, address
from person
where gender = 'female';
$$ language sql;

create or replace function fnc_persons_male()
returns table(
		id person.id%type,
		name person.name%type,
		age person.age%type,
		gender person.gender%type,
		address person.address%type
	) as $$
select id, name, age, gender, address
from person
where gender = 'male';
$$ language sql;


select * from fnc_persons_female();
select * from fnc_persons_male();
	