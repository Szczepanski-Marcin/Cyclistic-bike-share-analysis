-- Hourly ride counts and percentages

SELECT
    ride_hour,
    member_casual,
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
    ride_hour,
    member_casual
ORDER BY
    ride_hour,
    member_casual;