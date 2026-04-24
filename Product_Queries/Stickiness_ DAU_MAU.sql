-- Stickiness: DAU/MAU, how many users return to our app

WITH daily_active AS (

  SELECT
    DATE(event_at) AS event_date,
    COUNT(DISTINCT user_id) AS dau
  FROM `mes-allocs-analysis.dbt_mes_allocs.fct_product_events`
  GROUP BY
    event_date
),

monthly_active AS (

  SELECT
    LAST_DAY(DATE(event_at),MONTH) AS month_date,
    COUNT(DISTINCT user_id) AS mau
  FROM `mes-allocs-analysis.dbt_mes_allocs.fct_product_events`
  GROUP BY
    month_date
)

SELECT
  d.event_date AS march_month,
  d.dau,
  m.mau,
  ROUND((d.dau / m.mau),2) * 100 AS stickiness_pct
FROM daily_active AS d
INNER JOIN monthly_active AS m
  ON LAST_DAY(d.event_date,MONTH) = m.month_date
ORDER BY
  d.event_date DESC
LIMIT 31;
