-- terminal 1
begin;
update pizzeria
set rating = 5
where name = 'Pizza Hut';
-- terminal 1

--terminal 2
select *
from pizzeria
where name = 'Pizza Hut';
--terminal 2

-- terminal 1
commit;
-- terminal 1

--terminal 2
select *
from pizzeria
where name = 'Pizza Hut';
--terminal 2