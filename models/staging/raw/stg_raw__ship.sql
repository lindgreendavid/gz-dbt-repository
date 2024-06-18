with source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
        orders_id,
        cast(shipping_fee as float64) as shipping_fee,
        cast(logcost as float64) as logcost,
        cast(ship_cost as float64) as ship_cost
    from source

)

select * from renamed
