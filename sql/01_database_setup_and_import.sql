-- ============================================================
-- Project: Cyclistic Bike-Share Analysis
-- File: 01_database_setup_and_import.sql
-- Purpose: Create the database and table, then import the
--          cleaned CSV dataset.
--
-- IMPORTANT:
-- 1. Run the table-creation section only if the table does
--    not already exist.
-- 2. Import the CSV only once into an empty table.
-- 3. Update the CSV path for your own computer.
-- 4. LOCAL INFILE loading must be enabled in MySQL.
-- ============================================================

-- Create and select the project database.
CREATE DATABASE IF NOT EXISTS cyclistic_analysis;

USE cyclistic_analysis;


-- ============================================================
-- SECTION 1: Create the destination table
-- Run this section only if cyclistic_rides does not exist.
-- ============================================================

CREATE TABLE cyclistic_rides (
    ride_id VARCHAR(50),
    rideable_type VARCHAR(30),
    started_at DATETIME(6),
    ended_at DATETIME(6),
    start_station_name VARCHAR(255),
    start_station_id VARCHAR(100),
    end_station_name VARCHAR(255),
    end_station_id VARCHAR(100),
    start_lat DOUBLE,
    start_lng DOUBLE,
    end_lat DOUBLE,
    end_lng DOUBLE,
    member_casual VARCHAR(20),
    ride_duration_seconds DOUBLE,
    ride_duration_minutes DOUBLE,
    ride_duration_hours DOUBLE,
    ride_date DATE,
    ride_month INT,
    ride_month_name VARCHAR(20),
    ride_weekday VARCHAR(20),
    ride_hour INT,
    ride_season VARCHAR(20)
);

-- Inspect the table structure.
DESCRIBE cyclistic_rides;


-- ============================================================
-- SECTION 2: Import the cleaned CSV
-- Run this section only when the destination table is empty.
-- Re-running it can insert duplicate records.
-- ============================================================

LOAD DATA LOCAL INFILE
    '... .csv'
INTO TABLE cyclistic_rides
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
    ride_id,
    rideable_type,
    started_at,
    ended_at,
    start_station_name,
    start_station_id,
    end_station_name,
    end_station_id,
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    member_casual,
    ride_duration_seconds,
    ride_duration_minutes,
    ride_duration_hours,
    ride_date,
    ride_month,
    ride_month_name,
    ride_weekday,
    ride_hour,
    ride_season
);