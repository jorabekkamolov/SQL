-- select coalesce("user".name, 'not defined') as name,
-- 	coalesce("user".lastname, 'not defined') as lastname,
-- 	balance.type as type,
-- 	sum(coalesce(balance.money, 1)) as volume,
-- 	coalesce(currency.name, 'not defined') as currency_name,
-- 	coalesce(currency.rate_to_usd, 1) as last_rate_to_usd,
-- 	sum(coalesce(balance.money, 1)) * coalesce(currency.rate_to_usd, 1) as total_volume_in_usd
-- from "user"
-- full join balance on balance.user_id = "user".id
-- full join currency on currency.id = balance.currency_id
-- group by
--     "user".name,
--    	"user".lastname,
--     balance.type,
-- 	currency.name,
-- 	currency.rate_to_usd
-- having 
-- 	currency.rate_to_usd in 
-- 		(select rate_to_usd 
-- 		from currency 
-- 		where updated = (select max(updated) from currency) 
-- 		)
-- order by name desc, lastname, type;



with cte_last_rate_to_usd as (
    select
        currency.id,
        currency.name as currency_name,
        (select rate_to_usd from currency
            where currency.updated in (select max(currency.updated) from currency)
            and id = balance.currency_id) as last_rate
    from currency
    inner join balance on currency.id = balance.currency_id
    group by currency.id, currency_name, balance.currency_id
)
select
    coalesce("user".name, 'not defined') as name,
    coalesce("user".lastname, 'not defined') as lastname,
    balance.type,
    sum(coalesce(balance.money, 1)) as volume,
    coalesce(currency_name, 'not defined') as currency_name,
    coalesce(last_rate, 1) as last_rate_to_usd,
    sum(coalesce(balance.money, 1)) * coalesce(last_rate, 1) as total_volume_in_usd
from balance
full join "user" on "user".id = balance.user_id
left join cte_last_rate_to_usd on balance.currency_id = cte_last_rate_to_usd.id
group by type, "user".id, "user".name, lastname, currency_name, last_rate
order by name desc, lastname, type;
