WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Chegada dos Portugueses'
      AND u.title = 'As Grandes Navegações'
    LIMIT 1
    )
INSERT INTO activities (
    id,
    created_date_at,
    updated_date_at,
    unit_id,
    history_event_id,
    type,
    title,
    minimum_score
)
SELECT
    gen_random_uuid(),
    NOW(),
    NOW(),
    target_unit.id,
    NULL,
    'FIXATION',
    'Exercícios de Fixação - Chegada dos Portugueses',
    NULL
FROM target_unit;

WITH target_activity AS (
    SELECT a.id
    FROM activities a
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Chegada dos Portugueses'
      AND u.title = 'As Grandes Navegações'
      AND a.type = 'FIXATION'
    ORDER BY a.created_date_at DESC
    LIMIT 1
    )
INSERT INTO questions (
    id,
    created_date_at,
    updated_date_at,
    activity_id,
    statement,
    type
)
SELECT
    gen_random_uuid(),
    NOW(),
    NOW(),
    target_activity.id,
    data.statement,
    'MULTIPLE_CHOICE'
FROM target_activity,
     (
         VALUES
             ('Em que ano os portugueses chegaram ao Brasil?'),
             ('Quem comandava a expedição que chegou ao Brasil?'),
             ('Qual documento registrou o primeiro contato com o território brasileiro?')
     ) AS data(statement);

WITH questions_cte AS (
    SELECT q.id, q.statement
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Chegada dos Portugueses'
      AND u.title = 'As Grandes Navegações'
      AND a.type = 'FIXATION'
)

INSERT INTO answers (
    id,
    created_date_at,
    updated_date_at,
    question_id,
    text,
    is_correct
)
SELECT
    gen_random_uuid(),
    NOW(),
    NOW(),
    q.id,
    data.text,
    data.is_correct
FROM questions_cte q
         JOIN LATERAL (
    VALUES

        ('Em que ano os portugueses chegaram ao Brasil?', '1492', FALSE),
        ('Em que ano os portugueses chegaram ao Brasil?', '1500', TRUE),
        ('Em que ano os portugueses chegaram ao Brasil?', '1822', FALSE),

        ('Quem comandava a expedição que chegou ao Brasil?', 'Dom Pedro I', FALSE),
        ('Quem comandava a expedição que chegou ao Brasil?', 'Pedro Álvares Cabral', TRUE),
        ('Quem comandava a expedição que chegou ao Brasil?', 'Tiradentes', FALSE),

        ('Qual documento registrou o primeiro contato com o território brasileiro?', 'Carta de Pero Vaz de Caminha', TRUE),
        ('Qual documento registrou o primeiro contato com o território brasileiro?', 'Tratado de Tordesilhas', FALSE),
        ('Qual documento registrou o primeiro contato com o território brasileiro?', 'Lei Áurea', FALSE)

        ) AS data(statement, text, is_correct)
              ON data.statement = q.statement;

WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Chegada dos Portugueses'
      AND u.title = 'A Jornada até o Brasil'
    LIMIT 1
    )
INSERT INTO activities (
    id,
    created_date_at,
    updated_date_at,
    unit_id,
    history_event_id,
    type,
    title,
    minimum_score
)
SELECT
    gen_random_uuid(),
    NOW(),
    NOW(),
    target_unit.id,
    NULL,
    'FIXATION',
    'Exercícios de Fixação - Como aconteceu',
    NULL
FROM target_unit;

WITH target_activity AS (
    SELECT a.id
    FROM activities a
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Chegada dos Portugueses'
      AND u.title = 'A Jornada até o Brasil'
      AND a.type = 'FIXATION'
    ORDER BY a.created_date_at DESC
    LIMIT 1
    )
INSERT INTO questions (
    id,
    created_date_at,
    updated_date_at,
    activity_id,
    statement,
    type
)
SELECT
    gen_random_uuid(),
    NOW(),
    NOW(),
    target_activity.id,
    data.statement,
    'MULTIPLE_CHOICE'
FROM target_activity,
     (
         VALUES
             ('Qual era o principal objetivo da viagem de Cabral?'),
             ('Qual estratégia de navegação ajudou os portugueses a chegar ao Brasil?'),
             ('Qual instrumento era utilizado para orientação no mar?')
     ) AS data(statement);

