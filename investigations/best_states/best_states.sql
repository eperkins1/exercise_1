--Creates a table of states with difference of average better and worse--
drop table state_bw_diff;
create table state_bw_diff as
select a.state, (avg(cast(a.num_hospitals_better as int)) - avg(cast(a.num_hospitals_worse as int))) as bw_diff
from state_procedures a 
where a.num_hospitals_worse is not null and a.num_hospitals_better is not null
group by state;

--Create table of states with average score for timely--
drop table state_timely_score;
create table state_timely_score as
select a.state, avg(cast(a.score as int)) as avg_score
from state_procedures a 
where a.score is not null
group by state;

--Join tables--
drop table state_scores;
create table state_scores as
select a.*, b.avg_score
from state_bw_diff a
inner join state_timely_score b
on (a.state = b.state);

--Select states with more above average hospitals than below average hospitals--
select state, bw_diff
from state_scores
order by bw_diff desc
limit 25;

--Select states with top timely scores--
select state, avg_score
from state_scores
order by avg_score desc
limit 25;