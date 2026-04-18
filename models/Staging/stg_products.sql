{{
    config(
        materialized ='table'
    )
}}
select
cast(ProductKey as string) product_id,	
cast(ProductSubcategoryKey as string) product_sub_id,	
ProductSKU as SKU,	
ProductName	,	
ModelName	,	
ProductDescription	,	
ProductColor	,	
ProductSize	,	
ProductStyle	,	
ProductCost,
ProductPrice	
from 
{{source('raw','AdventureWorks_Products')}}