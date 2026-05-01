with

    source as (

        select * from {{ source("property_management", "rental_applications") }}

    ),

    renamed as (

        select
            id as rental_application_id,
            created_at as rental_application_created_at,
            deleted_at as rental_application_deleted_at,
            status as rental_application_status,
            contact_info_id,
            uploaded_at as rental_application_uploaded_at

        from source

    )

select *
from renamed
