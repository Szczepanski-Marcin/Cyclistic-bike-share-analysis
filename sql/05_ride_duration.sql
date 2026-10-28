-- ============================================================
-- Project: Cyclistic Bike-Share Analysis
-- File: 05_ride_duration.sql
-- Purpose: Compare ride duration statistics by rider group.
-- ============================================================

USE cyclistic_analysis;


-- 1. Summary statistics for ride duration.
SELECT
    member_casual,
    COUNT(*) AS number_of_rides,
    ROUND(AVG(ride_duration_minutes), 2) AS average_duration_minutes,
    ROUND(MIN(ride_duration_minutes), 2) AS minimum_duration_minutes,
    ROUND(MAX(ride_duration_minutes), 2) AS maximum_duration_minutes
FROM cyclistic_rides
GROUP BY member_casual
ORDER BY member_casual;


-- 2. Median ride duration by rider group.
-- For an even number of rides, the median is the average
-- of the two middle duration values.
WITH ranked_rides AS (
    SELECT
        member_casual,
        ride_duration_minutes,
        ROW_NUMBER() OVER (
            PARTITION BY member_casual
            ORDER BY ride_duration_minutes
        ) AS row_num,
        COUNT(*) OVER (
            PARTITION BY member_casual
        ) AS total_rows
    FROM cyclistic_rides
    WHERE ride_duration_minutes IS NOT NULL
)
SELECT
    member_casual,
    ROUND(AVG(ride_duration_minutes), 2) AS median_duration_minutes
FROM ranked_rides
WHERE row_num IN (
    FLOOR((total_rows + 1) / 2),
    FLOOR((total_rows + 2) / 2)
)
GROUP BY member_casual
ORDER BY member_casual;
