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

WITH target_event AS (
    SELECT he.id
    FROM history_events he
    WHERE he.name = 'Abolição da Escravidão'
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
    'Avaliação Final - Abolição da Escravidão',
    80
FROM target_event;

WITH target_activity AS (
    SELECT a.id
    FROM activities a
             JOIN history_events he ON he.id = a.history_event_id
    WHERE he.name = 'Abolição da Escravidão'
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

             -- FÁCIL (já com interpretação)
             ('Qual era a principal base econômica da escravidão no Brasil?', 'MULTIPLE_CHOICE'),
             ('A escravidão no Brasil foi um sistema justo e equilibrado.', 'TRUE_FALSE'),
             ('Qual foi uma forma de resistência das pessoas escravizadas?', 'MULTIPLE_CHOICE'),
             ('Os quilombos eram comunidades formadas por pessoas escravizadas fugitivas.', 'TRUE_FALSE'),
             ('Quem participou dos movimentos abolicionistas?', 'MULTIPLE_CHOICE'),

             -- MÉDIO
             ('Por que surgiram leis como a do Ventre Livre?', 'MULTIPLE_CHOICE'),
             ('As leis abolicionistas resolveram completamente a escravidão.', 'TRUE_FALSE'),
             ('Qual foi o papel da Inglaterra no processo abolicionista?', 'MULTIPLE_CHOICE'),
             ('Como mudanças econômicas influenciaram o fim da escravidão?', 'MULTIPLE_CHOICE'),
             ('Qual foi o papel da princesa Isabel?', 'MULTIPLE_CHOICE'),

             -- DIFÍCIL
             ('Qual alternativa apresenta a sequência correta dos acontecimentos?', 'MULTIPLE_CHOICE'),
             ('Qual contradição marcou o fim da escravidão no Brasil?', 'MULTIPLE_CHOICE'),
             ('A abolição garantiu igualdade imediata para todos.', 'TRUE_FALSE'),
             ('Por que a liberdade não foi plenamente efetiva após 1888?', 'MULTIPLE_CHOICE'),
             ('Qual foi um impacto duradouro da escravidão?', 'MULTIPLE_CHOICE')

     ) AS data(statement, type);

WITH questions_cte AS (
    SELECT q.id, q.statement, q.type
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN history_events he ON he.id = a.history_event_id
    WHERE he.name = 'Abolição da Escravidão'
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

('Qual era a principal base econômica da escravidão no Brasil?', 'Produção agrícola como açúcar e café', TRUE),
('Qual era a principal base econômica da escravidão no Brasil?', 'Indústria tecnológica', FALSE),
('Qual era a principal base econômica da escravidão no Brasil?', 'Comércio interno europeu', FALSE),
('Qual era a principal base econômica da escravidão no Brasil?', 'Turismo', FALSE),

('Qual foi uma forma de resistência das pessoas escravizadas?', 'Formação de quilombos', TRUE),
('Qual foi uma forma de resistência das pessoas escravizadas?', 'Apoio ao sistema', FALSE),
('Qual foi uma forma de resistência das pessoas escravizadas?', 'Isolamento total', FALSE),
('Qual foi uma forma de resistência das pessoas escravizadas?', 'Abandono da cultura', FALSE),

('Quem participou dos movimentos abolicionistas?', 'Intelectuais, políticos e população', TRUE),
('Quem participou dos movimentos abolicionistas?', 'Apenas reis', FALSE),
('Quem participou dos movimentos abolicionistas?', 'Somente estrangeiros', FALSE),
('Quem participou dos movimentos abolicionistas?', 'Somente militares', FALSE),

-- MÉDIO

('Por que surgiram leis como a do Ventre Livre?', 'Para reduzir gradualmente a escravidão', TRUE),
('Por que surgiram leis como a do Ventre Livre?', 'Para ampliar a escravidão', FALSE),
('Por que surgiram leis como a do Ventre Livre?', 'Para acabar imediatamente com tudo', FALSE),
('Por que surgiram leis como a do Ventre Livre?', 'Para beneficiar Portugal', FALSE),

('Qual foi o papel da Inglaterra no processo abolicionista?', 'Pressionar pelo fim da escravidão', TRUE),
('Qual foi o papel da Inglaterra no processo abolicionista?', 'Criar a escravidão', FALSE),
('Qual foi o papel da Inglaterra no processo abolicionista?', 'Isolar o Brasil', FALSE),
('Qual foi o papel da Inglaterra no processo abolicionista?', 'Evitar comércio', FALSE),

('Como mudanças econômicas influenciaram o fim da escravidão?', 'Favoreceram o trabalho assalariado', TRUE),
('Como mudanças econômicas influenciaram o fim da escravidão?', 'Fortaleceram o trabalho escravo', FALSE),
('Como mudanças econômicas influenciaram o fim da escravidão?', 'Eliminaram o comércio', FALSE),
('Como mudanças econômicas influenciaram o fim da escravidão?', 'Reduziram população', FALSE),

('Qual foi o papel da princesa Isabel?', 'Assinar a Lei Áurea', TRUE),
('Qual foi o papel da princesa Isabel?', 'Criar a escravidão', FALSE),
('Qual foi o papel da princesa Isabel?', 'Negociar com a França', FALSE),
('Qual foi o papel da princesa Isabel?', 'Governar Portugal', FALSE),

-- DIFÍCIL (SEQUÊNCIA)

('Qual alternativa apresenta a sequência correta dos acontecimentos?',
 'Leis graduais → Pressões internas e externas → Lei Áurea (1888) → Fim oficial da escravidão → Desigualdades persistentes', TRUE),

('Qual alternativa apresenta a sequência correta dos acontecimentos?',
 'Lei Áurea → Escravidão → Pressões → Igualdade total', FALSE),

('Qual alternativa apresenta a sequência correta dos acontecimentos?',
 'Pressões → Igualdade → Escravidão → Lei Áurea', FALSE),

('Qual alternativa apresenta a sequência correta dos acontecimentos?',
 'Escravidão → Igualdade → Lei Áurea → Pressões', FALSE),

-- DIFÍCIL

('Qual contradição marcou o fim da escravidão no Brasil?', 'Liberdade sem apoio social e econômico', TRUE),
('Qual contradição marcou o fim da escravidão no Brasil?', 'Igualdade imediata', FALSE),
('Qual contradição marcou o fim da escravidão no Brasil?', 'Fim da pobreza', FALSE),
('Qual contradição marcou o fim da escravidão no Brasil?', 'Ausência de conflitos', FALSE),

('Por que a liberdade não foi plenamente efetiva após 1888?', 'Falta de apoio como terra e educação', TRUE),
('Por que a liberdade não foi plenamente efetiva após 1888?', 'Excesso de recursos', FALSE),
('Por que a liberdade não foi plenamente efetiva após 1888?', 'Fim da economia', FALSE),
('Por que a liberdade não foi plenamente efetiva após 1888?', 'Controle estrangeiro', FALSE),

('Qual foi um impacto duradouro da escravidão?', 'Desigualdades sociais persistentes', TRUE),
('Qual foi um impacto duradouro da escravidão?', 'Igualdade total', FALSE),
('Qual foi um impacto duradouro da escravidão?', 'Fim da economia', FALSE),
('Qual foi um impacto duradouro da escravidão?', 'Ausência de conflitos', FALSE),

-- TRUE/FALSE

('A escravidão no Brasil foi um sistema justo e equilibrado.', 'Verdadeiro', FALSE),
('A escravidão no Brasil foi um sistema justo e equilibrado.', 'Falso', TRUE),

('Os quilombos eram comunidades formadas por pessoas escravizadas fugitivas.', 'Verdadeiro', TRUE),
('Os quilombos eram comunidades formadas por pessoas escravizadas fugitivas.', 'Falso', FALSE),

('As leis abolicionistas resolveram completamente a escravidão.', 'Verdadeiro', FALSE),
('As leis abolicionistas resolveram completamente a escravidão.', 'Falso', TRUE),

('A abolição garantiu igualdade imediata para todos.', 'Verdadeiro', FALSE),
('A abolição garantiu igualdade imediata para todos.', 'Falso', TRUE)

        ) AS data(statement, text, is_correct)
              ON data.statement = q.statement;