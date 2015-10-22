--Transform survey_results via reducing columns--
DROP TABLE survey_results_new;
CREATE TABLE survey_results_new AS
SELECT provider_id, hospital_name, com_nurse_achieve, com_doc_achieve, hos_staff_achieve, paid_man_achieve, com_med_achieve, clean_quiet_achieve, discharge_achieve, overall_achieve, hcahps_base_score, hcahps_consistency_score FROM survey_results;
DROP TABLE survey_results_old;
ALTER TABLE survey_results RENAME TO survey_results_old;
ALTER TABLE survey_results_new RENAME TO survey_results;
