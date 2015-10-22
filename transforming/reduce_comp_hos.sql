CREATE TABLE complic_hos_reduce AS
SELECT provider_id, hospital_name, state, measure_name, measure_id, compared_to_national, denominator, score FROM complic_hos;


