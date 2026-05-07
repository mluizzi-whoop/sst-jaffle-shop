with

pricing_periods as (

    select * from {{ ref('stg_pricing_periods') }}

)

select * from pricing_periods
