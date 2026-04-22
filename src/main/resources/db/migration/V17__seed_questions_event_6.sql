WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Abolição da Escravidão'
      AND u.title = 'A Luta pela Liberdade'
    LIMIT 1
    )
INSERT INTO activities (
    id, created_date_at, updated_date_at,
    unit_id, history_event_id, type, title, minimum_score
)
SELECT
    gen_random_uuid(), NOW(), NOW(),
    target_unit.id, NULL, 'FIXATION',
    'Exercícios de Fixação - A Luta pela Liberdade', NULL
FROM target_unit;

WITH target_activity AS (
    SELECT a.id
    FROM activities a
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Abolição da Escravidão'
      AND u.title = 'A Luta pela Liberdade'
      AND a.type = 'FIXATION'
    ORDER BY a.created_date_at DESC
    LIMIT 1
    )
INSERT INTO questions (id, created_date_at, updated_date_at, activity_id, statement, type)
SELECT gen_random_uuid(), NOW(), NOW(), target_activity.id, data.statement, data.type
FROM target_activity,
     (
         VALUES
             ('Qual era a base da economia brasileira durante o período escravista?', 'MULTIPLE_CHOICE'),
             ('Pessoas escravizadas não resistiam ao sistema.', 'TRUE_FALSE'),
             ('Relacione as formas de resistência com seus exemplos.', 'ASSOCIATION')
     ) AS data(statement, type);

WITH questions_cte AS (
    SELECT q.id, q.statement
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Abolição da Escravidão'
      AND u.title = 'A Luta pela Liberdade'
      AND a.type = 'FIXATION'
)
INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, data.text, data.is_correct
FROM questions_cte q
         JOIN LATERAL (
    VALUES
        ('Qual era a base da economia brasileira durante o período escravista?', 'Trabalho escravo', TRUE),
        ('Qual era a base da economia brasileira durante o período escravista?', 'Trabalho industrial', FALSE),
        ('Qual era a base da economia brasileira durante o período escravista?', 'Tecnologia avançada', FALSE),

        ('Pessoas escravizadas não resistiam ao sistema.', 'Verdadeiro', FALSE),
        ('Pessoas escravizadas não resistiam ao sistema.', 'Falso', TRUE),

        ('Relacione as formas de resistência com seus exemplos.', 'Fuga -> Quilombos', TRUE),
        ('Relacione as formas de resistência com seus exemplos.', 'Cultura -> Preservação de tradições', TRUE),
        ('Relacione as formas de resistência com seus exemplos.', 'Resistência -> Aceitação total', FALSE)
        ) AS data(statement, text, is_correct)
              ON data.statement = q.statement;

WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Abolição da Escravidão'
      AND u.title = 'Pressões pela Abolição'
    LIMIT 1
    )
INSERT INTO activities (
    id, created_date_at, updated_date_at,
    unit_id, history_event_id, type, title, minimum_score
)
SELECT
    gen_random_uuid(), NOW(), NOW(),
    target_unit.id, NULL, 'FIXATION',
    'Exercícios de Fixação - Pressões pela Abolição', NULL
FROM target_unit;

WITH target_activity AS (
    SELECT a.id
    FROM activities a
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Abolição da Escravidão'
      AND u.title = 'Pressões pela Abolição'
      AND a.type = 'FIXATION'
    ORDER BY a.created_date_at DESC
    LIMIT 1
    )
INSERT INTO questions (id, created_date_at, updated_date_at, activity_id, statement, type)
SELECT gen_random_uuid(), NOW(), NOW(), target_activity.id, data.statement, data.type
FROM target_activity,
     (
         VALUES
             ('Qual país pressionava o Brasil pelo fim da escravidão?', 'MULTIPLE_CHOICE'),
             ('Movimentos internos também pressionaram pela abolição.', 'TRUE_FALSE'),
             ('Ordene o processo de abolição.', 'ORDER')
     ) AS data(statement, type);

WITH questions_cte AS (
    SELECT q.id, q.statement
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Abolição da Escravidão'
      AND u.title = 'Pressões pela Abolição'
      AND a.type = 'FIXATION'
)
INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, data.text, data.is_correct
FROM questions_cte q
         JOIN LATERAL (
    VALUES
        ('Qual país pressionava o Brasil pelo fim da escravidão?', 'Inglaterra', TRUE),
        ('Qual país pressionava o Brasil pelo fim da escravidão?', 'França', FALSE),
        ('Qual país pressionava o Brasil pelo fim da escravidão?', 'Espanha', FALSE),

        ('Movimentos internos também pressionaram pela abolição.', 'Verdadeiro', TRUE),
        ('Movimentos internos também pressionaram pela abolição.', 'Falso', FALSE),

        ('Ordene o processo de abolição.', 'Leis graduais -> Pressões -> Lei Áurea', TRUE),
        ('Ordene o processo de abolição.', 'Lei Áurea -> Pressões -> Leis', FALSE)
        ) AS data(statement, text, is_correct)
              ON data.statement = q.statement;

WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Abolição da Escravidão'
      AND u.title = 'Depois da Abolição'
    LIMIT 1
    )
INSERT INTO activities (
    id, created_date_at, updated_date_at,
    unit_id, history_event_id, type, title, minimum_score
)
SELECT
    gen_random_uuid(), NOW(), NOW(),
    target_unit.id, NULL, 'FIXATION',
    'Exercícios de Fixação - Depois da Abolição', NULL
FROM target_unit;

WITH target_activity AS (
    SELECT a.id
    FROM activities a
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Abolição da Escravidão'
      AND u.title = 'Depois da Abolição'
      AND a.type = 'FIXATION'
    ORDER BY a.created_date_at DESC
    LIMIT 1
    )
INSERT INTO questions (id, created_date_at, updated_date_at, activity_id, statement, type)
SELECT gen_random_uuid(), NOW(), NOW(), target_activity.id, data.statement, data.type
FROM target_activity,
     (
         VALUES
             ('O que aconteceu com os ex-escravizados após a abolição?', 'MULTIPLE_CHOICE'),
             ('A abolição resolveu imediatamente as desigualdades sociais.', 'TRUE_FALSE'),
             ('Relacione consequências da abolição com seus impactos.', 'ASSOCIATION')
     ) AS data(statement, type);

WITH questions_cte AS (
    SELECT q.id, q.statement
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Abolição da Escravidão'
      AND u.title = 'Depois da Abolição'
      AND a.type = 'FIXATION'
)
INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, data.text, data.is_correct
FROM questions_cte q
         JOIN LATERAL (
    VALUES
        ('O que aconteceu com os ex-escravizados após a abolição?', 'Não receberam apoio do Estado', TRUE),
        ('O que aconteceu com os ex-escravizados após a abolição?', 'Receberam terras e recursos', FALSE),
        ('O que aconteceu com os ex-escravizados após a abolição?', 'Foram enviados para outro país', FALSE),

        ('A abolição resolveu imediatamente as desigualdades sociais.', 'Verdadeiro', FALSE),
        ('A abolição resolveu imediatamente as desigualdades sociais.', 'Falso', TRUE),

        ('Relacione consequências da abolição com seus impactos.', 'Liberdade -> Falta de suporte', TRUE),
        ('Relacione consequências da abolição com seus impactos.', 'Fim da escravidão -> Mudanças sociais lentas', TRUE),
        ('Relacione consequências da abolição com seus impactos.', 'Abolição -> Igualdade imediata', FALSE)
        ) AS data(statement, text, is_correct)
              ON data.statement = q.statement;