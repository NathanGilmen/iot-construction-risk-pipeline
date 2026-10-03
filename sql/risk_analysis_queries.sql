-- CTE to calculate rolling average telemetry values and flag operational anomalies
WITH TelemetryStats AS (
    SELECT 
        equipment_id,
        site_location_id,
        timestamp,
        sensor_temperature,
        AVG(sensor_temperature) OVER (
            PARTITION BY equipment_id 
            ORDER BY timestamp 
            ROWS BETWEEN 5 PRECEDING AND CURRENT ROW
        ) AS rolling_avg_temp,
        vibration_level
    FROM `your_gcp_project.iot_warehouse.fact_sensor_telemetry`
),
RiskFlagged AS (
    SELECT 
        equipment_id,
        site_location_id,
        timestamp,
        sensor_temperature,
        rolling_avg_temp,
        CASE 
            WHEN sensor_temperature > (rolling_avg_temp * 1.25) THEN 'HIGH RISK'
            WHEN sensor_temperature > (rolling_avg_temp * 1.10) THEN 'MODERATE RISK'
            ELSE 'NORMAL'
        END AS risk_category
    FROM TelemetryStats
)
SELECT 
    site_location_id,
    risk_category,
    COUNT(1) AS total_incidents,                     -- Total anomalous readings
    COUNT(DISTINCT equipment_id) AS unique_equipments -- Unique affected equipments
FROM RiskFlagged
WHERE risk_category != 'NORMAL'
GROUP BY site_location_id, risk_category
ORDER BY total_incidents DESC;
