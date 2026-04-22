

WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Invasões Holandesas'
      AND u.title = 'Disputa pelo Brasil'
    LIMIT 1
    )
INSERT INTO activities (
    id, created_date_at, updated_date_at,
    unit_id, history_event_id, type, title, minimum_score
)
SELECT
    gen_random_uuid(), NOW(), NOW(),
    target_unit.id, NULL, 'FIXATION',
    'Exercícios de Fixação - Disputa pelo Brasil', NULL
FROM target_unit;

WITH target_activity AS (
    SELECT a.id
    FROM activities a
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Invasões Holandesas'
      AND u.title = 'Disputa pelo Brasil'
      AND a.type = 'FIXATION'
    ORDER BY a.created_date_at DESC
    LIMIT 1
    )
INSERT INTO questions (id, created_date_at, updated_date_at, activity_id, statement, type)
SELECT gen_random_uuid(), NOW(), NOW(), target_activity.id, data.statement, data.type
FROM target_activity,
     (
         VALUES
             ('Por que o Nordeste brasileiro era alvo de interesse dos holandeses?', 'MULTIPLE_CHOICE'),
             ('A União Ibérica contribuiu para as invasões holandesas no Brasil.', 'TRUE_FALSE'),
             ('Qual foi a primeira região invadida pelos holandeses no Brasil?', 'MULTIPLE_CHOICE')
     ) AS data(statement, type);

WITH questions_cte AS (
    SELECT q.id, q.statement, q.type
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Invasões Holandesas'
      AND u.title = 'Disputa pelo Brasil'
      AND a.type = 'FIXATION'
)
INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, data.text, data.is_correct
FROM questions_cte q
         JOIN LATERAL (
    VALUES
        ('Por que o Nordeste brasileiro era alvo de interesse dos holandeses?', 'Por causa da produção de açúcar', TRUE),
        ('Por que o Nordeste brasileiro era alvo de interesse dos holandeses?', 'Por causa da mineração de ouro', FALSE),
        ('Por que o Nordeste brasileiro era alvo de interesse dos holandeses?', 'Por causa do clima frio', FALSE),

        ('A União Ibérica contribuiu para as invasões holandesas no Brasil.', 'Verdadeiro', TRUE),
        ('A União Ibérica contribuiu para as invasões holandesas no Brasil.', 'Falso', FALSE),

        ('Qual foi a primeira região invadida pelos holandeses no Brasil?', 'Bahia', TRUE),
        ('Qual foi a primeira região invadida pelos holandeses no Brasil?', 'Rio de Janeiro', FALSE),
        ('Qual foi a primeira região invadida pelos holandeses no Brasil?', 'São Paulo', FALSE)
        ) AS data(statement, text, is_correct)
              ON data.statement = q.statement;

WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Invasões Holandesas'
      AND u.title = 'Os Holandeses no Nordeste'
    LIMIT 1
    )
INSERT INTO activities (
    id, created_date_at, updated_date_at,
    unit_id, history_event_id, type, title, minimum_score
)
SELECT
    gen_random_uuid(), NOW(), NOW(),
    target_unit.id, NULL, 'FIXATION',
    'Exercícios de Fixação - Holandeses no Nordeste', NULL
FROM target_unit;

WITH target_activity AS (
    SELECT a.id
    FROM activities a
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Invasões Holandesas'
      AND u.title = 'Os Holandeses no Nordeste'
      AND a.type = 'FIXATION'
    ORDER BY a.created_date_at DESC
    LIMIT 1
    )
INSERT INTO questions (id, created_date_at, updated_date_at, activity_id, statement, type)
SELECT gen_random_uuid(), NOW(), NOW(), target_activity.id, data.statement, data.type
FROM target_activity,
     (
         VALUES
             ('Quem governou o Brasil holandês durante seu período mais organizado?', 'MULTIPLE_CHOICE'),
             ('Durante o domínio holandês, houve investimentos urbanos em Recife.', 'TRUE_FALSE'),
             ('Qual atividade econômica foi mantida pelos holandeses?', 'MULTIPLE_CHOICE')
     ) AS data(statement, type);

