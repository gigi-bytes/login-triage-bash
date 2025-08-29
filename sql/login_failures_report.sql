-- login_failures_report.sql
-- Example-only SQL; safe to share.

-- Failures by reason (last 7 days)
SELECT reason, COUNT(*) AS failures
FROM auth_events
WHERE event_type = 'LOGIN_FAILED'
  AND event_time >= CURRENT_DATE - INTERVAL '7 days'
GROUP BY reason
ORDER BY failures DESC;

-- Failures per day
SELECT DATE(event_time) AS day, COUNT(*) AS failures
FROM auth_events
WHERE event_type = 'LOGIN_FAILED'
GROUP BY DATE(event_time)
ORDER BY day DESC;
