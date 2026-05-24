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

WITH target_event AS (
    SELECT he.id
    FROM history_events he
    WHERE he.name = 'Independência do Brasil'
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
    'Avaliação Final - Independência do Brasil',
    80
FROM target_event;

WITH target_activity AS (
    SELECT a.id
    FROM activities a
             JOIN history_events he ON he.id = a.history_event_id
    WHERE he.name = 'Independência do Brasil'
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

             -- FÁCIL (já não tão fáceis)
             ('Qual fator contribuiu para a insatisfação dos colonos brasileiros?', 'MULTIPLE_CHOICE'),
             ('O pacto colonial limitava a autonomia econômica do Brasil.', 'TRUE_FALSE'),
             ('Qual evento externo influenciou ideias de independência no Brasil?', 'MULTIPLE_CHOICE'),
             ('A independência do Brasil ocorreu sem conflitos.', 'TRUE_FALSE'),
             ('Quem permaneceu no Brasil como regente em 1821?', 'MULTIPLE_CHOICE'),

             -- MÉDIO
             ('Qual foi o impacto do retorno de Dom João VI a Portugal?', 'MULTIPLE_CHOICE'),
             ('As Cortes portuguesas desejavam aumentar a autonomia do Brasil.', 'TRUE_FALSE'),
             ('Por que o "Dia do Fico" foi importante?', 'MULTIPLE_CHOICE'),
             ('Qual foi o significado do Grito do Ipiranga?', 'MULTIPLE_CHOICE'),
             ('Qual foi uma consequência política imediata da independência?', 'MULTIPLE_CHOICE'),

             -- DIFÍCIL
             ('Qual alternativa apresenta a sequência correta dos acontecimentos?', 'MULTIPLE_CHOICE'),
             ('Qual relação existe entre a vinda da Corte e a independência?', 'MULTIPLE_CHOICE'),
             ('A independência transformou imediatamente todas as estruturas sociais.', 'TRUE_FALSE'),
             ('Qual contradição marcou o Brasil independente?', 'MULTIPLE_CHOICE'),
             ('Por que a independência não resolveu todos os problemas do país?', 'MULTIPLE_CHOICE')

     ) AS data(statement, type);

WITH questions_cte AS (
    SELECT q.id, q.statement, q.type
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN history_events he ON he.id = a.history_event_id
    WHERE he.name = 'Independência do Brasil'
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

('Qual fator contribuiu para a insatisfação dos colonos brasileiros?', 'Restrições comerciais impostas por Portugal', TRUE),
('Qual fator contribuiu para a insatisfação dos colonos brasileiros?', 'Excesso de autonomia política', FALSE),
('Qual fator contribuiu para a insatisfação dos colonos brasileiros?', 'Falta de população', FALSE),
('Qual fator contribuiu para a insatisfação dos colonos brasileiros?', 'Clima desfavorável', FALSE),

('Qual evento externo influenciou ideias de independência no Brasil?', 'Revolução Francesa', TRUE),
('Qual evento externo influenciou ideias de independência no Brasil?', 'Idade Média', FALSE),
('Qual evento externo influenciou ideias de independência no Brasil?', 'Queda de Roma', FALSE),
('Qual evento externo influenciou ideias de independência no Brasil?', 'Descobrimento da América', FALSE),

('Quem permaneceu no Brasil como regente em 1821?', 'Dom Pedro', TRUE),
('Quem permaneceu no Brasil como regente em 1821?', 'Dom João VI', FALSE),
('Quem permaneceu no Brasil como regente em 1821?', 'Napoleão', FALSE),
('Quem permaneceu no Brasil como regente em 1821?', 'José Bonifácio', FALSE),

-- MÉDIO

('Qual foi o impacto do retorno de Dom João VI a Portugal?', 'Aumentou as tensões e risco de recolonização', TRUE),
('Qual foi o impacto do retorno de Dom João VI a Portugal?', 'Gerou independência imediata', FALSE),
('Qual foi o impacto do retorno de Dom João VI a Portugal?', 'Eliminou conflitos', FALSE),
('Qual foi o impacto do retorno de Dom João VI a Portugal?', 'Fortaleceu Portugal no Brasil', FALSE),

('Por que o "Dia do Fico" foi importante?', 'Mostrou resistência às ordens portuguesas', TRUE),
('Por que o "Dia do Fico" foi importante?', 'Encerrrou a independência', FALSE),
('Por que o "Dia do Fico" foi importante?', 'Foi decisão da Inglaterra', FALSE),
('Por que o "Dia do Fico" foi importante?', 'Criou o Brasil como república', FALSE),

('Qual foi o significado do Grito do Ipiranga?', 'Declaração da independência', TRUE),
('Qual foi o significado do Grito do Ipiranga?', 'Início da colonização', FALSE),
('Qual foi o significado do Grito do Ipiranga?', 'Fim da monarquia', FALSE),
('Qual foi o significado do Grito do Ipiranga?', 'Acordo com Portugal', FALSE),

('Qual foi uma consequência política imediata da independência?', 'Formação do Império do Brasil', TRUE),
('Qual foi uma consequência política imediata da independência?', 'Fim da escravidão', FALSE),
('Qual foi uma consequência política imediata da independência?', 'República imediata', FALSE),
('Qual foi uma consequência política imediata da independência?', 'Fim da desigualdade', FALSE),

-- DIFÍCIL (SEQUÊNCIA)

('Qual alternativa apresenta a sequência correta dos acontecimentos?',
 'Vinda da Corte → Retorno de Dom João VI → Pressões das Cortes → Dia do Fico → Independência', TRUE),

('Qual alternativa apresenta a sequência correta dos acontecimentos?',
 'Independência → Corte → Fico → Retorno', FALSE),

('Qual alternativa apresenta a sequência correta dos acontecimentos?',
 'Retorno → Independência → Corte → Fico', FALSE),

('Qual alternativa apresenta a sequência correta dos acontecimentos?',
 'Fico → Corte → Independência → Retorno', FALSE),

-- DIFÍCIL

('Qual relação existe entre a vinda da Corte e a independência?', 'Aumentou autonomia e preparou o processo de separação', TRUE),
('Qual relação existe entre a vinda da Corte e a independência?', 'Impediu qualquer mudança', FALSE),
('Qual relação existe entre a vinda da Corte e a independência?', 'Reduziu o poder do Brasil', FALSE),
('Qual relação existe entre a vinda da Corte e a independência?', 'Isolou o território', FALSE),

('Qual contradição marcou o Brasil independente?', 'Independência política com manutenção da escravidão', TRUE),
('Qual contradição marcou o Brasil independente?', 'Fim imediato das desigualdades', FALSE),
('Qual contradição marcou o Brasil independente?', 'Ausência de conflitos', FALSE),
('Qual contradição marcou o Brasil independente?', 'Igualdade social completa', FALSE),

('Por que a independência não resolveu todos os problemas do país?', 'Estruturas sociais e econômicas continuaram', TRUE),
('Por que a independência não resolveu todos os problemas do país?', 'Porque o país deixou de existir', FALSE),
('Por que a independência não resolveu todos os problemas do país?', 'Porque não houve mudanças políticas', FALSE),
('Por que a independência não resolveu todos os problemas do país?', 'Porque o Brasil virou colônia novamente', FALSE),

-- TRUE/FALSE

('O pacto colonial limitava a autonomia econômica do Brasil.', 'Verdadeiro', TRUE),
('O pacto colonial limitava a autonomia econômica do Brasil.', 'Falso', FALSE),

('A independência do Brasil ocorreu sem conflitos.', 'Verdadeiro', FALSE),
('A independência do Brasil ocorreu sem conflitos.', 'Falso', TRUE),

('As Cortes portuguesas desejavam aumentar a autonomia do Brasil.', 'Verdadeiro', FALSE),
('As Cortes portuguesas desejavam aumentar a autonomia do Brasil.', 'Falso', TRUE),

('A independência transformou imediatamente todas as estruturas sociais.', 'Verdadeiro', FALSE),
('A independência transformou imediatamente todas as estruturas sociais.', 'Falso', TRUE)

        ) AS data(statement, text, is_correct)
              ON data.statement = q.statement;