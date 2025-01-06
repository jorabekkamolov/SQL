create index idx_person_name on person(upper(name));
set enable_seqscan = off;
explain analyse
select *
from person
where upper(name) = 'ANNA';