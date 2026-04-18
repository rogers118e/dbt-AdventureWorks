{{
    config(
        materialized = 'table'
    )
}}
select 
order_date as date,
count(distinct order_id) as orders,
sum(quantity) as units,
sum(total_item_price) as total_sales,
sum(cogs) as total_cogs,
sum(total_item_price) - sum(cogs) as gross_margin
from
{{ref('int_orders_enriched')}}
group by 1