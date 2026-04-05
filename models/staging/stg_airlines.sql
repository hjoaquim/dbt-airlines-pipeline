-- Staging model for airline carrier reference data.
-- Renames iata_code to airline_code for clarity
-- and provides a clean interface for downstream dimension models.

with source as (
    select * from {{ source('airlines_raw', 'airlines') }}
),

renamed as (
    select
        iata_code as airline_code,
        airline_name
    from source
)

select * from renamed
