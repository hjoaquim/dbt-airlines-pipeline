with flights as (
    select * from {{ ref('stg_flights') }}
),

airlines as (
    select * from {{ ref('dim_airline') }}
),

origin as (
    select * from {{ ref('dim_airport') }}
),

destination as (
    select * from {{ ref('dim_airport') }}
)

select
    f.flight_id,
    f.flight_date,
    f.airline_code,
    a.airline_name,
    f.flight_number,
    f.origin_airport,
    o.airport_name as origin_airport_name,
    o.city as origin_city,
    o.state as origin_state,
    f.destination_airport,
    d.airport_name as destination_airport_name,
    d.city as destination_city,
    d.state as destination_state,
    f.scheduled_departure,
    f.actual_departure,
    f.departure_delay,
    f.scheduled_arrival,
    f.actual_arrival,
    f.arrival_delay,
    f.distance,
    f.cancelled,
    f.cancellation_reason
from flights as f
left join airlines as a on f.airline_code = a.airline_code
left join origin as o on f.origin_airport = o.iata_code
left join destination as d on f.destination_airport = d.iata_code
