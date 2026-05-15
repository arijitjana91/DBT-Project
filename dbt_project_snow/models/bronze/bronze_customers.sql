{{ config(
    materialized='incremental',
    unique_key='customer_sk',
    incremental_strategy='merge'
) }}

SELECT
    *
{# FROM dbt_project.source.dim_customer #}
FROM
    {{ source('source', 'dim_customer') }}

{% if is_incremental() %}

WHERE signup_date >
(
    SELECT COALESCE(MAX(signup_date), CURRENT_DATE() - INTERVAL '1 day')
    FROM {{ this }}
)

{% endif %}