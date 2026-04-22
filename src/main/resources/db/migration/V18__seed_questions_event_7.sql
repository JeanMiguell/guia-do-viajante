WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Proclamação da República'
      AND u.title = 'Fim da Monarquia'
    LIMIT 1
    )
INSERT INTO activities (
    id, created_date_at, updated_date_at,
    unit_id, history_event_id, type, title, minimum_score
)
SELECT
    gen_random_uuid(), NOW(), NOW(),
    target_unit.id, NULL, 'FIXATION',
    'Exercícios de Fixação - Fim da Monarquia', NULL
FROM target_unit;

WITH target_activity AS (
    SELECT a.id
    FROM activities a
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Proclamação da República'
      AND u.title = 'Fim da Monarquia'
      AND a.type = 'FIXATION'
    ORDER BY a.created_date_at DESC
    LIMIT 1
    )
INSERT INTO questions (id, created_date_at, updated_date_at, activity_id, statement, type)
SELECT gen_random_uuid(), NOW(), NOW(), target_activity.id, data.statement, data.type
FROM target_activity,
     (
         VALUES
             ('Qual foi um fator que contribuiu para a queda da monarquia no Brasil?', 'MULTIPLE_CHOICE'),
             ('A monarquia mantinha apoio total de todos os grupos sociais.', 'TRUE_FALSE'),
             ('Relacione os grupos sociais às suas insatisfações.', 'ASSOCIATION')
     ) AS data(statement, type);

WITH questions_cte AS (
    SELECT q.id, q.statement
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Proclamação da República'
      AND u.title = 'Fim da Monarquia'
      AND a.type = 'FIXATION'
)
INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, data.text, data.is_correct
FROM questions_cte q
         JOIN LATERAL (
    VALUES
        ('Qual foi um fator que contribuiu para a queda da monarquia no Brasil?', 'Insatisfação de militares e elites', TRUE),
        ('Qual foi um fator que contribuiu para a queda da monarquia no Brasil?', 'Excesso de apoio popular', FALSE),
        ('Qual foi um fator que contribuiu para a queda da monarquia no Brasil?', 'Fim da agricultura', FALSE),

        ('A monarquia mantinha apoio total de todos os grupos sociais.', 'Verdadeiro', FALSE),
        ('A monarquia mantinha apoio total de todos os grupos sociais.', 'Falso', TRUE),

        ('Relacione os grupos sociais às suas insatisfações.', 'Militares -> Insatisfação política', TRUE),
        ('Relacione os grupos sociais às suas insatisfações.', 'Fazendeiros -> Questão da abolição', TRUE),
        ('Relacione os grupos sociais às suas insatisfações.', 'População -> Apoio total', FALSE)
        ) AS data(statement, text, is_correct)
              ON data.statement = q.statement;

WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Proclamação da República'
      AND u.title = 'O Movimento Republicano'
    LIMIT 1
    )
INSERT INTO activities (
    id, created_date_at, updated_date_at,
    unit_id, history_event_id, type, title, minimum_score
)
SELECT
    gen_random_uuid(), NOW(), NOW(),
    target_unit.id, NULL, 'FIXATION',
    'Exercícios de Fixação - Movimento Republicano', NULL
FROM target_unit;

WITH target_activity AS (
    SELECT a.id
    FROM activities a
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Proclamação da República'
      AND u.title = 'O Movimento Republicano'
      AND a.type = 'FIXATION'
    ORDER BY a.created_date_at DESC
    LIMIT 1
    )
INSERT INTO questions (id, created_date_at, updated_date_at, activity_id, statement, type)
SELECT gen_random_uuid(), NOW(), NOW(), target_activity.id, data.statement, data.type
FROM target_activity,
     (
         VALUES
             ('Quem liderou a Proclamação da República?', 'MULTIPLE_CHOICE'),
             ('Os militares tiveram papel importante na Proclamação da República.', 'TRUE_FALSE'),
             ('Ordene os acontecimentos da Proclamação.', 'ORDER')
     ) AS data(statement, type);

WITH questions_cte AS (
    SELECT q.id, q.statement
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Proclamação da República'
      AND u.title = 'O Movimento Republicano'
      AND a.type = 'FIXATION'
)
INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, data.text, data.is_correct
FROM questions_cte q
         JOIN LATERAL (
    VALUES
        ('Quem liderou a Proclamação da República?', 'Deodoro da Fonseca', TRUE),
        ('Quem liderou a Proclamação da República?', 'Dom Pedro II', FALSE),
        ('Quem liderou a Proclamação da República?', 'Tiradentes', FALSE),

        ('Os militares tiveram papel importante na Proclamação da República.', 'Verdadeiro', TRUE),
        ('Os militares tiveram papel importante na Proclamação da República.', 'Falso', FALSE),

        ('Ordene os acontecimentos da Proclamação.', 'Insatisfação -> Movimento militar -> Proclamação', TRUE),
        ('Ordene os acontecimentos da Proclamação.', 'Proclamação -> Movimento -> Insatisfação', FALSE)
        ) AS data(statement, text, is_correct)
              ON data.statement = q.statement;

WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Proclamação da República'
      AND u.title = 'O Novo Regime'
    LIMIT 1
    )
INSERT INTO activities (
    id, created_date_at, updated_date_at,
    unit_id, history_event_id, type, title, minimum_score
)
SELECT
    gen_random_uuid(), NOW(), NOW(),
    target_unit.id, NULL, 'FIXATION',
    'Exercícios de Fixação - Novo Regime', NULL
FROM target_unit;

WITH target_activity AS (
    SELECT a.id
    FROM activities a
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Proclamação da República'
      AND u.title = 'O Novo Regime'
      AND a.type = 'FIXATION'
    ORDER BY a.created_date_at DESC
    LIMIT 1
    )
INSERT INTO questions (id, created_date_at, updated_date_at, activity_id, statement, type)
SELECT gen_random_uuid(), NOW(), NOW(), target_activity.id, data.statement, data.type
FROM target_activity,
     (
         VALUES
             ('Qual característica marcou o início da República no Brasil?', 'MULTIPLE_CHOICE'),
             ('A República ampliou imediatamente a participação política.', 'TRUE_FALSE'),
             ('Relacione características da República com seus efeitos.', 'ASSOCIATION')
     ) AS data(statement, type);

WITH questions_cte AS (
    SELECT q.id, q.statement
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Proclamação da República'
      AND u.title = 'O Novo Regime'
      AND a.type = 'FIXATION'
)
INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, data.text, data.is_correct
FROM questions_cte q
         JOIN LATERAL (
    VALUES
        ('Qual característica marcou o início da República no Brasil?', 'Nova Constituição', TRUE),
        ('Qual característica marcou o início da República no Brasil?', 'Fim das leis', FALSE),
        ('Qual característica marcou o início da República no Brasil?', 'Fim da política', FALSE),

        ('A República ampliou imediatamente a participação política.', 'Verdadeiro', FALSE),
        ('A República ampliou imediatamente a participação política.', 'Falso', TRUE),

        ('Relacione características da República com seus efeitos.', 'República -> Novo sistema político', TRUE),
        ('Relacione características da República com seus efeitos.', 'Constituição -> Organização do Estado', TRUE),
        ('Relacione características da República com seus efeitos.', 'República -> Igualdade imediata', FALSE)
        ) AS data(statement, text, is_correct)
              ON data.statement = q.statement;