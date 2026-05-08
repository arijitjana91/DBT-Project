SELECT
    *
{# FROM dbt_project.source.dim_store #}
FROM
    {{ source('source', 'dim_store') }}