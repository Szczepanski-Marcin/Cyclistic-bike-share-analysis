# Cyclistic: Bike-Share User Behaviour Analysis

## Project Overview

This project analyses bike-share ride data to understand how **casual riders and annual members use Cyclistic differently**. The goal is to identify behavioural patterns that could help the marketing team develop and test strategies to convert casual riders into annual members.

The analysis uses Python for data preparation and exploratory analysis, SQL for querying and summarising results, and Tableau for interactive visualisation.

## Business Objective

Identify meaningful differences between casual riders and annual members and use the evidence to recommend testable marketing opportunities for increasing annual memberships.

### Target Audience

Cyclistic's marketing team and business decision-makers.

### Research Questions

1. How do ride volumes differ between casual riders and annual members?
2. How do riding patterns vary by month, season, weekday, and hour?
3. How do ride durations differ between the two groups?
4. Do the groups show different preferences for electric and classic bikes?
5. Which starting and ending stations are most frequently used by each group?
6. How can these differences inform potential membership-conversion strategies?

## Data Source and Scope

**Source:** [Divvy Trip Data — Official Data Archive](https://divvy-tripdata.s3.amazonaws.com/index.html)

The project uses monthly trip-data files covering **October 1, 2025, through September 30, 2026**, inclusive.

- **Unit of analysis:** One recorded ride.
- **Main comparison:** Casual riders versus annual members.
- **Rider classification:** `member_casual`.
- **Tools:** Python, pandas, NumPy, Matplotlib, Seaborn, SQL, and Tableau.
- **Analysis period:** Rides with start timestamps on or after October 1, 2025, and before October 1, 2026.

The analysis describes recorded ride activity. Ride counts should not be interpreted as counts of unique customers.

## Project Workflow

1. Download the monthly source archives directly from the official data archive.
2. Load and combine the monthly CSV files in Python.
3. Inspect dataset dimensions, column types, missing values, and date coverage.
4. Identify and remove exact duplicate records.
5. Calculate ride durations and apply documented data-quality rules.
6. Filter rides to the target analysis period.
7. Examine missing station information.
8. Create date and time features for analysis.
9. Export the cleaned dataset for subsequent analysis.
10. Conduct exploratory data analysis in Python.
11. Query and summarise ride behaviour using SQL.
12. Build an interactive Tableau dashboard.
13. Interpret the findings and develop evidence-based recommendations.

## Data Cleaning and Preparation

The combined source dataset contained **6,171,785 rows and 13 columns** before duplicate removal and subsequent cleaning.

### Duplicate Records

A total of **35 exact duplicate rows** were removed. Duplicate ride IDs were also checked separately as part of the data-quality assessment.

### Ride Duration Filtering

Ride duration was calculated as the difference between the recorded end and start timestamps.

The following records were excluded:

- **Negative durations:** Removed because the recorded end time occurred before the start time.
- **Rides shorter than one minute:** Excluded to reduce the influence of extremely short trips that could represent test rides, recording errors, or other atypical activity.
- **Rides longer than 24 hours:** Excluded because they may represent unusual trips or recording errors rather than typical bike-share usage.

Rides lasting **exactly 24 hours were retained**.

These thresholds are data-cleaning decisions intended to improve consistency. The available data does not establish why each unusually short or long ride occurred, so some excluded rides may have been genuine trips. The filtering choices may affect the results and should be considered when interpreting the findings.

### Analysis Period

Only rides starting on or after October 1, 2025, and before October 1, 2026, were retained.

### Missing Station Information

Station names, station IDs, and some coordinates were missing for a substantial proportion of rides.

Rides with missing station information were retained for analyses that did not require those fields. Station-level analyses used records with the necessary station information available.

This approach avoids unnecessarily removing rides from unrelated analyses while acknowledging that missing station data may affect station-level findings.

### Final Dataset

The final cleaned dataset contained **6,007,154 rows and 22 columns**.

| Validation item | Result |
|---|---:|
| Final rows | 6,007,154 |
| Final columns | 22 |
| Duplicate ride IDs | 0 |
| Missing start timestamps | 0 |
| Missing end timestamps | 0 |
| Negative durations remaining | 0 |
| Durations under one minute remaining | 0 |
| Durations over 24 hours remaining | 0 |
| Rides outside the target period | 0 |

The cleaned dataset was exported to CSV for use in SQL analysis and Tableau. The in-memory dataset and exported CSV were checked for matching dimensions and column names.

## Key Findings

### 1. Rider Group Distribution

| Rider group | Rides | Share |
|---|---:|---:|
| Annual members | 3,896,850 | 64.87% |
| Casual riders | 2,110,304 | 35.13% |
| **Total** | **6,007,154** | **100.00%** |

Annual members accounted for approximately two-thirds of recorded rides, while casual riders accounted for just over one-third.

These figures represent rides, not unique individuals.

### 2. Seasonal Patterns

| Season | Casual rides (% of casual total) | Member rides (% of member total) |
|---|---:|---:|
| Winter | 4.31% | 9.66% |
| Spring | 21.22% | 23.91% |
| Summer | 46.36% | 37.35% |
| Autumn | 28.11% | 29.08% |

Casual rides had a stronger summer concentration: **46.36% of casual rides occurred in summer**, compared with 37.35% of member rides. This is a difference of 9.01 percentage points.

This is a descriptive difference; the dataset does not establish why it occurs.

### 3. Weekday and Weekend Patterns

| Day | Casual rides (%) | Member rides (%) |
|---|---:|---:|
| Monday | 11.51% | 13.96% |
| Tuesday | 11.45% | 16.11% |
| Wednesday | 11.69% | 16.20% |
| Thursday | 12.47% | 15.78% |
| Friday | 15.69% | 14.69% |
| Saturday | 21.19% | 12.76% |
| Sunday | 16.00% | 10.50% |

Weekend rides accounted for **37.19% of casual rides** and **23.26% of member rides**, a difference of 13.93 percentage points.

Casual rides were more concentrated on Saturdays and Sundays, while member rides had a stronger weekday pattern.

This difference suggests an opportunity to test weekend-focused membership messaging, although the data does not establish individual rider habits or trip purposes.

### 4. Hourly Patterns

Both rider groups recorded their largest share of rides at approximately **5 p.m.** Members showed a stronger morning pattern around typical commuting hours, particularly between 6 a.m. and 9 a.m.

The observed pattern is consistent with different usage schedules, but the dataset does not record trip purpose and therefore cannot confirm that rides were for commuting.

### 5. Ride Duration

| Measure | Casual riders | Annual members |
|---|---:|---:|
| Mean duration | 18.17 minutes | 12.17 minutes |
| Median duration | 11.14 minutes | 8.69 minutes |

Casual rides had a median duration approximately **28.2% longer** than member rides.

Ride durations were right-skewed, meaning that a relatively small number of longer rides influenced the mean. The median is therefore useful for comparing typical ride duration.

For readability, some distribution charts display rides of 60 minutes or less. This visualisation limit does not further filter the main cleaned dataset.

### 6. Bike-Type Usage

| Bike type | Casual rides (% of casual total) | Member rides (% of member total) |
|---|---:|---:|
| Classic bike | 25.80% | 31.68% |
| Electric bike | 74.20% | 68.32% |

Electric bikes accounted for a larger share of casual rides. The difference in electric-bike share was **5.88 percentage points**.

This identifies a difference in observed bike usage, not the reason behind that difference. The data alone cannot establish whether the pattern reflects preferences, availability, trip characteristics, pricing, or other factors.

### 7. Station Usage

The station analysis compares frequently used starting and ending stations across rider groups. The results show differences in station usage patterns.

However, station information is missing for roughly one-fifth of rides, so station-level results should be interpreted with caution. The findings describe recorded station usage and do not establish whether trips were for tourism, leisure, commuting, or another purpose.

## Business Recommendations

The findings suggest several hypotheses for the marketing team to test. These recommendations are proposed opportunities, not proven ways to increase membership conversion.

### 1. Test Weekend-Focused Membership Messaging

**Evidence:** Weekend rides represented 37.19% of casual rides, compared with 23.26% of member rides.

**Potential action:** Test membership messaging that highlights the value of membership for people who ride frequently on weekends.

**How to evaluate:** Compare membership conversion rates between an exposed group and a suitable control group. Also assess acquisition costs and subsequent member retention.

### 2. Test Seasonal Membership Campaigns

**Evidence:** Casual rides had a stronger summer concentration than member rides.

**Potential action:** Test summer-focused membership offers or messaging aimed at casual riders who may benefit from membership.

**How to evaluate:** Compare conversion rates between campaign and control groups, while accounting for campaign costs and subsequent membership retention.

### 3. Tailor Messaging to Observed Usage Patterns

**Evidence:** Casual and member rides differ in hourly patterns, median duration, and bike-type usage.

**Potential action:** Test different messages for relevant usage segments, provided additional data can identify those segments reliably. Messaging about electric-bike access or value should reflect the actual membership terms and pricing.

**How to evaluate:** Compare conversion and retention outcomes across campaign variants rather than relying only on engagement or ride counts.

### Important Qualification

These are **testable hypotheses, not proven conversion strategies**. The current trip dataset does not contain campaign exposure, customer-level membership transitions, or conversion outcomes. It cannot show that any recommendation will cause an increase in memberships.

Controlled experiments linked to campaign and conversion data would be needed to evaluate effectiveness. Retention and incremental acquisition costs would also help determine whether any resulting conversions deliver business value.

## Tools and Deliverables

### Python

Python was used for:

- Downloading and loading monthly source archives.
- Combining the monthly trip-data files.
- Inspecting data quality and cleaning the dataset.
- Calculating ride duration and creating date and time features.
- Conducting exploratory data analysis and visualisation.
- Exporting the cleaned dataset.

**Main libraries:** pandas, NumPy, Matplotlib, and Seaborn.

### SQL

SQL was used to summarise ride behaviour and support the business analysis, including:

- Ride volumes by rider group.
- Monthly and seasonal patterns.
- Weekday and hourly patterns.
- Ride duration.
- Bike-type usage.
- Frequently used starting and ending stations.

The SQL work was conducted in MySQL Workbench using the `cyclistic_analysis` database and the `cyclistic_rides` table.

SQL scripts are organised in the project's `sql/` directory.

### Tableau

Tableau was used to present interactive comparisons of rider behaviour, including ride volumes, temporal patterns, ride duration, bike types, and station usage. The dashboard includes filters that allow users to explore selected dimensions of the data.

**Published dashboard:** [View the Cyclistic Tableau dashboard](https://public.tableau.com/app/profile/marcin.szczepa.ski1297/viz/Cyclistic_Ride_Behaviour_2026/Cyclistic)

### Project Files

The project includes the analysis notebook, SQL scripts, and cleaned dataset used for the subsequent analysis and dashboard. The raw monthly source archives can be obtained from the [official Divvy Trip Data archive](https://divvy-tripdata.s3.amazonaws.com/index.html).

## Limitations

- Each row represents a ride, not a unique person.
- The data does not identify why a ride occurred or why a rider chose a particular membership type.
- Campaign exposure, customer-level conversion, and retention outcomes are not available.
- Station fields are missing for a substantial share of rides, which may affect station-level comparisons.
- Duration thresholds exclude some genuine trips potentially captured by the source system.
- Weather, holidays, tourism, daylight, pricing, and bike availability were not evaluated as explanatory factors.
- The findings are descriptive and do not establish causation.
- Results describe the selected 12-month period and may not generalise to other periods.

These limitations should be considered when interpreting the findings and planning marketing experiments.

## Reproducibility and Validation

The workflow uses the official monthly trip-data archives and documents the main data preparation and analysis steps.

The notebook includes checks of:

- Dataset dimensions and column names.
- Duplicate records and ride IDs.
- Timestamp and ride-duration quality.
- The selected analysis period.
- Rider-group and bike-type counts.
- The dimensions and column names of the in-memory dataset and exported CSV.

The cleaned CSV is used for the corresponding SQL analysis and Tableau dashboard. The project also includes SQL scripts for the principal business questions.

To reproduce the analysis, obtain the source data from the official archive and follow the notebook's execution order. The SQL import script currently uses a local file path that must be adjusted for another computer. Python dependencies, MySQL configuration, and Tableau access may also require environment-specific setup.

## Conclusion

The analysis identifies clear differences between casual riders and annual members in seasonal concentration, weekend activity, hourly patterns, ride duration, and bike-type usage.

The strongest practical opportunities to investigate are weekend-focused and seasonal membership campaigns. Differences in hourly patterns, duration, and bike-type usage may also help inform future messaging experiments.

These opportunities should be tested with customer-level campaign and conversion data before being treated as effective strategies. The analysis provides a descriptive evidence base for deciding what to test next, rather than proof that a particular marketing intervention will increase annual memberships.