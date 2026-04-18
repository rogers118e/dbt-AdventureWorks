{{
    config(
        materialized = 'table'
    )
}}

Select
order_date,
stock_date,	
order_id,
a.product_id product_id,
b.sku as sku,
b.ProductName as product_name,
b.ProductSize as product_size,
b.ModelName as model_name,
b.ProductColor as product_color,
a.customer_id customer_id,
concat(c.FirstName,' ',c.LastName) as customer_name,
c.gender as customer_gender,
c.Occupation as occupation,
a.Territory_id as territory_id,
d.country,
d.region,
d.continent,
quantity,
quantity*b.ProductCost as cogs,
quantity*b.ProductPrice as total_item_price
from 
{{ref('stg_orders')}} a
left join 
{{ref('stg_products')}} b
on a.product_id = b.product_id
left join 
{{ref('stg_customers')}} c
on a.customer_id = cast(c.customer_id as string)
left join 
{{ref('stg_territories')}} d
on a.territory_id = d.territory_key