WITH questions_cte AS (
    SELECT q.id, q.statement
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Invasões Holandesas'
      AND u.title = 'Os Holandeses no Nordeste'
      AND a.type = 'FIXATION'
)
INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, data.text, data.is_correct
FROM questions_cte q
         JOIN LATERAL (
    VALUES
        ('Quem governou o Brasil holandês durante seu período mais organizado?', 'Maurício de Nassau', TRUE),
        ('Quem governou o Brasil holandês durante seu período mais organizado?', 'Dom Pedro I', FALSE),
        ('Quem governou o Brasil holandês durante seu período mais organizado?', 'Tiradentes', FALSE),

        ('Durante o domínio holandês, houve investimentos urbanos em Recife.', 'Verdadeiro', TRUE),
        ('Durante o domínio holandês, houve investimentos urbanos em Recife.', 'Falso', FALSE),

        ('Qual atividade econômica foi mantida pelos holandeses?', 'Produção de açúcar', TRUE),
        ('Qual atividade econômica foi mantida pelos holandeses?', 'Produção de petróleo', FALSE),
        ('Qual atividade econômica foi mantida pelos holandeses?', 'Indústria automobilística', FALSE)
        ) AS data(statement, text, is_correct)
              ON data.statement = q.statement;

WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Invasões Holandesas'
      AND u.title = 'Consequências das Invasões'
    LIMIT 1
    )
INSERT INTO activities (
    id, created_date_at, updated_date_at,
    unit_id, history_event_id, type, title, minimum_score
)
SELECT
    gen_random_uuid(), NOW(), NOW(),
    target_unit.id, NULL, 'FIXATION',
    'Exercícios de Fixação - Consequências', NULL
FROM target_unit;

WITH target_activity AS (
    SELECT a.id
    FROM activities a
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Invasões Holandesas'
      AND u.title = 'Consequências das Invasões'
      AND a.type = 'FIXATION'
    ORDER BY a.created_date_at DESC
    LIMIT 1
    )
INSERT INTO questions (id, created_date_at, updated_date_at, activity_id, statement, type)
SELECT gen_random_uuid(), NOW(), NOW(), target_activity.id, data.statement, data.type
FROM target_activity,
     (
         VALUES
             ('Após a saída dos holandeses, houve aumento da concorrência no mercado de açúcar.', 'TRUE_FALSE'),
             ('Por que a economia do Nordeste foi afetada após a saída dos holandeses?', 'MULTIPLE_CHOICE'),
             ('A expulsão dos holandeses fortaleceu o controle português no Brasil.', 'TRUE_FALSE')
     ) AS data(statement, type);

WITH questions_cte AS (
    SELECT q.id, q.statement
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Invasões Holandesas'
      AND u.title = 'Consequências das Invasões'
      AND a.type = 'FIXATION'
)
INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, data.text, data.is_correct
FROM questions_cte q
         JOIN LATERAL (
    VALUES
        ('Após a saída dos holandeses, houve aumento da concorrência no mercado de açúcar.', 'Verdadeiro', TRUE),
        ('Após a saída dos holandeses, houve aumento da concorrência no mercado de açúcar.', 'Falso', FALSE),

        ('Por que a economia do Nordeste foi afetada após a saída dos holandeses?', 'Porque surgiu concorrência internacional', TRUE),
        ('Por que a economia do Nordeste foi afetada após a saída dos holandeses?', 'Porque acabou o açúcar no Brasil', FALSE),
        ('Por que a economia do Nordeste foi afetada após a saída dos holandeses?', 'Porque a população desapareceu', FALSE),

        ('A expulsão dos holandeses fortaleceu o controle português no Brasil.', 'Verdadeiro', TRUE),
        ('A expulsão dos holandeses fortaleceu o controle português no Brasil.', 'Falso', FALSE)
        ) AS data(statement, text, is_correct)
              ON data.statement = q.statement;