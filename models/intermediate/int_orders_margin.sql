-- models/intermediate/int_sales_margin.sql

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

select
    orders_id,
    min(date_date) as date_date,
    round(sum(revenue),2) as revenue,
    sum(quantity) as quantity,
    round(sum(purchase_cost),2) as purchase_cost,
    round(sum(margin),2) as margin
from sales_margin
group by orders_id
