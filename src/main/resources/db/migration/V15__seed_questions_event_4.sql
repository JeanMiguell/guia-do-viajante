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

WITH target_event AS (
    SELECT he.id
    FROM history_events he
    WHERE he.name = 'Chegada da Família Real'
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
    'Avaliação Final - Chegada da Família Real',
    75
FROM target_event;

WITH target_activity AS (
    SELECT a.id
    FROM activities a
             JOIN history_events he ON he.id = a.history_event_id
    WHERE he.name = 'Chegada da Família Real'
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

             ('Por que a família real portuguesa veio para o Brasil?', 'MULTIPLE_CHOICE'),
             ('A vinda da Corte está relacionada às Guerras Napoleônicas.', 'TRUE_FALSE'),
             ('Quem liderava a família real portuguesa nesse período?', 'MULTIPLE_CHOICE'),
             ('A família real permaneceu em Portugal durante a invasão francesa.', 'TRUE_FALSE'),
             ('Qual cidade se tornou capital do Império Português no Brasil?', 'MULTIPLE_CHOICE'),

             ('Qual foi o papel da Inglaterra na vinda da Corte?', 'MULTIPLE_CHOICE'),
             ('A abertura dos portos rompeu o pacto colonial.', 'TRUE_FALSE'),
             ('Qual foi uma consequência imediata da chegada da Corte?', 'MULTIPLE_CHOICE'),
             ('Por que o Brasil foi escolhido como destino?', 'MULTIPLE_CHOICE'),
             ('Qual foi o impacto das novas instituições criadas?', 'MULTIPLE_CHOICE'),

             ('Qual alternativa apresenta a sequência correta dos acontecimentos?', 'MULTIPLE_CHOICE'),
             ('Qual relação existe entre a vinda da Corte e a independência do Brasil?', 'MULTIPLE_CHOICE'),
             ('As mudanças beneficiaram toda a população igualmente.', 'TRUE_FALSE'),
             ('Como a presença da Corte impactou a economia?', 'MULTIPLE_CHOICE'),
             ('Por que a transferência da Corte foi uma decisão estratégica?', 'MULTIPLE_CHOICE')

     ) AS data(statement, type);

WITH questions_cte AS (
    SELECT q.id, q.statement, q.type
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN history_events he ON he.id = a.history_event_id
    WHERE he.name = 'Chegada da Família Real'
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

('Por que a família real portuguesa veio para o Brasil?', 'Para fugir da invasão napoleônica', TRUE),
('Por que a família real portuguesa veio para o Brasil?', 'Para explorar ouro', FALSE),
('Por que a família real portuguesa veio para o Brasil?', 'Para abandonar Portugal', FALSE),
('Por que a família real portuguesa veio para o Brasil?', 'Por motivos climáticos', FALSE),

('Quem liderava a família real portuguesa nesse período?', 'Dom João VI', TRUE),
('Quem liderava a família real portuguesa nesse período?', 'Dom Pedro I', FALSE),
('Quem liderava a família real portuguesa nesse período?', 'Napoleão Bonaparte', FALSE),
('Quem liderava a família real portuguesa nesse período?', 'Vasco da Gama', FALSE),

('Qual cidade se tornou capital do Império Português no Brasil?', 'Rio de Janeiro', TRUE),
('Qual cidade se tornou capital do Império Português no Brasil?', 'Salvador', FALSE),
('Qual cidade se tornou capital do Império Português no Brasil?', 'Lisboa', FALSE),
('Qual cidade se tornou capital do Império Português no Brasil?', 'Recife', FALSE),

-- MÉDIO

('Qual foi o papel da Inglaterra na vinda da Corte?', 'Oferecer apoio naval em troca de vantagens comerciais', TRUE),
('Qual foi o papel da Inglaterra na vinda da Corte?', 'Invadir o Brasil', FALSE),
('Qual foi o papel da Inglaterra na vinda da Corte?', 'Substituir Portugal', FALSE),
('Qual foi o papel da Inglaterra na vinda da Corte?', 'Encerrar o comércio', FALSE),

('Qual foi uma consequência imediata da chegada da Corte?', 'Abertura dos portos e criação de instituições', TRUE),
('Qual foi uma consequência imediata da chegada da Corte?', 'Fim da economia colonial', FALSE),
('Qual foi uma consequência imediata da chegada da Corte?', 'Independência imediata', FALSE),
('Qual foi uma consequência imediata da chegada da Corte?', 'Isolamento do Brasil', FALSE),

('Por que o Brasil foi escolhido como destino?', 'Era a principal colônia e mais segura', TRUE),
('Por que o Brasil foi escolhido como destino?', 'Era o território mais pobre', FALSE),
('Por que o Brasil foi escolhido como destino?', 'Estava sob domínio francês', FALSE),
('Por que o Brasil foi escolhido como destino?', 'Não tinha população', FALSE),

('Qual foi o impacto das novas instituições criadas?', 'Desenvolvimento cultural e administrativo', TRUE),
('Qual foi o impacto das novas instituições criadas?', 'Destruição econômica', FALSE),
('Qual foi o impacto das novas instituições criadas?', 'Fim da educação', FALSE),
('Qual foi o impacto das novas instituições criadas?', 'Isolamento político', FALSE),

-- DIFÍCIL (SEQUÊNCIA)

('Qual alternativa apresenta a sequência correta dos acontecimentos?',
 'Guerras Napoleônicas → Invasão de Portugal → Vinda da Corte → Abertura dos portos → Caminho para independência', TRUE),

('Qual alternativa apresenta a sequência correta dos acontecimentos?',
 'Abertura dos portos → Invasão → Corte → Independência', FALSE),

('Qual alternativa apresenta a sequência correta dos acontecimentos?',
 'Independência → Corte → Invasão → Portos', FALSE),

('Qual alternativa apresenta a sequência correta dos acontecimentos?',
 'Corte → Independência → Invasão → Portos', FALSE),

-- DIFÍCIL

('Qual relação existe entre a vinda da Corte e a independência do Brasil?', 'Aumentou a autonomia e fortaleceu a separação', TRUE),
('Qual relação existe entre a vinda da Corte e a independência do Brasil?', 'Impediu a independência', FALSE),
('Qual relação existe entre a vinda da Corte e a independência do Brasil?', 'Isolou o Brasil', FALSE),
('Qual relação existe entre a vinda da Corte e a independência do Brasil?', 'Eliminou a economia', FALSE),

('Como a presença da Corte impactou a economia?', 'Aumentou o comércio e integrou o Brasil ao mercado internacional', TRUE),
('Como a presença da Corte impactou a economia?', 'Paralisou o comércio', FALSE),
('Como a presença da Corte impactou a economia?', 'Reduziu a produção', FALSE),
('Como a presença da Corte impactou a economia?', 'Isolou o Brasil', FALSE),

('Por que a transferência da Corte foi uma decisão estratégica?', 'Permitiu manter o controle do império com segurança', TRUE),
('Por que a transferência da Corte foi uma decisão estratégica?', 'Abandonou o império', FALSE),
('Por que a transferência da Corte foi uma decisão estratégica?', 'Eliminou conflitos', FALSE),
('Por que a transferência da Corte foi uma decisão estratégica?', 'Impediu o comércio', FALSE),

-- TRUE/FALSE

('A vinda da Corte está relacionada às Guerras Napoleônicas.', 'Verdadeiro', TRUE),
('A vinda da Corte está relacionada às Guerras Napoleônicas.', 'Falso', FALSE),

('A família real permaneceu em Portugal durante a invasão francesa.', 'Verdadeiro', FALSE),
('A família real permaneceu em Portugal durante a invasão francesa.', 'Falso', TRUE),

('A abertura dos portos rompeu o pacto colonial.', 'Verdadeiro', TRUE),
('A abertura dos portos rompeu o pacto colonial.', 'Falso', FALSE),

('As mudanças beneficiaram toda a população igualmente.', 'Verdadeiro', FALSE),
('As mudanças beneficiaram toda a população igualmente.', 'Falso', TRUE)

        ) AS data(statement, text, is_correct)
              ON data.statement = q.statement;