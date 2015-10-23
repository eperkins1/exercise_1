--Test whether there is a correlation between hospital scores and survey results--

--In case the hospital-procedures table has not been created yet, run this:
--------------------------------------------------------------------------------------------------------------------------------------
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
--------------------------------------------------------------------------------------------------------------------------------------

--First, we join our hospital scores and survey scores--
drop table scores_with_surveys;
create table scores_with_surveys as
select a.*, cast (substring(b.overall_achieve, 1, 1) as int) as overall_achieve, cast (b.hcahps_base_score as int) as base_score, cast(b.hcahps_consistency_score as int) as consistency_score
from hos_scores a
inner join survey_results b
on (a.provider_id = b.provider_id); 

--Now that we have this, we can compute correlations between different scores and survey responses--
--Correlation between total_score and survey measures)--
select corr(total_score, overall_achieve), corr(total_score, base_score), corr(total_score, consistency_score)
from scores_with_surveys;

--Correlation between average timely and effective care scores, and survey measures)--
select corr(tecscore, overall_achieve), corr(tecscore, base_score), corr(tecscore, consistency_score)
from scores_with_surveys;

--Correlation between average complications, readmissions and deaths scores, and survey measures)--
select corr(crdscore, overall_achieve), corr(crdscore, base_score), corr(crdscore, consistency_score)
from scores_with_surveys;

