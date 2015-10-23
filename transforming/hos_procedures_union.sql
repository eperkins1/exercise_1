--Build state_procedures table from complic_state, readmis_state, and timely_state--

--First step: Union complic and readmis--
DROP TABLE complic_readmis_hos;
CREATE TABLE complic_readmis_hos AS
SELECT provider_id, hospital_name, state, measure_id, measure_name, compared_to_national, denominator, score
FROM complic_hos
UNION ALL
SELECT provider_id, hospital_name, state, measure_id, measure_name, compared_to_national, denominator, score
FROM readmis_hos;

--Second step: Union timely with complic_readmis--
DROP TABLE hos_procedures;
CREATE TABLE hos_procedures AS
SELECT provider_id, hospital_name, state, measure_id, measure_name, compared_to_national, denominator, score, Null as sample
FROM complic_readmis_hos
UNION ALL
SELECT provider_id, hospital_name, state, measure_id, measure_name, Null as compared_to_national, Null as denominator, score, sample
FROM timely_hos;
