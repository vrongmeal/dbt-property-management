with

    leases as (select * from {{ ref("stg_property_management__leases") }}),

    units as (select * from {{ ref("stg_property_management__units") }}),

    rental_applications as (
        select * from {{ ref("stg_property_management__rental_applications") }}
    ),

    joined as (

        select
            leases.lease_id,
            leases.lease_created_at,
            leases.lease_start_date,
            leases.lease_end_date,
            datediff('day', leases.lease_start_date, leases.lease_end_date)
                as lease_duration_days,
            leases.lease_completed,
            units.unit_id,
            units.property_id,
            units.unit_rent,
            rental_applications.rental_application_id,
            rental_applications.rental_application_status

        from leases
        left join units on leases.unit_id = units.unit_id
        left join rental_applications
            on leases.rental_application_id
            = rental_applications.rental_application_id

    )

select *
from joined
