-- ============================================================
-- Project: Cyclistic Bike-Share Analysis
-- File: 03_monthly_seasonal_patterns.sql
-- Purpose: Compare monthly ride volumes and rider-group shares.
-- ============================================================

USE cyclistic_analysis;

-- Monthly ride counts and each group's percentage of that month.
SELECT
    YEAR(ride_date) AS ride_year,
    MONTH(ride_date) AS ride_month,
    ride_month_name,
    member_casual,
    COUNT(*) AS number_of_rides,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (
            PARTITION BY YEAR(ride_date), MONTH(ride_date)
        ),
        2
    ) AS percentage_within_month
FROM cyclistic_rides
GROUP BY
    YEAR(ride_date),
    MONTH(ride_date),
    ride_month_name,
    member_casual
ORDER BY
    ride_year,
    ride_month,
    member_casual;
