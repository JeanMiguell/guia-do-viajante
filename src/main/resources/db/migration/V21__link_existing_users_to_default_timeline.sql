INSERT INTO user_timelines (id, created_date_at, updated_date_at, user_id, timeline_id, accepted)
SELECT
    gen_random_uuid(),
    NOW(),
    NOW(),
    u.id,
    t.id,
    TRUE
FROM users u
CROSS JOIN timelines t
WHERE t.is_default = TRUE
  AND NOT EXISTS (
      SELECT 1 FROM user_timelines ut
      WHERE ut.user_id = u.id AND ut.timeline_id = t.id
  );
