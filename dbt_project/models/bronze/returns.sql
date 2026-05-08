SELECT
    *
{# FROM dbt_project.source.fact_returns #}
FROM
    {{ source('source', 'fact_returns') }}