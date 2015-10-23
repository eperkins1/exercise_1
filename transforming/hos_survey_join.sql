--Build hospital_procedure table--
DROP TABLE hos_survey;
CREATE TABLE hos_survey AS
SELECT a.*, b.overall_achieve, b.hcahps_base_score, b.hcahps_consistency_score
FROM hospitals a
LEFT OUTER JOIN survey_results b
ON (a.provider_id = b.provider_id);