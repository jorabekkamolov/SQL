-- terminal 1
show transaction isolation level;
-- terminal 1

-- terminal 2
show transaction isolation level;
-- terminal 2

-- Ikkalasida ham default holatda "read committed" da korsatadi
-- Yani begin; qilganimizda "read committed" transaction ni ishga tushadi

-- terminal 1
begin transaction isolation level repeatable read;
-- terminal 1 


-- terminal 2
begin transaction isolation level repeatable read;
-- terminal 2 

-- terminal 1
select *
from pizzeria
where name = 'Pizza Hut';
-- terminal 1

-- terminal 2
select *
from pizzeria
where name = 'Pizza Hut';
-- terminal 2

-- Shu yerda ikkalasida ham natija 5 javob chiqadi

-- terminal 1
update pizzeria
set rating = 4
where name = 'Pizza Hut'
-- terminal 1

-- terminal 1
select *
from pizzeria
where name = 'Pizza Hut';
-- terminal 1

-- terminal 2
select *
from pizzeria
where name = 'Pizza Hut';
-- terminal 2

-- Bu yerda esa termin 1 da update qiltik lekin u select qilsak
-- faqatgin terminal 1 da 4 natija chiqadi 
-- Lekin terminal 2 da esa Xato chiqazadi

-- terminal 2
update pizzeria
set rating = 3.6
where name = 'Pizza Hut'
-- terminal 2

-- bu yerda ham xato chiqazadi

-- terminal 1
commit;
-- terminal 1

-- shunday qilsak song oxirgcha ishlaydi termina 1;

-- terminal 2
commit;
-- terminal 2


-- terminal 1
select *
from pizzeria
where name = 'Pizza Hut';
-- terminal 1

-- terminal 2
select *
from pizzeria
where name = 'Pizza Hut';
-- terminal 2


-- Endi ikkala holatda ham 4 natija chiqadi