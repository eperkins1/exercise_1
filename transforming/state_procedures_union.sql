--Build state_procedures table from complic_state, readmis_state, and timely_state--

--First step: Union complic and readmis--
DROP TABLE complic_readmis_state;
CREATE TABLE complic_readmis_state AS
SELECT state, measure_id, measure_name, num_hospitals_better, num_hospitals_worse
FROM complic_state
UNION ALL
SELECT state, measure_id, measure_name, num_hospitals_better, num_hospitals_worse
FROM readmis_state;

--Second step: Union timely with complic_readmis--
DROP TABLE state_procedures;
CREATE TABLE state_procedures AS
SELECT state, measure_id, measure_name, num_hospitals_better, num_hospitals_worse, Null as score
FROM complic_readmis_state
UNION ALL
SELECT state, measure_id, measure_name, Null as num_hospitals_better, Null as num_hospitals_worse, score
FROM timely_state;
