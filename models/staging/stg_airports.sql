-- Staging model for airport reference data.
-- Selects and renames columns from the raw airports source
-- to provide a clean, consistent interface for downstream models.

with source as (
    select * from {{ source('airlines_raw', 'airports') }}
),

renamed as (
    select
        iata_code,
        airport_name,
        city,
        state,
        country,
        latitude,
        longitude
    from source
)

select * from renamed
