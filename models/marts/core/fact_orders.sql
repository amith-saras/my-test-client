with orders as  (
    select * from {{ ref('stg_orders' )}}
),

payments as (
    select * from {{ ref('stg_payments') }}
),

order_payments as (
    select
        order_id,
        sum(case when status='success' then amount end) as amount
    from payments
    group by order_id
)



select * from order_payments
