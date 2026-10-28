-- ============================================================
-- Project: Cyclistic Bike-Share Analysis
-- File: 07_top_stations.sql
-- Purpose: Identify the most frequently used starting and
--          ending stations for casual riders and members.
-- Note: Records without a station ID or usable station name
--       are excluded from station-level results.
-- ============================================================

USE cyclistic_analysis;


-- 1. Top 10 starting stations: casual riders.
SELECT
    start_station_id,
    start_station_name,
    COUNT(*) AS number_of_rides
FROM cyclistic_rides
WHERE member_casual = 'casual'
  AND start_station_id IS NOT NULL
  AND start_station_name IS NOT NULL
  AND TRIM(start_station_name) <> ''
GROUP BY
    start_station_id,
    start_station_name
ORDER BY
    number_of_rides DESC
LIMIT 10;


-- 2. Top 10 starting stations: annual members.
SELECT
    start_station_id,
    start_station_name,
    COUNT(*) AS number_of_rides
FROM cyclistic_rides
WHERE member_casual = 'member'
  AND start_station_id IS NOT NULL
  AND start_station_name IS NOT NULL
  AND TRIM(start_station_name) <> ''
GROUP BY
    start_station_id,
    start_station_name
ORDER BY
    number_of_rides DESC
LIMIT 10;


-- 3. Top 10 ending stations: casual riders.
SELECT
    end_station_id,
    end_station_name,
    COUNT(*) AS number_of_rides
FROM cyclistic_rides
WHERE member_casual = 'casual'
  AND end_station_id IS NOT NULL
  AND end_station_name IS NOT NULL
  AND TRIM(end_station_name) <> ''
GROUP BY
    end_station_id,
    end_station_name
ORDER BY
    number_of_rides DESC
LIMIT 10;


-- 4. Top 10 ending stations: annual members.
SELECT
    end_station_id,
    end_station_name,
    COUNT(*) AS number_of_rides
FROM cyclistic_rides
WHERE member_casual = 'member'
  AND end_station_id IS NOT NULL
  AND end_station_name IS NOT NULL
  AND TRIM(end_station_name) <> ''
GROUP BY
    end_station_id,
    end_station_name
ORDER BY
    number_of_rides DESC
LIMIT 10;