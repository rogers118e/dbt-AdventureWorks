{{
    config(
        materialized = 'table'
        
    )
}}

Select 

CustomerKey	as customer_id,
coalesce(Prefix, 'N/A') as prefix,
FirstName,
LastName,
BirthDate,
MaritalStatus,
Gender,
EmailAddress as email,
AnnualIncome,
TotalChildren,
EducationLevel,
Occupation ,
HomeOwner	
from 
`food-hungama.raw_dataset.AdventureWorks_Customers`
qualify row_number() over(partition by CustomerKey)=1