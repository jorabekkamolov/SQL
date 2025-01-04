create view v_symmetric_union as(
	(select person_id
	from person_visits
	where visit_date = '2022-01-02'
	except
	select person_id
	from person_visits
	where visit_date = '2022-01-06'
	)
	union
	(select person_id
	from person_visits
	where visit_date = '2022-01-06'
	except
	select person_id
	from person_visits
	where visit_date = '2022-01-02'
	)
)
order by person_id;

-- select *
-- from v_symmetric_union
