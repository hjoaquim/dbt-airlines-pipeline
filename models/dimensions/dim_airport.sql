with airports as (
    select * from {{ ref('stg_airports') }}
)

SELECT 
    iata_code,
    airport_name,
    city,
    state,
    country
from airports
