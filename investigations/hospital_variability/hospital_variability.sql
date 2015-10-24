--To investigate procedures' variance across hospitals, we first create a table mapping procedures to variability, filtering scores examine by those with sufficient sample size (>50)--
drop table procedure_variability;
create table procedure_variability as
select measure_id, measure_name, variance(cast(score as int)) as measure_var
from hos_procedures
where score is not null and (sample is not null and cast (sample as int) > 50) or (denominator is not null and cast(denominator as int) > 50)
group by measure_id, measure_name;

--We can now examine the top 10 most variable procedures between hospitals:
select *
from procedure_variability
order by measure_var desc
limit 10;