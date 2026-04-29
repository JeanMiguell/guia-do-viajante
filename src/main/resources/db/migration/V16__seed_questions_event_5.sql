WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Independência do Brasil'
      AND u.title = 'Caminho para a Independência'
    LIMIT 1
    )
INSERT INTO activities (
    id, created_date_at, updated_date_at,
    unit_id, history_event_id, type, title, minimum_score
)
SELECT
    gen_random_uuid(), NOW(), NOW(),
    target_unit.id, NULL, 'FIXATION',
    'Exercícios de Fixação - Caminho para a Independência', NULL
FROM target_unit;

WITH target_activity AS (
    SELECT a.id
    FROM activities a
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Independência do Brasil'
      AND u.title = 'Caminho para a Independência'
      AND a.type = 'FIXATION'
    ORDER BY a.created_date_at DESC
    LIMIT 1
    )
INSERT INTO questions (id, created_date_at, updated_date_at, activity_id, statement, type)
SELECT gen_random_uuid(), NOW(), NOW(), target_activity.id, data.statement, 'MULTIPLE_CHOICE'
FROM target_activity,
     (
         VALUES
             ('Por que o Brasil começou a desejar maior autonomia em relação a Portugal?'),
             ('Qual fator internacional influenciou a independência do Brasil?'),
             ('Qual mudança aumentou a autonomia do Brasil antes da independência?')
     ) AS data(statement);

WITH questions_cte AS (
    SELECT q.id, q.statement
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Independência do Brasil'
      AND u.title = 'Caminho para a Independência'
)
INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, data.text, data.is_correct
FROM questions_cte q
         JOIN LATERAL (
    VALUES
        ('Por que o Brasil começou a desejar maior autonomia em relação a Portugal?', 'Porque havia restrições comerciais e controle da metrópole', TRUE),
        ('Por que o Brasil começou a desejar maior autonomia em relação a Portugal?', 'Porque o Brasil já era independente', FALSE),
        ('Por que o Brasil começou a desejar maior autonomia em relação a Portugal?', 'Porque não existia comércio', FALSE),

        ('Qual fator internacional influenciou a independência do Brasil?', 'Ideias de liberdade vindas de outras revoluções', TRUE),
        ('Qual fator internacional influenciou a independência do Brasil?', 'A invenção da internet', FALSE),
        ('Qual fator internacional influenciou a independência do Brasil?', 'A descoberta da América', FALSE),

        ('Qual mudança aumentou a autonomia do Brasil antes da independência?', 'Abertura dos portos', TRUE),
        ('Qual mudança aumentou a autonomia do Brasil antes da independência?', 'Fim da agricultura', FALSE),
        ('Qual mudança aumentou a autonomia do Brasil antes da independência?', 'Fechamento do comércio', FALSE)
        ) AS data(statement, text, is_correct)
              ON data.statement = q.statement;

WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Independência do Brasil'
      AND u.title = 'Os Conflitos e Decisões'
    LIMIT 1
    )
INSERT INTO activities (
    id, created_date_at, updated_date_at,
    unit_id, history_event_id, type, title, minimum_score
)
SELECT
    gen_random_uuid(), NOW(), NOW(),
    target_unit.id, NULL, 'FIXATION',
    'Exercícios de Fixação - Conflitos e Decisões', NULL
FROM target_unit;

WITH target_activity AS (
    SELECT a.id
    FROM activities a
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Independência do Brasil'
      AND u.title = 'Os Conflitos e Decisões'
      AND a.type = 'FIXATION'
    ORDER BY a.created_date_at DESC
    LIMIT 1
    )
INSERT INTO questions (id, created_date_at, updated_date_at, activity_id, statement, type)
SELECT gen_random_uuid(), NOW(), NOW(), target_activity.id, data.statement, 'MULTIPLE_CHOICE'
FROM target_activity,
     (
         VALUES
             ('O que foi o Dia do Fico?'),
             ('O que Dom Pedro decidiu fazer nesse momento?'),
             ('Qual foi o marco da independência do Brasil?')
     ) AS data(statement);

