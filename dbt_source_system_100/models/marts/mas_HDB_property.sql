
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='incremental') }}

with mart_data as (

    select *
	from {{source("PUBLIC","int_HDB_property")}}

)

select *
from mart_data

{% if is_incremental() %}

  where PROCESSED_DATE > (select max(PROCESSED_DATE) from {{ this }})

{% endif %}

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
