INSERT INTO users (id, created_date_at, updated_date_at, name, email, encrypted_password, auth_provider, user_type, additional_data_completed)
SELECT
    gen_random_uuid(),
    NOW(),
    NOW(),
    'Admin',
    'admin@gmail.com',
    '$2a$10$o6H63wUhXQGp7GaUAwgxf.X1Hw9eNyT3Al4Vr1jc7iEeUAD.4OFXe',
    'LOCAL',
    'TEACHER',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM users WHERE email = 'admin@gmail.com'
);

-- Assign the admin user as owner of the default timeline(s) that have no owner yet.
UPDATE timelines t
SET user_id = u.id,
    updated_date_at = NOW()
FROM users u
WHERE u.email = 'admin@gmail.com'
  AND t.is_default = TRUE
  AND t.user_id IS NULL;

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
WHERE u.email = 'admin@gmail.com'
  AND t.is_default = TRUE
  AND NOT EXISTS (
      SELECT 1 FROM user_timelines ut
      WHERE ut.user_id = u.id AND ut.timeline_id = t.id
  );
