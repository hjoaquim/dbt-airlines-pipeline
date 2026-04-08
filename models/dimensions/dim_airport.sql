with airports as (
    select * from {{ ref('stg_airports') }}
)

select
    iata_code,
    airport_name,
    city,
    stat,
    country,
    country2
from airports
