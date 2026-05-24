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

WITH target_event AS (
    SELECT he.id
    FROM history_events he
    WHERE he.name = 'Proclamação da República'
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
    NULL,
    target_event.id,
    'ASSESSMENT',
    'Avaliação Final - Proclamação da República',
    80
FROM target_event;

WITH target_activity AS (
    SELECT a.id
    FROM activities a
             JOIN history_events he ON he.id = a.history_event_id
    WHERE he.name = 'Proclamação da República'
      AND a.type = 'ASSESSMENT'
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
    data.type
FROM target_activity,
     (
         VALUES

             -- FÁCIL (nível interpretativo)
             ('Por que a monarquia começou a perder apoio no Brasil?', 'MULTIPLE_CHOICE'),
             ('A monarquia mantinha apoio total de todos os grupos sociais.', 'TRUE_FALSE'),
             ('Qual grupo teve papel importante na queda da monarquia?', 'MULTIPLE_CHOICE'),
             ('A abolição da escravidão contribuiu para a crise da monarquia.', 'TRUE_FALSE'),
             ('O que defendiam as ideias republicanas?', 'MULTIPLE_CHOICE'),

             -- MÉDIO
             ('Por que os militares apoiaram a República?', 'MULTIPLE_CHOICE'),
             ('A Proclamação da República teve grande participação popular.', 'TRUE_FALSE'),
             ('Quem liderou o movimento de 1889?', 'MULTIPLE_CHOICE'),
             ('Qual foi uma consequência imediata da Proclamação?', 'MULTIPLE_CHOICE'),
             ('Qual foi uma mudança política importante após 1889?', 'MULTIPLE_CHOICE'),

             -- DIFÍCIL
             ('Qual alternativa apresenta a sequência correta dos acontecimentos?', 'MULTIPLE_CHOICE'),
             ('Qual contradição marcou o início da República?', 'MULTIPLE_CHOICE'),
             ('A República garantiu participação política ampla desde o início.', 'TRUE_FALSE'),
             ('Por que a mudança de regime não resolveu todos os problemas?', 'MULTIPLE_CHOICE'),
             ('Qual foi um impacto duradouro da Proclamação da República?', 'MULTIPLE_CHOICE')

     ) AS data(statement, type);

WITH questions_cte AS (
    SELECT q.id, q.statement, q.type
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN history_events he ON he.id = a.history_event_id
    WHERE he.name = 'Proclamação da República'
      AND a.type = 'ASSESSMENT'
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

-- FÁCIL

('Por que a monarquia começou a perder apoio no Brasil?', 'Crises políticas e insatisfação de vários grupos', TRUE),
('Por que a monarquia começou a perder apoio no Brasil?', 'Excesso de participação popular', FALSE),
('Por que a monarquia começou a perder apoio no Brasil?', 'Ausência de conflitos', FALSE),
('Por que a monarquia começou a perder apoio no Brasil?', 'Crescimento econômico total', FALSE),

('Qual grupo teve papel importante na queda da monarquia?', 'Militares', TRUE),
('Qual grupo teve papel importante na queda da monarquia?', 'Camponeses europeus', FALSE),
('Qual grupo teve papel importante na queda da monarquia?', 'Navegadores portugueses', FALSE),
('Qual grupo teve papel importante na queda da monarquia?', 'Indústrias estrangeiras', FALSE),

('O que defendiam as ideias republicanas?', 'Fim da monarquia e governo com representantes', TRUE),
('O que defendiam as ideias republicanas?', 'Retorno ao sistema colonial', FALSE),
('O que defendiam as ideias republicanas?', 'Fim da política', FALSE),
('O que defendiam as ideias republicanas?', 'Domínio estrangeiro', FALSE),

-- MÉDIO

('Por que os militares apoiaram a República?', 'Insatisfação com o governo monárquico', TRUE),
('Por que os militares apoiaram a República?', 'Apoio total ao imperador', FALSE),
('Por que os militares apoiaram a República?', 'Falta de organização', FALSE),
('Por que os militares apoiaram a República?', 'Pressão religiosa', FALSE),

('Quem liderou o movimento de 1889?', 'Deodoro da Fonseca', TRUE),
('Quem liderou o movimento de 1889?', 'Dom Pedro II', FALSE),
('Quem liderou o movimento de 1889?', 'Princesa Isabel', FALSE),
('Quem liderou o movimento de 1889?', 'José Bonifácio', FALSE),

('Qual foi uma consequência imediata da Proclamação?', 'Fim da monarquia', TRUE),
('Qual foi uma consequência imediata da Proclamação?', 'Fim da escravidão', FALSE),
('Qual foi uma consequência imediata da Proclamação?', 'Independência', FALSE),
('Qual foi uma consequência imediata da Proclamação?', 'Domínio estrangeiro', FALSE),

('Qual foi uma mudança política importante após 1889?', 'Criação da Constituição de 1891', TRUE),
('Qual foi uma mudança política importante após 1889?', 'Retorno da monarquia', FALSE),
('Qual foi uma mudança política importante após 1889?', 'Fim das eleições', FALSE),
('Qual foi uma mudança política importante após 1889?', 'Centralização total do poder', FALSE),

-- DIFÍCIL (SEQUÊNCIA)

('Qual alternativa apresenta a sequência correta dos acontecimentos?',
 'Crise da monarquia → Crescimento republicano → Apoio militar → Proclamação → Nova Constituição', TRUE),

('Qual alternativa apresenta a sequência correta dos acontecimentos?',
 'Proclamação → Crise → Constituição → Monarquia', FALSE),

('Qual alternativa apresenta a sequência correta dos acontecimentos?',
 'Constituição → Monarquia → Crise → Proclamação', FALSE),

('Qual alternativa apresenta a sequência correta dos acontecimentos?',
 'República → Monarquia → Crise → Constituição', FALSE),

-- DIFÍCIL

('Qual contradição marcou o início da República?', 'Mudança política sem ampla participação popular', TRUE),
('Qual contradição marcou o início da República?', 'Igualdade total imediata', FALSE),
('Qual contradição marcou o início da República?', 'Fim das elites', FALSE),
('Qual contradição marcou o início da República?', 'Ausência de conflitos', FALSE),

('Por que a mudança de regime não resolveu todos os problemas?', 'Desigualdades sociais e políticas continuaram', TRUE),
('Por que a mudança de regime não resolveu todos os problemas?', 'Porque o país acabou', FALSE),
('Por que a mudança de regime não resolveu todos os problemas?', 'Porque não houve mudanças', FALSE),
('Por que a mudança de regime não resolveu todos os problemas?', 'Porque voltou à colônia', FALSE),

('Qual foi um impacto duradouro da Proclamação da República?', 'Mudança na forma de governo e organização política', TRUE),
('Qual foi um impacto duradouro da Proclamação da República?', 'Fim da economia', FALSE),
('Qual foi um impacto duradouro da Proclamação da República?', 'Igualdade social total', FALSE),
('Qual foi um impacto duradouro da Proclamação da República?', 'Ausência de política', FALSE),

-- TRUE/FALSE

('A monarquia mantinha apoio total de todos os grupos sociais.', 'Verdadeiro', FALSE),
('A monarquia mantinha apoio total de todos os grupos sociais.', 'Falso', TRUE),

('A abolição da escravidão contribuiu para a crise da monarquia.', 'Verdadeiro', TRUE),
('A abolição da escravidão contribuiu para a crise da monarquia.', 'Falso', FALSE),

('A Proclamação da República teve grande participação popular.', 'Verdadeiro', FALSE),
('A Proclamação da República teve grande participação popular.', 'Falso', TRUE),

('A República garantiu participação política ampla desde o início.', 'Verdadeiro', FALSE),
('A República garantiu participação política ampla desde o início.', 'Falso', TRUE)

        ) AS data(statement, text, is_correct)
              ON data.statement = q.statement;