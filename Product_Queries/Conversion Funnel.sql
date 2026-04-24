-- The Conversion Funnel: Where are we losing people ? 

SELECT 
  device_type,
  COUNT(DISTINCT CASE WHEN event_type = 'simulaion_started' THEN user_id END) AS started,
  COUNT(DISTINCT CASE WHEN event_type = 'simulation_completed' THEN user_id END) AS completed,
  COUNT(DISTINCT CASE WHEN event_type ='application_submitted' THEN user_id END) AS converted,
  -- Calculating Conversion Rate
  SAFE_DIVIDE(
    COUNT(DISTINCT CASE WHEN event_type = 'application_submitted' THEN user_id END),
    COUNT(DISTINCT CASE WHEN event_type ='simulation_started' THEN user_id END)
  ) * 100 AS conversion_rate_pct
FROM `mes-allocs-analysis.dbt_mes_allocs.fct_product_events`
GROUP BY
  device_type
ORDER BY  
  conversion_rate_pct DESC;