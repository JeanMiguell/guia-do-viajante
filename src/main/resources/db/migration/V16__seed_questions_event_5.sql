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
SELECT gen_random_uuid(), NOW(), NOW(), target_activity.id, data.statement, data.type
FROM target_activity,
     (
         VALUES
             ('Por que o Brasil começou a desejar maior autonomia em relação a Portugal?', 'MULTIPLE_CHOICE'),
             ('A Independência do Brasil foi influenciada por movimentos internacionais.', 'TRUE_FALSE'),
             ('Relacione os fatores às suas consequências.', 'ASSOCIATION')
     ) AS data(statement, type);

WITH questions_cte AS (
    SELECT q.id, q.statement
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Independência do Brasil'
      AND u.title = 'Caminho para a Independência'
      AND a.type = 'FIXATION'
)
INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, data.text, data.is_correct
FROM questions_cte q
         JOIN LATERAL (
    VALUES
        ('Por que o Brasil começou a desejar maior autonomia em relação a Portugal?', 'Porque havia restrições comerciais e controle da metrópole', TRUE),
        ('Por que o Brasil começou a desejar maior autonomia em relação a Portugal?', 'Porque o Brasil era independente', FALSE),
        ('Por que o Brasil começou a desejar maior autonomia em relação a Portugal?', 'Porque não havia comércio', FALSE),

        ('A Independência do Brasil foi influenciada por movimentos internacionais.', 'Verdadeiro', TRUE),
        ('A Independência do Brasil foi influenciada por movimentos internacionais.', 'Falso', FALSE),

        ('Relacione os fatores às suas consequências.', 'Abertura dos portos -> Maior autonomia', TRUE),
        ('Relacione os fatores às suas consequências.', 'Influência externa -> Ideias de liberdade', TRUE),
        ('Relacione os fatores às suas consequências.', 'Retorno da Corte -> Aumento da autonomia', FALSE)
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
SELECT gen_random_uuid(), NOW(), NOW(), target_activity.id, data.statement, data.type
FROM target_activity,
     (
         VALUES
             ('O que foi o Dia do Fico?', 'MULTIPLE_CHOICE'),
             ('Dom Pedro decidiu permanecer no Brasil contra ordens de Portugal.', 'TRUE_FALSE'),
             ('Ordene os acontecimentos do processo de independência.', 'ORDER')
     ) AS data(statement, type);

WITH questions_cte AS (
    SELECT q.id, q.statement
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Independência do Brasil'
      AND u.title = 'Os Conflitos e Decisões'
      AND a.type = 'FIXATION'
)
INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, data.text, data.is_correct
FROM questions_cte q
         JOIN LATERAL (
    VALUES
        ('O que foi o Dia do Fico?', 'Decisão de Dom Pedro de permanecer no Brasil', TRUE),
        ('O que foi o Dia do Fico?', 'Declaração da independência', FALSE),
        ('O que foi o Dia do Fico?', 'Retorno da Corte', FALSE),

        ('Dom Pedro decidiu permanecer no Brasil contra ordens de Portugal.', 'Verdadeiro', TRUE),
        ('Dom Pedro decidiu permanecer no Brasil contra ordens de Portugal.', 'Falso', FALSE),

        ('Ordene os acontecimentos do processo de independência.', 'Pressão de Portugal -> Dia do Fico -> Grito do Ipiranga', TRUE),
        ('Ordene os acontecimentos do processo de independência.', 'Grito do Ipiranga -> Dia do Fico -> Pressão', FALSE)
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
SELECT gen_random_uuid(), NOW(), NOW(), target_activity.id, data.statement, data.type
FROM target_activity,
     (
         VALUES
             ('Qual foi o sistema de governo adotado após a independência?', 'MULTIPLE_CHOICE'),
             ('A independência eliminou imediatamente as desigualdades sociais.', 'TRUE_FALSE'),
             ('Relacione os aspectos do Brasil independente com suas características.', 'ASSOCIATION')
     ) AS data(statement, type);

WITH questions_cte AS (
    SELECT q.id, q.statement
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Independência do Brasil'
      AND u.title = 'O Brasil Independente'
      AND a.type = 'FIXATION'
)
INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, data.text, data.is_correct
FROM questions_cte q
         JOIN LATERAL (
    VALUES
        ('Qual foi o sistema de governo adotado após a independência?', 'Monarquia', TRUE),
        ('Qual foi o sistema de governo adotado após a independência?', 'República', FALSE),
        ('Qual foi o sistema de governo adotado após a independência?', 'Ditadura', FALSE),

        ('A independência eliminou imediatamente as desigualdades sociais.', 'Verdadeiro', FALSE),
        ('A independência eliminou imediatamente as desigualdades sociais.', 'Falso', TRUE),

        ('Relacione os aspectos do Brasil independente com suas características.', 'Monarquia -> Imperador no poder', TRUE),
        ('Relacione os aspectos do Brasil independente com suas características.', 'Escravidão -> Continuou após independência', TRUE),
        ('Relacione os aspectos do Brasil independente com suas características.', 'Independência -> Igualdade social imediata', FALSE)
        ) AS data(statement, text, is_correct)
              ON data.statement = q.statement;