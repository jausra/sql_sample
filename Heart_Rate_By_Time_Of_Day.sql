--Jokubas Ausra - Average heart rate categorized by time of day

--Heart rate data from apple watch exported as csv using 'Auto export' app 
--Use the following to create your table:
--CREATE TABLE hr_data(
--dateandtime timestamp NOT NULL
--minhr float(5) NOT NULL
--maxhr float(5) NOT NULL
--avghr float(5) NOT NULL
--source integer 
--)

SELECT ROUND(AVG(avghr)) AS avg_BPM,											--Take the average heart rate grouped by the time of day
CASE																			--Group timestamp ranges into strings based on hour of the day
	WHEN (EXTRACT(HOUR FROM DateAndTime) BETWEEN 0 AND 5) THEN 'Night'
	WHEN (EXTRACT(HOUR FROM DateAndTime) BETWEEN 6 AND 11) THEN 'Morning'
	WHEN (EXTRACT(HOUR FROM DateAndTime) BETWEEN 12 AND 16) THEN 'Afternoon'
	WHEN (EXTRACT(HOUR FROM DateAndTime) BETWEEN 17 AND 20) THEN 'Evening'
	WHEN (EXTRACT(HOUR FROM DateAndTime) BETWEEN 21 AND 24) THEN 'Night'
END	AS Time_Of_Day
FROM hr_data
GROUP BY Time_Of_Day 															--Group the average heart rate by time of day
ORDER BY avg_BPM ASC 															--order rows by ascending average heart rate 
