WITH base_data AS (
    SELECT 
        date_date,
        orders_id,
        revenue,
        margin,
        operational_margin
    FROM 
        {{ ref('int_orders_operational') }}
),

-- Aggregating data by date_date
aggregated_data AS (
    SELECT
        date_date,
        COUNT(orders_id) AS nb_transactions,
        ROUND(SUM(revenue),2) AS total_revenue,
        ROUND(AVG(revenue),2) AS average_basket,
        ROUND(SUM(margin),2) AS total_margin,
        ROUND(SUM(operational_margin),2) AS total_operational_margin
    FROM 
        base_data
    GROUP BY
        date_date
)

SELECT
    *
FROM aggregated_data