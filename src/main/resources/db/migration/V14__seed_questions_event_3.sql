

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

WITH target_event AS (
    SELECT he.id
    FROM history_events he
    WHERE he.name = 'Invasões Holandesas'
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
    'Avaliação Final - Invasões Holandesas',
    75
FROM target_event;

WITH target_activity AS (
    SELECT a.id
    FROM activities a
             JOIN history_events he ON he.id = a.history_event_id
    WHERE he.name = 'Invasões Holandesas'
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

             -- FÁCIL
             ('Por que o Nordeste brasileiro era alvo dos holandeses?', 'MULTIPLE_CHOICE'),
             ('A produção de açúcar era central na economia colonial.', 'TRUE_FALSE'),
             ('Qual região foi invadida com maior sucesso pelos holandeses?', 'MULTIPLE_CHOICE'),
             ('A primeira invasão ocorreu em Pernambuco.', 'TRUE_FALSE'),
             ('Quem foi Maurício de Nassau?', 'MULTIPLE_CHOICE'),

             -- MÉDIO
             ('Por que a União Ibérica influenciou as invasões?', 'MULTIPLE_CHOICE'),
             ('Os holandeses tinham participação no comércio do açúcar antes das invasões.', 'TRUE_FALSE'),
             ('Qual foi um impacto da administração de Nassau?', 'MULTIPLE_CHOICE'),
             ('Como foi a política religiosa durante o domínio holandês?', 'MULTIPLE_CHOICE'),
             ('O que contribuiu para o enfraquecimento do domínio holandês?', 'MULTIPLE_CHOICE'),

             -- DIFÍCIL
             ('Qual alternativa apresenta a sequência correta dos acontecimentos?', 'MULTIPLE_CHOICE'),
             ('Qual foi uma consequência econômica após a expulsão dos holandeses?', 'MULTIPLE_CHOICE'),
             ('A concorrência no Caribe afetou o açúcar brasileiro.', 'TRUE_FALSE'),
             ('Qual relação existe entre economia e invasões holandesas?', 'MULTIPLE_CHOICE'),
             ('Por que o controle do Brasil era estratégico para os europeus?', 'MULTIPLE_CHOICE')

     ) AS data(statement, type);

WITH questions_cte AS (
    SELECT q.id, q.statement, q.type
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN history_events he ON he.id = a.history_event_id
    WHERE he.name = 'Invasões Holandesas'
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

('Por que o Nordeste brasileiro era alvo dos holandeses?', 'Alta produção de açúcar e grande lucro econômico', TRUE),
('Por que o Nordeste brasileiro era alvo dos holandeses?', 'Clima europeu semelhante', FALSE),
('Por que o Nordeste brasileiro era alvo dos holandeses?', 'Ausência de população', FALSE),
('Por que o Nordeste brasileiro era alvo dos holandeses?', 'Apenas interesse religioso', FALSE),

('Qual região foi invadida com maior sucesso pelos holandeses?', 'Pernambuco', TRUE),
('Qual região foi invadida com maior sucesso pelos holandeses?', 'Bahia', FALSE),
('Qual região foi invadida com maior sucesso pelos holandeses?', 'Rio Grande do Sul', FALSE),
('Qual região foi invadida com maior sucesso pelos holandeses?', 'Interior do Brasil', FALSE),

('Quem foi Maurício de Nassau?', 'Administrador holandês no Brasil', TRUE),
('Quem foi Maurício de Nassau?', 'Rei de Portugal', FALSE),
('Quem foi Maurício de Nassau?', 'Explorador espanhol', FALSE),
('Quem foi Maurício de Nassau?', 'Líder indígena', FALSE),

('Por que a União Ibérica influenciou as invasões?', 'Holanda passou a ser inimiga da Espanha', TRUE),
('Por que a União Ibérica influenciou as invasões?', 'Portugal perdeu sua economia', FALSE),
('Por que a União Ibérica influenciou as invasões?', 'Fim da navegação europeia', FALSE),
('Por que a União Ibérica influenciou as invasões?', 'Mudanças climáticas', FALSE),

('Qual foi um impacto da administração de Nassau?', 'Desenvolvimento urbano e científico', TRUE),
('Qual foi um impacto da administração de Nassau?', 'Destruição das cidades', FALSE),
('Qual foi um impacto da administração de Nassau?', 'Fim da produção de açúcar', FALSE),
('Qual foi um impacto da administração de Nassau?', 'Isolamento econômico', FALSE),

('Como foi a política religiosa durante o domínio holandês?', 'Relativa tolerância religiosa', TRUE),
('Como foi a política religiosa durante o domínio holandês?', 'Proibição total de outras religiões', FALSE),
('Como foi a política religiosa durante o domínio holandês?', 'Apenas catolicismo permitido', FALSE),
('Como foi a política religiosa durante o domínio holandês?', 'Sem qualquer religião', FALSE),

('O que contribuiu para o enfraquecimento do domínio holandês?', 'Saída de Maurício de Nassau e conflitos locais', TRUE),
('O que contribuiu para o enfraquecimento do domínio holandês?', 'Aumento da produção de açúcar', FALSE),
('O que contribuiu para o enfraquecimento do domínio holandês?', 'Apoio total dos colonos', FALSE),
('O que contribuiu para o enfraquecimento do domínio holandês?', 'Fim do comércio europeu', FALSE),

('Qual alternativa apresenta a sequência correta dos acontecimentos?',
 'Invasão da Bahia (1624) → Expulsão → Invasão de Pernambuco (1630) → Governo de Nassau → Expulsão final (1654)', TRUE),

('Qual alternativa apresenta a sequência correta dos acontecimentos?',
 'Governo de Nassau → Invasão da Bahia → Expulsão → Pernambuco → Expulsão final', FALSE),

('Qual alternativa apresenta a sequência correta dos acontecimentos?',
 'Invasão de Pernambuco → Bahia → Nassau → Expulsão → União Ibérica', FALSE),

('Qual alternativa apresenta a sequência correta dos acontecimentos?',
 'Expulsão final → Nassau → Pernambuco → Bahia', FALSE),

('Qual foi uma consequência econômica após a expulsão dos holandeses?', 'Concorrência do açúcar no Caribe', TRUE),
('Qual foi uma consequência econômica após a expulsão dos holandeses?', 'Fim do açúcar no Brasil', FALSE),
('Qual foi uma consequência econômica após a expulsão dos holandeses?', 'Crescimento industrial', FALSE),
('Qual foi uma consequência econômica após a expulsão dos holandeses?', 'Isolamento econômico', FALSE),

('Qual relação existe entre economia e invasões holandesas?', 'Busca pelo controle da produção açucareira', TRUE),
('Qual relação existe entre economia e invasões holandesas?', 'Motivos exclusivamente religiosos', FALSE),
('Qual relação existe entre economia e invasões holandesas?', 'Ausência de interesse econômico', FALSE),
('Qual relação existe entre economia e invasões holandesas?', 'Controle climático', FALSE),

('Por que o controle do Brasil era estratégico para os europeus?', 'Acesso a recursos e rotas comerciais', TRUE),
('Por que o controle do Brasil era estratégico para os europeus?', 'Clima europeu semelhante', FALSE),
('Por que o controle do Brasil era estratégico para os europeus?', 'Falta de população', FALSE),
('Por que o controle do Brasil era estratégico para os europeus?', 'Motivos apenas culturais', FALSE),

('A produção de açúcar era central na economia colonial.', 'Verdadeiro', TRUE),
('A produção de açúcar era central na economia colonial.', 'Falso', FALSE),

('A primeira invasão ocorreu em Pernambuco.', 'Verdadeiro', FALSE),
('A primeira invasão ocorreu em Pernambuco.', 'Falso', TRUE),

('Os holandeses tinham participação no comércio do açúcar antes das invasões.', 'Verdadeiro', TRUE),
('Os holandeses tinham participação no comércio do açúcar antes das invasões.', 'Falso', FALSE),

('A concorrência no Caribe afetou o açúcar brasileiro.', 'Verdadeiro', TRUE),
('A concorrência no Caribe afetou o açúcar brasileiro.', 'Falso', FALSE)

        ) AS data(statement, text, is_correct)
              ON data.statement = q.statement;