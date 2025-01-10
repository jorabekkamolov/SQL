-- terminal 1
begin transaction isolation level repeatable read;
-- terminal 1

-- terminal 2
begin transaction isolation level repeatable read
-- terminal 2

-- terminal 1
select sum(rating)
from pizzeria;
-- terminal 1

-- terminal 2
insert into pizzeria(id, name, raiting)
values (11, 'Kazan Pizza 2', 4);
-- terminal 2

-- terminal 2
commit;
-- terminal 2

-- terminal 1
select sum(rating)
from pizzeria;
-- terminal 1

-- terminal 1
commit;
-- terminal 1

-- terminal 1
select sum(rating)
from pizzeria;
-- terminal 1

-- terminal 2
select sum(rating)
from pizzeria;
-- terminal 2