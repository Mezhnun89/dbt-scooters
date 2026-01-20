SELECT
    COUNT(*) AS trips,
    COUNT(DISTINCT user_id) AS users,
    ROUND(AVG(EXTRACT(EPOCH FROM (finished_at - started_at)) / 60.0), 2) AS avg_duration_m,
    ROUND(SUM(price) / 100.0, 2) AS revenue_rub,
    ROUND(100.0 * COUNT(*) FILTER (WHERE price = 0) / NULLIF(COUNT(*), 0), 2) AS free_trips_pct
FROM scooters_raw.trips