-- terminal 1
begin transaction 
    isolation level read uncommitted;

-- terminal 2
begin transaction 
    isolation level read uncommitted;

-- terminal 1
show transaction isolation level;

-- terminal 2
show transaction isolation level;

-- terminal 1
update pizzeria
   set rating = 1
 where id = 1;

-- terminal 2
update pizzeria
   set rating = 2
 where id = 2;

-- terminal 1
update pizzeria
   set rating = 1
 where id = 2;

-- terminal 2
update pizzeria
   set rating = 2
 where id = 1;

-- terminal 1
commit;

-- terminal 2
commit;

-- terminal 1
select *
  from pizzeria;

-- terminal 2
select *
  from pizzeria;
