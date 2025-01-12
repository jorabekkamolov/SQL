create table person_audit(
	created timestamp with time zone default current_timestamp not null,
	type_event char(1) default 'I' not null,
	row_id bigint not null,
	name varchar,
	age integer,
	gender varchar,
	address varchar
);

alter table person_audit add constraint ch_type_event
	check (type_event in ('I', 'U', 'D'));

create or replace function fnc_trg_person_insert_audit() returns trigger
as $person_audit$
begin
	if(tg_op = 'INSERT') then insert into person_audit values(now(), 'I', new.*);
	end if;
	return new;
end;
$person_audit$ language plpgsql;

create or replace trigger trg_person_insert_audit
after insert on person for each row
execute function fnc_trg_person_insert_audit();

insert into person(id, name, age, gender, address)
	values(10,'Damir', 22, 'male', 'Irkutsk');
