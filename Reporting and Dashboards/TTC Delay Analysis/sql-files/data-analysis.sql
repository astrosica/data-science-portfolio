-- 1. Yearly trends

-- basic statistics for 2023
SELECT
  -- number of delays
  COUNT(*) AS N_Delays,
  -- total delay time
  SUM(Min_Delay) AS Sum_Delay_Time,
  -- minimum delay time
  MIN(Min_Delay) AS Min_Delay_Time,
  -- maximum delay time
  Max(Min_Delay) AS Max_Delay_Time,
  -- average delay time
  ROUND(AVG(Min_Delay),0) AS Avg_Delay_Time,
  -- standard deviation delay time
  ROUND(STD(Min_Delay),0) AS Std_Delay_Time
FROM delays_2023;

-- basic statistics for 2022
SELECT
  -- number of delays
  COUNT(*) AS N_Delays,
  -- total delay time
  SUM(Min_Delay) AS Sum_Delay_Time,
  -- minimum delay time
  MIN(Min_Delay) AS Min_Delay_Time,
  -- maximum delay time
  Max(Min_Delay) AS Max_Delay_Time,
  -- average delay time
  ROUND(AVG(Min_Delay),0) AS Avg_Delay_Time,
  -- standard deviation delay time
  ROUND(STD(Min_Delay),0) AS Std_Delay_Time
FROM delays_2022;

-- distribution of delay times for 2023
SELECT
  -- delay in minutes (histogram bins)
  Min_Delay AS Delay_in_Minutes,
  -- number of delays in each time bin
	COUNT(*) AS Number_of_Delays,
	-- create histogram
	-- divide counts by 100 for better visualization
	RPAD('', COUNT(*)/100, '*') AS 'Count (* = 100)'
FROM delays_2023
-- restrict to non-zero delay times
WHERE Min_Delay>0
-- group by delay time and order by increasing value
GROUP BY Min_Delay
ORDER BY Min_Delay;

-- 2. Pain points (stations)

-- stations with the greatest numer of delays for 2023
SELECT
	-- number stations by descreasing number of delays
	ROW_NUMBER() OVER(ORDER BY COUNT(Min_Delay) DESC) AS ID,
	Station,
    -- use CASE to identify Lines
	CASE
		WHEN Line = 'YU' THEN 'Line 1'
		WHEN Line = 'BD' THEN 'Line 2'
		WHEN Line = 'SHP' THEN 'Line 4'
	-- name new column Line_Num
	END AS Line_Num,
	-- number of delays
	COUNT(Min_Delay) AS N_Delays,
  -- sum of delay time
	SUM(Min_Delay) AS Sum_Delays,
	-- create histogram of total delay times
	-- divide counts by 10 for better visualization
	RPAD('', COUNT(Min_Delay)/10, '*') AS 'N_Delays_Count (* = 10)'
FROM delays_2023
-- restrict to non-zero delay times
WHERE Min_Delay>0
-- group by station then line number
GROUP BY Station, Line_Num
LIMIT 5;

-- 3. Pain points (codes)

-- most frequent cause of delays for 2023
SELECT
	-- number stations by descreasing count instances
	ROW_NUMBER() OVER(ORDER BY COUNT(d23.Code) DESC) AS ID,
	-- code
	d23.Code,
  -- number of instances for each code
  COUNT(d23.Code) AS Delay_Count,
  -- total delay time for each code
  SUM(d23.Min_Delay) AS Delay_Sum,
  -- description of each code
  codes.Description AS Code_Description
-- query code instances from delay table
FROM delays_2023 d23
-- join with code table for descriptions
INNER JOIN delay_codes codes
	ON d23.Code = codes.Code
-- group by code then description
GROUP BY d23.Code, codes.Description
-- order by descreasing number of code instances
ORDER BY COUNT(d23.Code) DESC
-- limit to the single most frequent code
LIMIT 1;

-- SUDP codes for 2022
SELECT
	-- code
	d22.Code,
  -- number of instances for each code
  COUNT(d22.Code) AS Delay_Count,
  -- total delay time for each code
  SUM(d22.Min_Delay) AS Delay_Sum,
  -- description of each code
  codes.Description AS Code_Description