WITH questions_cte AS (
    SELECT q.id, q.statement
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Independência do Brasil'
      AND u.title = 'Os Conflitos e Decisões'
)
INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, data.text, data.is_correct
FROM questions_cte q
         JOIN LATERAL (
    VALUES
        ('O que foi o Dia do Fico?', 'Decisão de Dom Pedro de permanecer no Brasil', TRUE),
        ('O que foi o Dia do Fico?', 'Declaração da independência', FALSE),
        ('O que foi o Dia do Fico?', 'Retorno da Corte', FALSE),

        ('O que Dom Pedro decidiu fazer nesse momento?', 'Ficar no Brasil contra ordens de Portugal', TRUE),
        ('O que Dom Pedro decidiu fazer nesse momento?', 'Voltar para Portugal imediatamente', FALSE),
        ('O que Dom Pedro decidiu fazer nesse momento?', 'Abandonar o governo', FALSE),

        ('Qual foi o marco da independência do Brasil?', 'Grito do Ipiranga', TRUE),
        ('Qual foi o marco da independência do Brasil?', 'Descobrimento do Brasil', FALSE),
        ('Qual foi o marco da independência do Brasil?', 'Chegada da família real', FALSE)
        ) AS data(statement, text, is_correct)
              ON data.statement = q.statement;

WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Independência do Brasil'
      AND u.title = 'O Brasil Independente'
    LIMIT 1
    )
INSERT INTO activities (
    id, created_date_at, updated_date_at,
    unit_id, history_event_id, type, title, minimum_score
)
SELECT
    gen_random_uuid(), NOW(), NOW(),
    target_unit.id, NULL, 'FIXATION',
    'Exercícios de Fixação - Brasil Independente', NULL
FROM target_unit;

WITH target_activity AS (
    SELECT a.id
    FROM activities a
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Independência do Brasil'
      AND u.title = 'O Brasil Independente'
      AND a.type = 'FIXATION'
    ORDER BY a.created_date_at DESC
    LIMIT 1
    )
INSERT INTO questions (id, created_date_at, updated_date_at, activity_id, statement, type)
SELECT gen_random_uuid(), NOW(), NOW(), target_activity.id, data.statement, 'MULTIPLE_CHOICE'
FROM target_activity,
     (
         VALUES
             ('Qual foi o sistema de governo adotado após a independência?'),
             ('O que aconteceu com as desigualdades sociais após a independência?'),
             ('Qual característica marcou o Brasil independente?')
     ) AS data(statement);

WITH questions_cte AS (
    SELECT q.id, q.statement
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Independência do Brasil'
      AND u.title = 'O Brasil Independente'
)
INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, data.text, data.is_correct
FROM questions_cte q
         JOIN LATERAL (
    VALUES
        ('Qual foi o sistema de governo adotado após a independência?', 'Monarquia', TRUE),
        ('Qual foi o sistema de governo adotado após a independência?', 'República', FALSE),
        ('Qual foi o sistema de governo adotado após a independência?', 'Ditadura', FALSE),

        ('O que aconteceu com as desigualdades sociais após a independência?', 'Continuaram existindo', TRUE),
        ('O que aconteceu com as desigualdades sociais após a independência?', 'Foram eliminadas imediatamente', FALSE),
        ('O que aconteceu com as desigualdades sociais após a independência?', 'Nunca existiram', FALSE),

        ('Qual característica marcou o Brasil independente?', 'Continuidade da escravidão', TRUE),
        ('Qual característica marcou o Brasil independente?', 'Igualdade social imediata', FALSE),
        ('Qual característica marcou o Brasil independente?', 'Fim da agricultura', FALSE)
        ) AS data(statement, text, is_correct)
              ON data.statement = q.statement;