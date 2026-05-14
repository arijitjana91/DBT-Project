WITH dedup_query AS (
SELECT
    *,
    ROW_NUMBER() OVER(PARTITION BY item_id ORDER BY update_date DESC) AS row_num
FROM
    {{ source('source', 'item') }}
)

SELECT
    item_id,
    item_name,
    item_category,
    item_price,
    update_date
FROM
    dedup_query
WHERE
    row_num = 1