-- ============================================================
-- Project: Cyclistic Bike-Share Analysis
-- File: 06_bike_type_preferences.sql
-- Purpose: Compare bike-type usage within each rider group.
-- ============================================================

USE cyclistic_analysis;

-- Ride counts and bike-type percentages by rider group.
SELECT
    member_casual,
    rideable_type,
    COUNT(*) AS number_of_rides,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (
            PARTITION BY member_casual
        ),
        2
    ) AS percentage_within_rider_type
FROM cyclistic_rides
GROUP BY
    member_casual,
    rideable_type
ORDER BY
    member_casual,
    rideable_type;
