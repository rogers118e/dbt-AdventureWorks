{{
    config(
        materialized = 'table'
    )
}}
select 
customer_name,
customer_gender, 
occupation,
count(distinct order_id) as total_orders,
sum(quantity) as total_units_bought,
sum(total_item_price) as total_sales,
sum(total_item_price) - sum(cogs) as gross_margin
from 
{{ref('int_orders_enriched')}}
group by 1,2,3