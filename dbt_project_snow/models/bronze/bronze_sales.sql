{{ config(materialized='table') }}

SELECT 
    *
{# FROM dbt_project.source.fact_sales #}
FROM 
    {{ source('source', 'fact_sales') }}