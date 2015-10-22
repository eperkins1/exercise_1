--Build procedures_with_dupes table from measure_dates and timely_national union-- 
DROP TABLE procedures_with_dupes;
CREATE TABLE procedures_with_dupes AS
SELECT DISTINCT measure_id
FROM timely_national
UNION ALL
SELECT DISTINCT measure_id
FROM measure_dates;

--Now create table with unique procedure IDs--
DROP TABLE procedures;
CREATE TABLE procedures AS
SELECT DISTINCT measure_id
FROM procedures_with_dupes;
DROP TABLE procedures_with_dupes;