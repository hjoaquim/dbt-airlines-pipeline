with airlines as (
    select * from {{ ref('stg_airlines') }}
)

select
    airline_code,
    airline_name
from airlines
