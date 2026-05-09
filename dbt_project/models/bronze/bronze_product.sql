SELECT
    *
{# FROM dbt_project.source.dim_product #}
FROM
    {{ source('source', 'dim_product') }}