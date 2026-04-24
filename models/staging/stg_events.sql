WITH raw_data AS (

    SELECT * FROM {{source('mes_allocs_raw','events')}}
)

SELECT
    user_id,
    event_type,
    TIMESTAMP_MILLIS(timestamp) AS event_at, -- Convert milliseconds to timestamp
    device_id,
    device_type,
    -- Parsing the JSON properties
    JSON_EXTRACT_SCALAR(event_properties,'$.page_url') AS page_url,
    JSON_EXTRACT_SCALAR(event_properties,'$.session_id') AS session_id,
    CAST(JSON_EXTRACT_SCALAR(event_properties,'$.is_conversion')AS BOOL) AS is_conversion
FROM raw_data
WHERE event_type IS NOT NULL