WITH questions_cte AS (
    SELECT q.id, q.statement
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Chegada dos Portugueses'
      AND u.title = 'A Jornada até o Brasil'
      AND a.type = 'FIXATION'
)
INSERT INTO answers (
    id,
    created_date_at,
    updated_date_at,
    question_id,
    text,
    is_correct
)
SELECT
    gen_random_uuid(),
    NOW(),
    NOW(),
    q.id,
    data.text,
    data.is_correct
FROM questions_cte q
         JOIN LATERAL (
    VALUES

        ('Qual era o principal objetivo da viagem de Cabral?', 'Descobrir o Brasil', FALSE),
        ('Qual era o principal objetivo da viagem de Cabral?', 'Chegar às Índias para comércio', TRUE),
        ('Qual era o principal objetivo da viagem de Cabral?', 'Conquistar a África', FALSE),

        ('Qual estratégia de navegação ajudou os portugueses a chegar ao Brasil?', 'Navegação costeira', FALSE),
        ('Qual estratégia de navegação ajudou os portugueses a chegar ao Brasil?', 'Volta do mar', TRUE),
        ('Qual estratégia de navegação ajudou os portugueses a chegar ao Brasil?', 'Travessia direta', FALSE),

        ('Qual instrumento era utilizado para orientação no mar?', 'Relógio', FALSE),
        ('Qual instrumento era utilizado para orientação no mar?', 'Bússola', TRUE),
        ('Qual instrumento era utilizado para orientação no mar?', 'Termômetro', FALSE)

        ) AS data(statement, text, is_correct)
              ON data.statement = q.statement;

WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Chegada dos Portugueses'
      AND u.title = 'Impactos da Chegada'
    LIMIT 1
    )
INSERT INTO activities (
    id,
    created_date_at,
    updated_date_at,
    unit_id,
    history_event_id,
    type,
    title,
    minimum_score
)
SELECT
    gen_random_uuid(),
    NOW(),
    NOW(),
    target_unit.id,
    NULL,
    'FIXATION',
    'Exercícios de Fixação - Causas e Consequências',
    NULL
FROM target_unit;

WITH target_activity AS (
    SELECT a.id
    FROM activities a
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Chegada dos Portugueses'
      AND u.title = 'Impactos da Chegada'
      AND a.type = 'FIXATION'
    ORDER BY a.created_date_at DESC
    LIMIT 1
    )
INSERT INTO questions (
    id,
    created_date_at,
    updated_date_at,
    activity_id,
    statement,
    type
)
SELECT
    gen_random_uuid(),
    NOW(),
    NOW(),
    target_activity.id,
    data.statement,
    'MULTIPLE_CHOICE'
FROM target_activity,
     (
         VALUES
             ('Qual foi uma das principais causas das grandes navegações?'),
             ('Além da economia, qual outro fator incentivou as navegações?'),
             ('Qual foi uma consequência da chegada dos portugueses para os povos indígenas?')
     ) AS data(statement);

WITH questions_cte AS (
    SELECT q.id, q.statement
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Chegada dos Portugueses'
      AND u.title = 'Impactos da Chegada'
      AND a.type = 'FIXATION'
)
INSERT INTO answers (
    id,
    created_date_at,
    updated_date_at,
    question_id,
    text,
    is_correct
)
SELECT
    gen_random_uuid(),
    NOW(),
    NOW(),
    q.id,
    data.text,
    data.is_correct
FROM questions_cte q
         JOIN LATERAL (
    VALUES

        ('Qual foi uma das principais causas das grandes navegações?', 'Busca por especiarias', TRUE),
        ('Qual foi uma das principais causas das grandes navegações?', 'Construção de cidades', FALSE),
        ('Qual foi uma das principais causas das grandes navegações?', 'Criação de universidades', FALSE),

        ('Além da economia, qual outro fator incentivou as navegações?', 'Expansão religiosa', TRUE),
        ('Além da economia, qual outro fator incentivou as navegações?', 'Clima europeu', FALSE),
        ('Além da economia, qual outro fator incentivou as navegações?', 'Crescimento populacional', FALSE),

        ('Qual foi uma consequência da chegada dos portugueses para os povos indígenas?', 'Maior autonomia', FALSE),
        ('Qual foi uma consequência da chegada dos portugueses para os povos indígenas?', 'Perda de terras e conflitos', TRUE),
        ('Qual foi uma consequência da chegada dos portugueses para os povos indígenas?', 'Isolamento total', FALSE)

        ) AS data(statement, text, is_correct)
              ON data.statement = q.statement;