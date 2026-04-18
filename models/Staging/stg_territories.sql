{{
    config(
        materialized = 'table'
    )
}}

select
cast(SalesTerritoryKey as string) territory_key	,
Region,
Country,
Continent
from
{{source('raw','AdventureWorks_Territories')}}