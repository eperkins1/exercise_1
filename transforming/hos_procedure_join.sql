--Build hospital_procedure table--
DROP TABLE hos_procedure;
CREATE TABLE hos_procedure AS
SELECT a.*, b.overall_achieve, b.hcahps_base_score, b.hcahps_consistency_score
FROM hospitals a
LEFT OUTER JOIN survey_results b
ON (a.provider_id = b.provider_id);