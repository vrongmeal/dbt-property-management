select *
from {{ ref("stg_property_management__units") }}
where unit_rent <= 0
