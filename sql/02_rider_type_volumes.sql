-- ============================================================
-- Project: Cyclistic Bike-Share Analysis
-- File: 02_rider_type_volumes.sql
-- Purpose: Compare ride volumes for casual riders and members.
-- ============================================================

USE cyclistic_analysis;

-- Compare the number and percentage of rides by rider group.
SELECT
    member_casual,
    COUNT(*) AS number_of_rides,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage_of_rides
FROM cyclistic_rides
GROUP BY member_casual
ORDER BY member_casual;
