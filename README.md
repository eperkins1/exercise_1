# exercise_1 #
Repo for Exercise 1 in w205, Storing and Retrieving Data

#Note on renaming files
For each file, I manually renamed the files by removing spaces and replacing them with _
The load_data_lake.sh file is not actually a runnable script, but rather a description of the commands I used to load the data lake. If it is run, it will certainly produce an error, but I clearly describe my steps regarding scping files from my local laptop to my AMI, and then from my AMI to hdfs. 

I've confirmed multiple times that as long as hdfs files are properly named and placed, the code from hive_base_ddl.sql, transformations, and investigations is running without error. I encountered strange hive problems though, where it only worked if I stayed in the same AMI directory each time a hive script was run. This shouldn't pose any problems, but would explain if any errors occur upon the TA switching AMI directories and not getting correct output. 

Transforming Note:
The best order to run the transformation files is as follows:
1) hos_transform.sql√
2) survey_results_transform.sql√
3) hos_survey_join.sql√
4) procedures_union.sql√
5) hos_procedures_union.sql√
6) state_procedures_union.sql 

Investigations Note:
The best order to run the investigations is the order listed in the instructions document:
1)best_hospitals.sql
2)best_states.sql
3)hospital_variability.sql
4)hospitals_and_patients.sql

Several of my investigations sql files involve transformations. I was not sure whether these belonged in the transformations folder and should be incorporated into my ERD, but due to time constraints I simply made them part of the queries for investigating the data. The transformations in the transformations folder accurately reflect my ERD. 
