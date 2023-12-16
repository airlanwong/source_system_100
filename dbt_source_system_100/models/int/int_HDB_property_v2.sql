
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with int_layer as (

    select *,
	'Alan' as CREATED_BY,
	'Alan' as UPDATED_BY,
	getdate() as PROCESSED_DATE,
	getdate() as UPDATED_DATE,
	'HDB_DATA' as SOURCE_DATA,
	'FALSE' as DELETE_FLAG
	from {{ref("stg_HDB_property")}}

)

select *
from int_layer


-- where id is not null
