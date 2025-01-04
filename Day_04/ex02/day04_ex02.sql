create view v_genderated_dates as
select date::date as generated_date
from generate_series('2022-01-01'::date, '2022-01-31'::date, '1 day'::interval) as date
order by generated_date