with

source as (

    select * from {{ source('ecom', 'raw_pricing_periods') }}

),

renamed as (

    select

        ----------  ids
        pricing_period_id,

        ---------- text
        period_name,

        ---------- numerics
        base_price_multiplier,
        discount_pct,

        ---------- timestamps
        effective_start_date::date as effective_start_date,
        effective_end_date::date as effective_end_date

    from source

)

select * from renamed
