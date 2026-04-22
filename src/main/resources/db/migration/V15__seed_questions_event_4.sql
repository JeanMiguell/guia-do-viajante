WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Chegada da Família Real'
      AND u.title = 'A Corte no Brasil'
    LIMIT 1
    )
INSERT INTO activities (
    id, created_date_at, updated_date_at,
    unit_id, history_event_id, type, title, minimum_score
)
SELECT
    gen_random_uuid(), NOW(), NOW(),
    target_unit.id, NULL, 'FIXATION',
    'Exercícios de Fixação - A Corte no Brasil', NULL
FROM target_unit;

WITH target_activity AS (
    SELECT a.id
    FROM activities a
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Chegada da Família Real'
      AND u.title = 'A Corte no Brasil'
      AND a.type = 'FIXATION'
    ORDER BY a.created_date_at DESC
    LIMIT 1
    )
INSERT INTO questions (id, created_date_at, updated_date_at, activity_id, statement, type)
SELECT gen_random_uuid(), NOW(), NOW(), target_activity.id, data.statement, data.type
FROM target_activity,
     (
         VALUES
             ('Por que a família real portuguesa veio para o Brasil?', 'MULTIPLE_CHOICE'),
             ('A cidade do Rio de Janeiro se tornou o centro político do Império.', 'TRUE_FALSE'),
             ('Relacione os acontecimentos às suas consequências.', 'ASSOCIATION')
     ) AS data(statement, type);

WITH questions_cte AS (
    SELECT q.id, q.statement
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Chegada da Família Real'
      AND u.title = 'A Corte no Brasil'
      AND a.type = 'FIXATION'
)
INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, data.text, data.is_correct
FROM questions_cte q
         JOIN LATERAL (
    VALUES
        ('Por que a família real portuguesa veio para o Brasil?', 'Para fugir das tropas de Napoleão', TRUE),
        ('Por que a família real portuguesa veio para o Brasil?', 'Para explorar ouro', FALSE),
        ('Por que a família real portuguesa veio para o Brasil?', 'Para conquistar a América', FALSE),

        ('A cidade do Rio de Janeiro se tornou o centro político do Império.', 'Verdadeiro', TRUE),
        ('A cidade do Rio de Janeiro se tornou o centro político do Império.', 'Falso', FALSE),

        ('Relacione os acontecimentos às suas consequências.', 'Transferência da Corte -> Brasil vira centro político', TRUE),
        ('Relacione os acontecimentos às suas consequências.', 'Chegada ao Brasil -> Mudanças administrativas', TRUE),
        ('Relacione os acontecimentos às suas consequências.', 'Viagem marítima -> Expansão agrícola', FALSE)
        ) AS data(statement, text, is_correct)
              ON data.statement = q.statement;

WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Chegada da Família Real'
      AND u.title = 'Por que a Corte Veio?'
    LIMIT 1
    )
INSERT INTO activities (
    id, created_date_at, updated_date_at,
    unit_id, history_event_id, type, title, minimum_score
)
SELECT
    gen_random_uuid(), NOW(), NOW(),
    target_unit.id, NULL, 'FIXATION',
    'Exercícios de Fixação - Motivos da Vinda', NULL
FROM target_unit;

WITH target_activity AS (
    SELECT a.id
    FROM activities a
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Chegada da Família Real'
      AND u.title = 'Por que a Corte Veio?'
      AND a.type = 'FIXATION'
    ORDER BY a.created_date_at DESC
    LIMIT 1
    )
INSERT INTO questions (id, created_date_at, updated_date_at, activity_id, statement, type)
SELECT gen_random_uuid(), NOW(), NOW(), target_activity.id, data.statement, data.type
FROM target_activity,
     (
         VALUES
             ('Qual evento europeu levou à vinda da Corte ao Brasil?', 'MULTIPLE_CHOICE'),
             ('Portugal foi invadido pelas tropas de Napoleão.', 'TRUE_FALSE'),
             ('Ordene os acontecimentos corretamente.', 'ORDER')
     ) AS data(statement, type);

