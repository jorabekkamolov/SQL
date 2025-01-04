select name
from v_persons_male
union
select name
from v_persons_female
order by name;