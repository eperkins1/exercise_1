--Build procedures table from measure_dates and timely_national union-- 
DROP TABLE procedures;
CREATE TABLE procedures AS
SELECT DISTINCT measure_id
FROM timely_national
UNION ALL
SELECT DISTINCT measure_id
FROM measure_dates;