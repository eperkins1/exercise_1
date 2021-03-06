DROP TABLE complic_hos;
CREATE EXTERNAL TABLE `complic_hos`(
  `provider_id` string COMMENT 'from deserializer', 
  `hospital_name` string COMMENT 'from deserializer', 
  `address` string COMMENT 'from deserializer', 
  `city` string COMMENT 'from deserializer', 
  `state` string COMMENT 'from deserializer', 
  `zip_code` string COMMENT 'from deserializer', 
  `county_name` string COMMENT 'from deserializer', 
  `phone_number` string COMMENT 'from deserializer', 
  `measure_name` string COMMENT 'from deserializer', 
  `measure_id` string COMMENT 'from deserializer', 
  `compared_to_national` string COMMENT 'from deserializer', 
  `denominator` string COMMENT 'from deserializer', 
  `score` string COMMENT 'from deserializer', 
  `lower_estimate` string COMMENT 'from deserializer', 
  `higher_estimate` string COMMENT 'from deserializer', 
  `footnote` string COMMENT 'from deserializer', 
  `measure_start_date` string COMMENT 'from deserializer', 
  `measure_end_date` string COMMENT 'from deserializer')
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://localhost:8020/data/w205/hospital_files/Complications_Hospital';

DROP TABLE complic_state;
CREATE EXTERNAL TABLE `complic_state`(
  `state` string COMMENT 'from deserializer', 
  `measure_name` string COMMENT 'from deserializer', 
  `measure_id` string COMMENT 'from deserializer', 
  `num_hospitals_worse` string COMMENT 'from deserializer', 
  `num_hospitals_same` string COMMENT 'from deserializer', 
  `num_hospitals_better` string COMMENT 'from deserializer', 
  `num_hospitals_too_few` string COMMENT 'from deserializer', 
  `footnote` string COMMENT 'from deserializer')
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://localhost:8020/data/w205/hospital_files/Complications_State';  

DROP TABLE hospitals_initial;
CREATE EXTERNAL TABLE `hospitals_initial`(
  `provider_id` string COMMENT 'from deserializer', 
  `hospital_name` string COMMENT 'from deserializer', 
  `address` string COMMENT 'from deserializer', 
  `city` string COMMENT 'from deserializer', 
  `state` string COMMENT 'from deserializer', 
  `zip` string COMMENT 'from deserializer', 
  `county` string COMMENT 'from deserializer', 
  `phone` string COMMENT 'from deserializer', 
  `hospital_type` string COMMENT 'from deserializer', 
  `hospital_ownership` string COMMENT 'from deserializer')
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://localhost:8020/data/w205/hospital_files/Hospital_General_Information';

DROP TABLE measure_dates;
CREATE EXTERNAL TABLE `measure_dates`(
  `measure_name` string COMMENT 'from deserializer', 
  `measure_id` string COMMENT 'from deserializer', 
  `measure_start_quarter` string COMMENT 'from deserializer', 
  `measure_start_date` string COMMENT 'from deserializer', 
  `measure_end_quarter` string COMMENT 'from deserializer', 
  `measure_end_date` string COMMENT 'from deserializer')
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://localhost:8020/data/w205/hospital_files/Measure_Dates';

DROP TABLE timely_hos;
CREATE EXTERNAL TABLE `timely_hos`(
  `provider_id` string COMMENT 'from deserializer', 
  `hospital_name` string COMMENT 'from deserializer', 
  `address` string COMMENT 'from deserializer', 
  `city` string COMMENT 'from deserializer', 
  `state` string COMMENT 'from deserializer', 
  `zip` string COMMENT 'from deserializer', 
  `county` string COMMENT 'from deserializer', 
  `phone` string COMMENT 'from deserializer', 
  `condition` string COMMENT 'from deserializer', 
  `measure_id` string COMMENT 'from deserializer', 
  `measure_name` string COMMENT 'from deserializer', 
  `score` string COMMENT 'from deserializer', 
  `sample` string COMMENT 'from deserializer', 
  `footnote` string COMMENT 'from deserializer', 
  `measure_start_date` string COMMENT 'from deserializer', 
  `measure_end_date` string COMMENT 'from deserializer')
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://localhost:8020/data/w205/hospital_files/Timely_And_Effective_Care_Hospital';

DROP TABLE timely_state;
CREATE EXTERNAL TABLE `timely_state`(
  `state` string COMMENT 'from deserializer', 
  `condition` string COMMENT 'from deserializer', 
  `measure_name` string COMMENT 'from deserializer', 
  `measure_id` string COMMENT 'from deserializer', 
  `score` string COMMENT 'from deserializer', 
  `footnote` string COMMENT 'from deserializer', 
  `measure_start_date` string COMMENT 'from deserializer', 
  `measure_end_date` string COMMENT 'from deserializer')
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://localhost:8020/data/w205/hospital_files/Timely_And_Effective_Care_State';

DROP TABLE readmis_state;
CREATE EXTERNAL TABLE `readmis_state`(
  `state` string COMMENT 'from deserializer', 
  `measure_name` string COMMENT 'from deserializer', 
  `measure_id` string COMMENT 'from deserializer', 
  `num_hospitals_worse` string COMMENT 'from deserializer',
  `num_hospitals_same` string COMMENT 'from deserializer',
  `num_hospitals_better` string COMMENT 'from deserializer',
  `num_hospitals_too_few` string COMMENT 'from deserializer', 
  `footnote` string COMMENT 'from deserializer', 
  `measure_start_date` string COMMENT 'from deserializer', 
  `measure_end_date` string COMMENT 'from deserializer')
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://localhost:8020/data/w205/hospital_files/Readmissions_And_Deaths_State';

