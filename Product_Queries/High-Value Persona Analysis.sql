-- High-Value Persona Analysis

SELECT 
  user_status,
  subscription_plan,
  COUNT(DISTINCT user_id) AS total_users,
  ROUND(SUM(plan_price),2) AS total_revenue,
  AVG(plan_price) AS arpu -- Average Revenue Per User
FROM `mes-allocs-analysis.dbt_mes_allocs.fct_product_events`
GROUP BY
  user_status,
  subscription_plan
ORDER BY  
  total_revenue DESC;