SELECT
    *
{# FROM dbt_project.source.dim_date #}
FROM
    {{ source('source', 'dim_date') }}