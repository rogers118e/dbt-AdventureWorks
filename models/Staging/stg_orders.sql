{{
    config(
        materialized ='table'
    )
}}

select 
SAFE.PARSE_DATE('%m/%d/%Y', OrderDate) as order_date,
SAFE.PARSE_DATE('%m/%d/%Y', StockDate) as stock_date,
cast(OrderNumber	as string) as order_id,
cast(ProductKey as string)	as product_id,
cast(CustomerKey as string) as customer_id,
cast(TerritoryKey as string) as	Territory_id,	
cast(OrderLineItem as string) as order_line_item_id,
cast(OrderQuantity as int64) as quantity
from {{source('raw', 'AdventureWorks_Sales')}}
--qualify row_number() over(partition by OrderNumber) = 1

