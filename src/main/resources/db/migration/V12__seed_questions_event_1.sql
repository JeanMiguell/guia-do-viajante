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
    'Exercícios de Fixação - As Grandes Navegações',
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
             ('Por que os europeus buscavam novas rotas marítimas no século XV?'),
             ('O que fez Portugal se destacar nas Grandes Navegações?'),
             ('Qual foi uma consequência importante da Expansão Marítima?')
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
        ('Por que os europeus buscavam novas rotas marítimas no século XV?', 'Para obter especiarias diretamente e reduzir custos', TRUE),
        ('Por que os europeus buscavam novas rotas marítimas no século XV?', 'Para fugir de guerras internas', FALSE),
        ('Por que os europeus buscavam novas rotas marítimas no século XV?', 'Para explorar o Ártico', FALSE),

        ('O que fez Portugal se destacar nas Grandes Navegações?', 'Investimento em navegação e tecnologia marítima', TRUE),
        ('O que fez Portugal se destacar nas Grandes Navegações?', 'Maior população da Europa', FALSE),
        ('O que fez Portugal se destacar nas Grandes Navegações?', 'Localização no interior', FALSE),

        ('Qual foi uma consequência importante da Expansão Marítima?', 'Ampliação do contato entre continentes', TRUE),
        ('Qual foi uma consequência importante da Expansão Marítima?', 'Fim do comércio europeu', FALSE),
        ('Qual foi uma consequência importante da Expansão Marítima?', 'Redução das viagens marítimas', FALSE)
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
    'Exercícios de Fixação - A Jornada até o Brasil',
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
             ('Qual era o verdadeiro objetivo da viagem de Cabral?'),
             ('Por que os portugueses usaram a "volta do mar"?'),
             ('Qual fator permitiu a navegação em longas distâncias?')
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
        ('Qual era o verdadeiro objetivo da viagem de Cabral?', 'Chegar às Índias para comércio', TRUE),
        ('Qual era o verdadeiro objetivo da viagem de Cabral?', 'Descobrir o Brasil', FALSE),
        ('Qual era o verdadeiro objetivo da viagem de Cabral?', 'Colonizar imediatamente', FALSE),

        ('Por que os portugueses usaram a "volta do mar"?', 'Para aproveitar ventos e correntes', TRUE),
        ('Por que os portugueses usaram a "volta do mar"?', 'Para evitar contato com outros países', FALSE),
        ('Por que os portugueses usaram a "volta do mar"?', 'Para encurtar caminho direto', FALSE),

        ('Qual fator permitiu a navegação em longas distâncias?', 'Uso de instrumentos como bússola', TRUE),
        ('Qual fator permitiu a navegação em longas distâncias?', 'Uso de motores a vapor', FALSE),
        ('Qual fator permitiu a navegação em longas distâncias?', 'Uso de mapas modernos', FALSE)
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
    'Exercícios de Fixação - Impactos da Chegada',
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
             ('Além da economia, qual outro objetivo motivava as navegações?'),
             ('Qual foi um impacto para os povos indígenas?'),
             ('Por que a chegada dos portugueses marcou o início da colonização?')
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
        ('Além da economia, qual outro objetivo motivava as navegações?', 'Expansão religiosa', TRUE),
        ('Além da economia, qual outro objetivo motivava as navegações?', 'Clima europeu', FALSE),
        ('Além da economia, qual outro objetivo motivava as navegações?', 'Lazer', FALSE),

        ('Qual foi um impacto para os povos indígenas?', 'Perda de terras e conflitos', TRUE),
        ('Qual foi um impacto para os povos indígenas?', 'Maior autonomia', FALSE),
        ('Qual foi um impacto para os povos indígenas?', 'Isolamento total', FALSE),

        ('Por que a chegada dos portugueses marcou o início da colonização?', 'Início da ocupação e exploração do território', TRUE),
        ('Por que a chegada dos portugueses marcou o início da colonização?', 'Fim das navegações', FALSE),
        ('Por que a chegada dos portugueses marcou o início da colonização?', 'Isolamento do Brasil', FALSE)
        ) AS data(statement, text, is_correct)
              ON data.statement = q.statement;