with 

source as (

    select * from {{ source('raw', 'sales') }}

),

renamed as (

    select *

    from source

)

select * from renamed;

with raw_data as (

    select
        orders_id,
        date_date,
        pdt_id,
        quantity,
        revenue
    from
        {{ source('raw', 'sales') }}

), cleaned_data as (

    select
        orders_id,
        date_date,
        pdt_id AS products_id,
        quantity,
        revenue
    from
        raw_data

)

select
    *
from
    cleaned_data
