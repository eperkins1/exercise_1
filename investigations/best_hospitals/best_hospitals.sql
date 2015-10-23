--Creates a table of hospitals from complic and readmis tables, with sufficient sample, with corresponding avg_scores--
drop table hos_complic_readmis_scores;
create table hos_complic_readmis_scores as
select a.provider_id, a.hospital_name, avg(cast(a.score as int)) as avg_score
from hos_procedures a
where score is not null and denominator is not null and cast (denominator as int) > 100
group by provider_id, hospital_name;

--Create table of states with average score for timely--
drop table hos_timely_scores;
create table hos_timely_scores as
select a.provider_id, a.hospital_name, avg(cast(a.score as int)) as avg_score
from hos_procedures a 
where a.score is not null and a.sample is not null and cast (a.sample as int) > 100
group by provider_id, hospital_name;

--Join the tables, which have already been filtered for "sufficient" sample size (>100)--
drop table hos_scores;
create table hos_scores as
select a.provider_id, a.hospital_name, a.avg_score as crdscore, b.avg_score as tecscore, (a.avg_score * b.avg_score) as total_score
from hos_complic_readmis_scores a
inner join hos_timely_scores b
on (a.provider_id = b.provider_id);

--Select top 10 hospitals in complications, readmissions and deaths scores--
select hospital_name, crdscore
from hos_scores
order by crdscore desc
limit 1;

--Select top 10 hospitals in timely and effective care scores--
select hospital_name, tecscore
from hos_scores
order by tecscore desc
limit 1;

--Select top 10 hospitals in total score--
select hospital_name, total_score
from hos_scores
order by total_score desc
limit 10;