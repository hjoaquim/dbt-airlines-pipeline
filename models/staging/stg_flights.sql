-- Staging model for individual flight records.
-- Selects scheduling, delay, distance, and cancellation fields
-- from the raw flights source for use in the fact table.

with source as (
    select * from {{ source('airlines_raw', 'flights') }}
),

renamed as (
    select
        flight_id,
        flight_date,
        airline_code,
        flight_number,
        origin_airport,
        destination_airport,
        scheduled_departure,
        actual_departure,
        departure_delay,
        scheduled_arrival,
        actual_arrival,
        arrival_delay,
        distance,
        cancelled,
        cancellation_reason
    from source
)

select * from renamed
