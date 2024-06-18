-- models/intermediate/int_operational_margin.sql

with sales_margin as (
    select
        orders_id,
        date_date,
        revenue,
        quantity,
        purchase_cost,
        margin
    from {{ ref('int_sales_margin') }}
)
,
shipping_data as (
select
    orders_id,
    shipping_fee,
    logcost,
    ship_cost
from {{ ref('stg_raw__ship') }}
)

select
    s.orders_id,
    s.date_date,
    s.revenue,
    s.quantity,
    s.purchase_cost,
    s.margin,
    sh.shipping_fee,
    sh.logcost,
    sh.ship_cost,
    s.margin + sh.shipping_fee - sh.logcost - sh.ship_cost as operational_margin
from sales_margin s
join shipping_data sh
on s.orders_id = sh.orders_id
