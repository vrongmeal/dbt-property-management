with

    source as (select * from {{ source("property_management", "units") }}),

    renamed as (

        select
            id as unit_id,
            created_at as unit_created_at,
            rent as unit_rent,
            property_id,
            name as unit_name,
            bedrooms as unit_bedrooms,
            bathrooms as unit_bathrooms,
            square_feet as unit_square_feet,
            status as unit_status,
            address_1,
            address_2,
            city,
            state,
            zip_code,
            uploaded_at

        from source

    )

select *
from renamed
