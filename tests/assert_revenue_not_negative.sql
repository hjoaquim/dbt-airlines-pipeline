-- This test ensures that no flight records have negative distance values,
-- which would indicate a data quality issue in the source system.

select
    flight_id,
    distance
from {{ ref('fact_flights') }}
where distance < 0
