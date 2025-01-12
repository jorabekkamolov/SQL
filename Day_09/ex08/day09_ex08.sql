create or replace function fnc_fibonacci(in pstop integer default 10)
returns table (num integer)
as
$$
with recursive cte_fib(num1, num2) as (
    values (0, 1)
    union
    select greatest(num1, num2), num1 + num2
    from cte_fib
    where num2 < pstop
)
select num1 from cte_fib;
$$ language sql;

select * from fnc_fibonacci(100);

select * from fnc_fibonacci();