DROP TABLE readmis_hos;
CREATE EXTERNAL TABLE `readmis_hos`(
  `provider_id` string COMMENT 'from deserializer', 
  `hospital_name` string COMMENT 'from deserializer',
  `address` string COMMENT 'from deserializer',
  `city` string COMMENT 'from deserializer',
  `state` string COMMENT 'from deserializer',
  `zip` string COMMENT 'from deserializer',
  `county` string COMMENT 'from deserializer',
  `phone` string COMMENT 'from deserializer', 
  `measure_name` string COMMENT 'from deserializer', 
  `measure_id` string COMMENT 'from deserializer',
  `compared_to_national` string COMMENT 'from deserializer',
  `denominator` string COMMENT 'from deserializer', 
  `score` string COMMENT 'from deserializer',
  `lower_estimate` string COMMENT 'from deserializer',
  `higher_estimate` string COMMENT 'from deserializer', 
  `footnote` string COMMENT 'from deserializer', 
  `measure_start_date` string COMMENT 'from deserializer', 
  `measure_end_date` string COMMENT 'from deserializer')
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://localhost:8020/data/w205/hospital_files/Readmissions_And_Deaths_Hospital';

DROP TABLE survey_results_initial;
CREATE EXTERNAL TABLE `survey_results_initial`(
  `provider_id` string COMMENT 'from deserializer', 
  `hospital_name` string COMMENT 'from deserializer',
  `address` string COMMENT 'from deserializer',
  `city` string COMMENT 'from deserializer',
  `state` string COMMENT 'from deserializer',
  `zip` string COMMENT 'from deserializer',
  `county` string COMMENT 'from deserializer',
  `com_nurse_achieve` string COMMENT 'from deserializer',
  `com_nurse_improve` string COMMENT 'from deserializer',
  `com_nurse_dimension` string COMMENT 'from deserializer',
  `com_doc_achieve` string COMMENT 'from deserializer',
  `com_doc_improve` string COMMENT 'from deserializer',
  `com_doc_dimension` string COMMENT 'from deserializer',
  `hos_staff_achieve` string COMMENT 'from deserializer',
  `hos_staff_improve` string COMMENT 'from deserializer',
  `hos_staff_dimension` string COMMENT 'from deserializer',
  `paid_man_achieve` string COMMENT 'from deserializer',
  `paid_man_improve` string COMMENT 'from deserializer',
  `paid_man_dimension` string COMMENT 'from deserializer',
  `com_med_achieve` string COMMENT 'from deserializer',
  `com_med_improve` string COMMENT 'from deserializer',
  `com_med_dimension` string COMMENT 'from deserializer',
  `clean_quiet_achieve` string COMMENT 'from deserializer',
  `clean_quiet_improve` string COMMENT 'from deserializer',
  `clean_quiet_dimension` string COMMENT 'from deserializer',
  `discharge_achieve` string COMMENT 'from deserializer',
  `discharge_improve` string COMMENT 'from deserializer',
  `discharge_dimension` string COMMENT 'from deserializer',
  `overall_achieve` string COMMENT 'from deserializer',
  `overall_improve` string COMMENT 'from deserializer',
  `overall_dimension` string COMMENT 'from deserializer',
  `hcahps_base_score` string COMMENT 'from deserializer',
  `hcahps_consistency_score` string COMMENT 'from deserializer')
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://localhost:8020/data/w205/hospital_files/Survey_Results';

DROP TABLE readmis_national;
CREATE EXTERNAL TABLE `readmis_national`(
  `measure_name` string COMMENT 'from deserializer', 
  `measure_id` string COMMENT 'from deserializer', 
  `national_rate` string COMMENT 'from deserializer', 
  `num_hospitals_worse` string COMMENT 'from deserializer',
  `num_hospitals_same` string COMMENT 'from deserializer',
  `num_hospitals_better` string COMMENT 'from deserializer',
  `num_hospitals_too_few` string COMMENT 'from deserializer', 
  `footnote` string COMMENT 'from deserializer', 
  `measure_start_date` string COMMENT 'from deserializer', 
  `measure_end_date` string COMMENT 'from deserializer')
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://localhost:8020/data/w205/hospital_files/Readmissions_And_Deaths_National';

DROP TABLE complic_national;
CREATE EXTERNAL TABLE `complic_national`(
  `measure_name` string COMMENT 'from deserializer', 
  `measure_id` string COMMENT 'from deserializer',
  `national_rate` string COMMENT 'from deserializer', 
  `num_hospitals_worse` string COMMENT 'from deserializer',
  `num_hospitals_same` string COMMENT 'from deserializer',
  `num_hospitals_better` string COMMENT 'from deserializer',
  `num_hospitals_too_few` string COMMENT 'from deserializer', 
  `footnote` string COMMENT 'from deserializer', 
  `measure_start_date` string COMMENT 'from deserializer', 
  `measure_end_date` string COMMENT 'from deserializer')
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://localhost:8020/data/w205/hospital_files/Complications_National';

DROP TABLE timely_national;
CREATE EXTERNAL TABLE `timely_national`(
  `measure_name` string COMMENT 'from deserializer', 
  `measure_id` string COMMENT 'from deserializer', 
  `condition` string COMMENT 'from deserializer',
  `category` string COMMENT 'from deserializer',
  `score` string COMMENT 'from deserializer',
  `footnote` string COMMENT 'from deserializer', 
  `measure_start_date` string COMMENT 'from deserializer', 
  `measure_end_date` string COMMENT 'from deserializer')
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://localhost:8020/data/w205/hospital_files/Timely_And_Effective_Care_National';














