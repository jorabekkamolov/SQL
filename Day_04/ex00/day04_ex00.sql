create view v_persons_female as
select * from person
where person.gender = 'female'

create view v_persons_male as
select * from person
where person.gender = 'male';

-- select *
-- from v_persons_male

-- update person
-- set age = age + 1
-- where person.name = 'Andrey';