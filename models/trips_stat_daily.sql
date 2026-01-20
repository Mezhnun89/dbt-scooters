SELECT
    started_at::date AS date,
    COUNT(*) AS trips,
    ROUND((MAX(price) / 100.0)::numeric, 2) AS max_price_rub,
    ROUND((AVG(distance) / 1000.0)::numeric, 3) AS avg_distance_km
FROM scooters_raw.trips
GROUP BY 1
ORDER BY 1