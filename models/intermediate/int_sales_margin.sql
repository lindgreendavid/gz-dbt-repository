-- models/intermediate/int_sales_margin.sql

with sales_data as (
    select
        orders_id,
        date_date,
        pdt_id,
        quantity,
        revenue
    from {{ ref('stg_raw__sales') }}
),

product_data as (
    select
        products_id as pdt_id,
        Cast(purchase_price AS FLOAT64) as purchase_price
    from {{ ref('stg_raw__product') }}
)

select
    s.orders_id,
    s.pdt_id,
    s.date_date,
    s.quantity,
    s.revenue,
    p.purchase_price,
    (s.quantity * p.purchase_price) as purchase_cost,
    s.revenue - (s.quantity * p.purchase_price) as margin
from sales_data s
join product_data p
on s.pdt_id = p.pdt_id
