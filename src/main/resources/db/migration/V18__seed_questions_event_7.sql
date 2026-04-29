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
SELECT gen_random_uuid(), NOW(), NOW(), target_activity.id, data.statement, 'MULTIPLE_CHOICE'
FROM target_activity,
     (
         VALUES
             ('Qual foi um fator que contribuiu para a queda da monarquia no Brasil?'),
             ('Qual grupo social estava insatisfeito com a monarquia?'),
             ('Qual evento contribuiu para o desgaste da monarquia?')
     ) AS data(statement);

WITH questions_cte AS (
    SELECT q.id, q.statement
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Proclamação da República'
      AND u.title = 'Fim da Monarquia'
)
INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, data.text, data.is_correct
FROM questions_cte q
         JOIN LATERAL (
    VALUES
        ('Qual foi um fator que contribuiu para a queda da monarquia no Brasil?', 'Insatisfação de militares e elites', TRUE),
        ('Qual foi um fator que contribuiu para a queda da monarquia no Brasil?', 'Excesso de apoio popular', FALSE),
        ('Qual foi um fator que contribuiu para a queda da monarquia no Brasil?', 'Fim da agricultura', FALSE),

        ('Qual grupo social estava insatisfeito com a monarquia?', 'Militares', TRUE),
        ('Qual grupo social estava insatisfeito com a monarquia?', 'Todos estavam satisfeitos', FALSE),
        ('Qual grupo social estava insatisfeito com a monarquia?', 'Apenas estrangeiros', FALSE),

        ('Qual evento contribuiu para o desgaste da monarquia?', 'Abolição da escravidão sem indenização', TRUE),
        ('Qual evento contribuiu para o desgaste da monarquia?', 'Descobrimento do Brasil', FALSE),
        ('Qual evento contribuiu para o desgaste da monarquia?', 'Fim da internet', FALSE)
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
SELECT gen_random_uuid(), NOW(), NOW(), target_activity.id, data.statement, 'MULTIPLE_CHOICE'
FROM target_activity,
     (
         VALUES
             ('Quem liderou a Proclamação da República?'),
             ('Qual grupo teve papel importante no movimento republicano?'),
             ('O que motivou o movimento republicano?')
     ) AS data(statement);

WITH questions_cte AS (
    SELECT q.id, q.statement
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Proclamação da República'
      AND u.title = 'O Movimento Republicano'
)
INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, data.text, data.is_correct
FROM questions_cte q
         JOIN LATERAL (
    VALUES
        ('Quem liderou a Proclamação da República?', 'Deodoro da Fonseca', TRUE),
        ('Quem liderou a Proclamação da República?', 'Dom Pedro II', FALSE),
        ('Quem liderou a Proclamação da República?', 'Tiradentes', FALSE),

        ('Qual grupo teve papel importante no movimento republicano?', 'Militares', TRUE),
        ('Qual grupo teve papel importante no movimento republicano?', 'Apenas camponeses', FALSE),
        ('Qual grupo teve papel importante no movimento republicano?', 'Nenhum grupo', FALSE),

        ('O que motivou o movimento republicano?', 'Insatisfação com a monarquia', TRUE),
        ('O que motivou o movimento republicano?', 'Total apoio ao imperador', FALSE),
        ('O que motivou o movimento republicano?', 'Fim do comércio', FALSE)
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
SELECT gen_random_uuid(), NOW(), NOW(), target_activity.id, data.statement, 'MULTIPLE_CHOICE'
FROM target_activity,
     (
         VALUES
             ('Qual característica marcou o início da República no Brasil?'),
             ('A participação política aumentou imediatamente após a República?'),
             ('Qual mudança ocorreu com o novo regime?')
     ) AS data(statement);

WITH questions_cte AS (
    SELECT q.id, q.statement
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Proclamação da República'
      AND u.title = 'O Novo Regime'
)
INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, data.text, data.is_correct
FROM questions_cte q
         JOIN LATERAL (
    VALUES
        ('Qual característica marcou o início da República no Brasil?', 'Nova Constituição', TRUE),
        ('Qual característica marcou o início da República no Brasil?', 'Fim das leis', FALSE),
        ('Qual característica marcou o início da República no Brasil?', 'Fim da política', FALSE),

        ('A participação política aumentou imediatamente após a República?', 'Não, foi limitada', TRUE),
        ('A participação política aumentou imediatamente após a República?', 'Sim, totalmente', FALSE),
        ('A participação política aumentou imediatamente após a República?', 'Nunca existiu política', FALSE),

        ('Qual mudança ocorreu com o novo regime?', 'Mudança para sistema republicano', TRUE),
        ('Qual mudança ocorreu com o novo regime?', 'Retorno da monarquia', FALSE),
        ('Qual mudança ocorreu com o novo regime?', 'Fim do governo', FALSE)
        ) AS data(statement, text, is_correct)
              ON data.statement = q.statement;