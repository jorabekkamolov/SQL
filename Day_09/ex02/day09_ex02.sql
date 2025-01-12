create or replace function trg_person_delete_audit() returns trigger as $person_audit$
begin
	if(tg_op = 'DELETE') then insert into person_audit values(now(), 'D', old.*);
	end if;
	return old;
end;
$person_audit$ language plpgsql;

create or replace trigger fnc_trg_person_delete_audit
after delete on person for each row
execute function trg_person_delete_audit();

delete
from person
where id = 10;

-- select *
-- from person_audit;