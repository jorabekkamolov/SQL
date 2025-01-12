insert into currency values (100, 'eur', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'eur', 0.79, '2022-01-08 13:29');

select
    coalesce("user".name, 'not defined') as name,
    coalesce("user".lastname, 'not defined') as lastname,
    tcur.name as currency_name,
    tcur.money * coalesce(tcur.rate_min, tcur.rate_max) as currency_in_usd
from
    (
        select
            balance.user_id,
            currency.id,
            currency.name,
            balance.money,
            (select currency.rate_to_usd from currency
                where currency.id = balance.currency_id
                  and currency.updated < balance.updated
                order by rate_to_usd limit 1
            ) as rate_min,
            (select currency.rate_to_usd from currency
                where currency.id = balance.currency_id
                  and currency.updated > balance.updated
                order by rate_to_usd limit 1
            ) as rate_max
        from currency
        join balance on currency.id = balance.currency_id
        group by
            balance.money,
            currency.name,
            currency.id,
            balance.updated,
            balance.currency_id,
            balance.user_id
        order by rate_min desc, rate_max
    ) as tcur
left join "user" on tcur.user_id = "user".id
order by name desc, lastname, currency_name;