WITH questions_cte AS (
    SELECT q.id, q.statement
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Chegada da Família Real'
      AND u.title = 'Por que a Corte Veio?'
      AND a.type = 'FIXATION'
)
INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, data.text, data.is_correct
FROM questions_cte q
         JOIN LATERAL (
    VALUES
        ('Qual evento europeu levou à vinda da Corte ao Brasil?', 'Guerras Napoleônicas', TRUE),
        ('Qual evento europeu levou à vinda da Corte ao Brasil?', 'Revolução Industrial', FALSE),
        ('Qual evento europeu levou à vinda da Corte ao Brasil?', 'Independência dos EUA', FALSE),

        ('Portugal foi invadido pelas tropas de Napoleão.', 'Verdadeiro', TRUE),
        ('Portugal foi invadido pelas tropas de Napoleão.', 'Falso', FALSE),

        ('Ordene os acontecimentos corretamente.', 'Invasão de Portugal -> Fuga da Corte -> Chegada ao Brasil', TRUE),
        ('Ordene os acontecimentos corretamente.', 'Chegada ao Brasil -> Invasão -> Fuga', FALSE)
        ) AS data(statement, text, is_correct)
              ON data.statement = q.statement;

WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Chegada da Família Real'
      AND u.title = 'Transformações no Brasil'
    LIMIT 1
    )
INSERT INTO activities (
    id, created_date_at, updated_date_at,
    unit_id, history_event_id, type, title, minimum_score
)
SELECT
    gen_random_uuid(), NOW(), NOW(),
    target_unit.id, NULL, 'FIXATION',
    'Exercícios de Fixação - Transformações', NULL
FROM target_unit;

WITH target_activity AS (
    SELECT a.id
    FROM activities a
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Chegada da Família Real'
      AND u.title = 'Transformações no Brasil'
      AND a.type = 'FIXATION'
    ORDER BY a.created_date_at DESC
    LIMIT 1
    )
INSERT INTO questions (id, created_date_at, updated_date_at, activity_id, statement, type)
SELECT gen_random_uuid(), NOW(), NOW(), target_activity.id, data.statement, data.type
FROM target_activity,
     (
         VALUES
             ('Qual foi uma mudança importante após a chegada da Corte?', 'MULTIPLE_CHOICE'),
             ('A abertura dos portos permitiu comércio com outros países.', 'TRUE_FALSE'),
             ('Relacione as transformações com seus impactos.', 'ASSOCIATION')
     ) AS data(statement, type);

WITH questions_cte AS (
    SELECT q.id, q.statement
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Chegada da Família Real'
      AND u.title = 'Transformações no Brasil'
      AND a.type = 'FIXATION'
)
INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, data.text, data.is_correct
FROM questions_cte q
         JOIN LATERAL (
    VALUES
        ('Qual foi uma mudança importante após a chegada da Corte?', 'Abertura dos portos', TRUE),
        ('Qual foi uma mudança importante após a chegada da Corte?', 'Fim da agricultura', FALSE),
        ('Qual foi uma mudança importante após a chegada da Corte?', 'Isolamento comercial', FALSE),

        ('A abertura dos portos permitiu comércio com outros países.', 'Verdadeiro', TRUE),
        ('A abertura dos portos permitiu comércio com outros países.', 'Falso', FALSE),

        ('Relacione as transformações com seus impactos.', 'Abertura dos portos -> Comércio internacional', TRUE),
        ('Relacione as transformações com seus impactos.', 'Criação de instituições -> Desenvolvimento administrativo', TRUE),
        ('Relacione as transformações com seus impactos.', 'Chegada da Corte -> Isolamento político', FALSE)
        ) AS data(statement, text, is_correct)
              ON data.statement = q.statement;