with source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
        orders_id,
        logcost,
        ship_cost,
        shipping_fee
    from source

)

select * from renamed
