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
SELECT gen_random_uuid(), NOW(), NOW(), target_activity.id, data.statement, 'MULTIPLE_CHOICE'
FROM target_activity,
     (
         VALUES
             ('Por que a família real portuguesa veio para o Brasil?'),
             ('Qual foi uma consequência da chegada da Corte ao Brasil?'),
             ('Qual cidade se tornou o centro político do Império?')
     ) AS data(statement);

WITH questions_cte AS (
    SELECT q.id, q.statement
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Chegada da Família Real'
      AND u.title = 'A Corte no Brasil'
)
INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, data.text, data.is_correct
FROM questions_cte q
         JOIN LATERAL (
    VALUES
        ('Por que a família real portuguesa veio para o Brasil?', 'Para fugir das tropas de Napoleão', TRUE),
        ('Por que a família real portuguesa veio para o Brasil?', 'Para explorar ouro', FALSE),
        ('Por que a família real portuguesa veio para o Brasil?', 'Para conquistar a América', FALSE),

        ('Qual foi uma consequência da chegada da Corte ao Brasil?', 'Mudanças administrativas no Brasil', TRUE),
        ('Qual foi uma consequência da chegada da Corte ao Brasil?', 'Fim do comércio internacional', FALSE),
        ('Qual foi uma consequência da chegada da Corte ao Brasil?', 'Isolamento político', FALSE),

        ('Qual cidade se tornou o centro político do Império?', 'Rio de Janeiro', TRUE),
        ('Qual cidade se tornou o centro político do Império?', 'Salvador', FALSE),
        ('Qual cidade se tornou o centro político do Império?', 'Lisboa', FALSE)
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
SELECT gen_random_uuid(), NOW(), NOW(), target_activity.id, data.statement, 'MULTIPLE_CHOICE'
FROM target_activity,
     (
         VALUES
             ('Qual evento europeu levou à vinda da Corte ao Brasil?'),
             ('O que aconteceu com Portugal nesse período?'),
             ('Qual foi a sequência correta dos acontecimentos?')
     ) AS data(statement);

WITH questions_cte AS (
    SELECT q.id, q.statement
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Chegada da Família Real'
      AND u.title = 'Por que a Corte Veio?'
)
INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, data.text, data.is_correct
FROM questions_cte q
         JOIN LATERAL (
    VALUES
        ('Qual evento europeu levou à vinda da Corte ao Brasil?', 'Guerras Napoleônicas', TRUE),
        ('Qual evento europeu levou à vinda da Corte ao Brasil?', 'Revolução Industrial', FALSE),
        ('Qual evento europeu levou à vinda da Corte ao Brasil?', 'Independência dos EUA', FALSE),

        ('O que aconteceu com Portugal nesse período?', 'Foi invadido pelas tropas de Napoleão', TRUE),
        ('O que aconteceu com Portugal nesse período?', 'Se tornou independente', FALSE),
        ('O que aconteceu com Portugal nesse período?', 'Entrou em guerra com o Brasil', FALSE),

        ('Qual foi a sequência correta dos acontecimentos?', 'Invasão de Portugal -> Fuga da Corte -> Chegada ao Brasil', TRUE),
        ('Qual foi a sequência correta dos acontecimentos?', 'Chegada ao Brasil -> Invasão -> Fuga', FALSE),
        ('Qual foi a sequência correta dos acontecimentos?', 'Fuga -> Invasão -> Chegada', FALSE)
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
SELECT gen_random_uuid(), NOW(), NOW(), target_activity.id, data.statement, 'MULTIPLE_CHOICE'
FROM target_activity,
     (
         VALUES
             ('Qual foi uma mudança importante após a chegada da Corte?'),
             ('O que a abertura dos portos permitiu?'),
             ('Qual impacto ocorreu com a chegada da Corte?')
     ) AS data(statement);

WITH questions_cte AS (
    SELECT q.id, q.statement
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Chegada da Família Real'
      AND u.title = 'Transformações no Brasil'
)
INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, data.text, data.is_correct
FROM questions_cte q
         JOIN LATERAL (
    VALUES
        ('Qual foi uma mudança importante após a chegada da Corte?', 'Abertura dos portos', TRUE),
        ('Qual foi uma mudança importante após a chegada da Corte?', 'Fim da agricultura', FALSE),
        ('Qual foi uma mudança importante após a chegada da Corte?', 'Isolamento comercial', FALSE),

        ('O que a abertura dos portos permitiu?', 'Comércio com outros países', TRUE),
        ('O que a abertura dos portos permitiu?', 'Isolamento econômico', FALSE),
        ('O que a abertura dos portos permitiu?', 'Fim das exportações', FALSE),

        ('Qual impacto ocorreu com a chegada da Corte?', 'Desenvolvimento administrativo', TRUE),
        ('Qual impacto ocorreu com a chegada da Corte?', 'Redução populacional', FALSE),
        ('Qual impacto ocorreu com a chegada da Corte?', 'Fim das cidades', FALSE)
        ) AS data(statement, text, is_correct)
              ON data.statement = q.statement;