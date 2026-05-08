SELECT
    *
{# FROM dbt_project.source.dim_customer #}
FROM
    {{ source('source', 'dim_customer') }}