-- query code instances from delay table
FROM delays_2022 d22
-- join with code table for descriptions
INNER JOIN delay_codes codes
	ON d22.Code = codes.Code
WHERE d22.Code = 'SUDP'
-- group by code then description
GROUP BY d22.Code, codes.Description;

-- station with the most SUDP codes for 2023
SELECT
  -- number stations by descreasing count instances
	ROW_NUMBER() OVER(ORDER BY COUNT(*) DESC) AS ID,
  -- station
  d23.Station,
  -- line
  d23.Line,
  -- use CASE to identify Lines
	CASE
	  WHEN Line = 'YU' THEN 'Line 1'
	  WHEN Line = 'BD' THEN 'Line 2'
	  WHEN Line = 'SHP' THEN 'Line 4'
	-- name new column Line_Num
  END AS Line_Num,
  -- number of codes
  COUNT(*) AS N_Codes,
  -- total delay time
  SUM(Min_Delay) AS Sum_Delay_Time
-- query code instances from delay table
FROM delays_2023 d23
-- join with code table for descriptions
JOIN delay_codes codes
	ON d23.Code = codes.Code
	-- restrict to MUIS codes
	WHERE codes.Code = 'MUIS'
-- group by station then line
GROUP BY d23.Station, Line
-- limit to top station
LIMIT 1;

-- 4. Daily trends

-- number of delays per hour for 2023
SELECT
	-- 24 hour time
	TIME_FORMAT(Time, '%H:00') AS Time_24h,
  -- 12 hour time
  TIME_FORMAT(Time, '%h %p') AS Time_12h,
  -- number of delays
	COUNT(*) AS N_Delays,
  -- create histogram
	-- divide counts by 100 for better visualization
	RPAD('', COUNT(*)/100, '*') AS 'Count (* = 100)'
FROM delays_2023
-- group by 24 hour time, then 12 hour time
GROUP BY Time_24h, Time_12h
-- order by 24 hour time, then 12 hour time
ORDER BY Time_24h, Time_12h;

-- 5. Seasonality

-- number of delays per month for 2023
SELECT
	-- month number
	MONTH(Date) AS Month_Num,
  -- month name
  MONTHNAME(Date) AS Month_Name,
  -- number of delays
	COUNT(*) AS N_Delays,
  -- create histogram
	-- divide counts by 100 for better visualization
	RPAD('', COUNT(*)/100, '*') AS 'Count (* = 100)'
FROM delays_2023
-- group by month number then month name
GROUP BY Month_Num, Month_Name
-- order by descending month number
ORDER BY Month_Num ASC;

-- 6. Determine whether the occurence of delays appears to be improving.

-- change in total delay times between 2022 and 2023
SELECT
	-- number stations by descreasing number of delays
	ROW_NUMBER() OVER(ORDER BY SUM(d23.Min_Delay) DESC) AS ID,
  -- station name
  d22.Station,
  -- line name
  d22.Line,
  -- line number
  -- use CASE to identify Lines
	CASE
	  WHEN d22.Line = 'YU' THEN 'Line 1'
	  WHEN d22.Line = 'BD' THEN 'Line 2'
	  WHEN d22.Line = 'SHP' THEN 'Line 4'
	-- name new column Line_Num
  END AS Line_Num,
  -- total delays in minutes
  SUM(d22.Min_Delay) AS Sum_Delays_2022,
  SUM(d23.Min_Delay) AS Sum_Delays_2023,
  -- ratio of delay between 2023 and 2022
  CONCAT(ROUND((SUM(d23.Min_Delay)-SUM(d22.Min_Delay))/SUM(d22.Min_Delay)*100,0),'%')
    AS Delay_Change
FROM delays_2022 d22
-- join 2022 and 2023 tables by station
INNER JOIN delays_2023 d23
ON d22.Station = d23.Station
-- group results by station, line name, then line number
GROUP BY d22.Station, Line, Line_Num
-- order by total delay time
ORDER BY SUM(d23.Min_Delay) DESC;
