-- This test ensures the flight count per day falls within a reasonable range.
-- Fewer than 10 or more than 10,000 flights per day suggests a data load issue.

with daily_counts as (
    select
        flight_date,
        count(*) as flight_count
    from {{ ref('fact_flights') }}
    group by flight_date
)

select
    flight_date,
    flight_count
from daily_counts
where
    flight_count < 10
    or flight_count > 10000
