SELECT
    e.*,
    u.gender,
    u.user_status,
    u.subscription_plan,
    u.plan_price
FROM {{ref('stg_events')}} AS e
LEFT JOIN {{source('mes_allocs_raw','users')}} AS u
    ON e.user_id = u.user_id