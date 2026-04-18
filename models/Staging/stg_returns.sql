{{
    config(
        materialized = 'table'
    )
}}

select
safe.parse_date('%m/%d/%y', ReturnDate) as return_date,	
cast(TerritoryKey as string) as territory_key,
cast(ProductKey as string)	as product_id,
cast(ReturnQuantity as int64) as return_quantity
from 
{{source('raw', 'AdventureWorks_Returns')}}