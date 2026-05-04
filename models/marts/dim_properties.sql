with

    properties as (select * from {{ ref("stg_property_management__properties") }}),

    units as (select * from {{ ref("stg_property_management__units") }}),

    joined as (

        select
            units.unit_id,
            units.unit_created_at,
            units.unit_name,
            units.unit_bedrooms,
            units.unit_bathrooms,
            units.unit_square_feet,
            units.unit_rent,
            units.unit_status,
            units.address_1 as unit_address_1,
            units.address_2 as unit_address_2,
            units.city as unit_city,
            units.state as unit_state,
            units.zip_code as unit_zip_code,
            properties.property_id,
            properties.property_name,
            properties.property_address,
            properties.property_city,
            properties.property_state,
            properties.property_zip_code,
            properties.property_type,
            properties.property_year_built

        from units
        left join properties on units.property_id = properties.property_id

    )

select *
from joined
