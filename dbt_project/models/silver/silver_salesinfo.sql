WITH bronze_sales_cte AS(
    SELECT
        sales_id,
        product_sk,
        customer_sk,
        {{ multiply('unit_price', 'quantity') }} AS calculated_gross_amount,
        gross_amount,
        payment_method
    FROM
        {{ ref('bronze_sales') }}
),

bronze_products_cte AS(
    SELECT
        product_sk,
        product_name,
        category
    FROM
        {{ ref('bronze_product') }}
),

bronze_customers_cte AS(
    SELECT
        customer_sk,
        concat(first_name, ' ', last_name) AS customer_name,
        gender,
        phone,
        email
    FROM
        {{ ref('bronze_customers') }}
)

SELECT
    bsc.sales_id,
    bsc.gross_amount,
    bsc.payment_method,
    bsc.calculated_gross_amount,
    bpc.category,
    bpc.product_name,
    bcc.customer_name,
    bcc.gender
FROM
    bronze_sales_cte bsc
JOIN
    bronze_products_cte bpc
ON
    bsc.product_sk = bpc.product_sk
JOIN
    bronze_customers_cte bcc
ON
    bsc.customer_sk = bcc.customer_sk