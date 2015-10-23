#Loading files from laptop to AMI
scp -i keys/perkPairNew.pem w205/exercise_1/hospital_files/* root@ec2-54-174-253-62.compute-1.amazonaws.com:/data/eric/hospital_files

#Removing header and renaming files
#In experiment_1 directory
mkdir header_gone
For each csv file$:
	sed -i 1d file$
	mv file$ header_gone/new_file$ #new_file$ is the new filename, with spaces removed or replaced by _
cd ..
mv hospital_files/header_gone/* hospital_files/
cd hospital_files
rm -r header_gone

#Loading files from AMI into HDFS
sudo -u hdfs hdfs dfs -put ~/w205/exercise_1/hospital_files/* hdfs:/data/w205/hospital_files/

#Loading specific files into their own directories:
As w205 in AMI
For each to-be-hive-tabeled csv file$ in hdfs:
	hdfs dfs -mkdir /data/w205/hospital_files/<file$_without_.csv>
	hdfs dfs -mv /data/w205/hospital_files/file$ /data/w205/hospital_files/<file$_without_.csv>/file$