create or replace function func_minimum(variadic arr numeric[]) returns numeric as $$
begin
	return(
		select min(value)
		from unnest(arr) as value
	);
end;
$$ language plpgsql;

select func_minimum(variadic arr => array[10.0, -1.0, 5.0, 4.4]);

