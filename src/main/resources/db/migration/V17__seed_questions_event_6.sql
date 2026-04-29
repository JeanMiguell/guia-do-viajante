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
SELECT gen_random_uuid(), NOW(), NOW(), target_activity.id, data.statement, 'MULTIPLE_CHOICE'
FROM target_activity,
     (
         VALUES
             ('Qual era a base da economia brasileira durante o período escravista?'),
             ('Como as pessoas escravizadas reagiam ao sistema?'),
             ('Qual foi uma forma de resistência à escravidão?')
     ) AS data(statement);

WITH questions_cte AS (
    SELECT q.id, q.statement
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Abolição da Escravidão'
      AND u.title = 'A Luta pela Liberdade'
)
INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, data.text, data.is_correct
FROM questions_cte q
         JOIN LATERAL (
    VALUES
        ('Qual era a base da economia brasileira durante o período escravista?', 'Trabalho escravo', TRUE),
        ('Qual era a base da economia brasileira durante o período escravista?', 'Trabalho industrial', FALSE),
        ('Qual era a base da economia brasileira durante o período escravista?', 'Tecnologia avançada', FALSE),

        ('Como as pessoas escravizadas reagiam ao sistema?', 'Resistiam de diversas formas', TRUE),
        ('Como as pessoas escravizadas reagiam ao sistema?', 'Aceitavam totalmente o sistema', FALSE),
        ('Como as pessoas escravizadas reagiam ao sistema?', 'Não tinham nenhuma reação', FALSE),

        ('Qual foi uma forma de resistência à escravidão?', 'Formação de quilombos', TRUE),
        ('Qual foi uma forma de resistência à escravidão?', 'Apoio ao sistema escravista', FALSE),
        ('Qual foi uma forma de resistência à escravidão?', 'Fim do comércio', FALSE)
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
SELECT gen_random_uuid(), NOW(), NOW(), target_activity.id, data.statement, 'MULTIPLE_CHOICE'
FROM target_activity,
     (
         VALUES
             ('Qual país pressionava o Brasil pelo fim da escravidão?'),
             ('Quem também pressionava internamente pela abolição?'),
             ('Qual foi o resultado dessas pressões?')
     ) AS data(statement);

WITH questions_cte AS (
    SELECT q.id, q.statement
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Abolição da Escravidão'
      AND u.title = 'Pressões pela Abolição'
)
INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, data.text, data.is_correct
FROM questions_cte q
         JOIN LATERAL (
    VALUES
        ('Qual país pressionava o Brasil pelo fim da escravidão?', 'Inglaterra', TRUE),
        ('Qual país pressionava o Brasil pelo fim da escravidão?', 'França', FALSE),
        ('Qual país pressionava o Brasil pelo fim da escravidão?', 'Espanha', FALSE),

        ('Quem também pressionava internamente pela abolição?', 'Movimentos abolicionistas', TRUE),
        ('Quem também pressionava internamente pela abolição?', 'Apenas o governo', FALSE),
        ('Quem também pressionava internamente pela abolição?', 'Somente países estrangeiros', FALSE),

        ('Qual foi o resultado dessas pressões?', 'A assinatura da Lei Áurea', TRUE),
        ('Qual foi o resultado dessas pressões?', 'O aumento da escravidão', FALSE),
        ('Qual foi o resultado dessas pressões?', 'Fim da economia', FALSE)
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
SELECT gen_random_uuid(), NOW(), NOW(), target_activity.id, data.statement, 'MULTIPLE_CHOICE'
FROM target_activity,
     (
         VALUES
             ('O que aconteceu com os ex-escravizados após a abolição?'),
             ('A abolição resolveu as desigualdades sociais?'),
             ('Qual foi um impacto da abolição na sociedade?')
     ) AS data(statement);

WITH questions_cte AS (
    SELECT q.id, q.statement
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Abolição da Escravidão'
      AND u.title = 'Depois da Abolição'
)
INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, data.text, data.is_correct
FROM questions_cte q
         JOIN LATERAL (
    VALUES
        ('O que aconteceu com os ex-escravizados após a abolição?', 'Não receberam apoio do Estado', TRUE),
        ('O que aconteceu com os ex-escravizados após a abolição?', 'Receberam terras e recursos', FALSE),
        ('O que aconteceu com os ex-escravizados após a abolição?', 'Foram enviados para outro país', FALSE),

        ('A abolição resolveu as desigualdades sociais?', 'Não, continuaram existindo', TRUE),
        ('A abolição resolveu as desigualdades sociais?', 'Sim, foram eliminadas imediatamente', FALSE),
        ('A abolição resolveu as desigualdades sociais?', 'Nunca existiram desigualdades', FALSE),

        ('Qual foi um impacto da abolição na sociedade?', 'Mudanças sociais lentas', TRUE),
        ('Qual foi um impacto da abolição na sociedade?', 'Igualdade imediata', FALSE),
        ('Qual foi um impacto da abolição na sociedade?', 'Fim das cidades', FALSE)
        ) AS data(statement, text, is_correct)
              ON data.statement = q.statement;