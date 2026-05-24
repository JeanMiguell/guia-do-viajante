WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Capitanias Hereditárias'
      AND u.title = 'Organizando o Território'
    LIMIT 1
    )
INSERT INTO activities (
    id, created_date_at, updated_date_at,
    unit_id, history_event_id, type, title, minimum_score
)
SELECT
    gen_random_uuid(), NOW(), NOW(),
    target_unit.id, NULL, 'FIXATION',
    'Exercícios de Fixação - Organizando o Território', NULL
FROM target_unit;

WITH target_activity AS (
    SELECT a.id
    FROM activities a
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Capitanias Hereditárias'
      AND u.title = 'Organizando o Território'
      AND a.type = 'FIXATION'
    ORDER BY a.created_date_at DESC
    LIMIT 1
    )
INSERT INTO questions (id, created_date_at, updated_date_at, activity_id, statement, type)
SELECT gen_random_uuid(), NOW(), NOW(), target_activity.id, data.statement, 'MULTIPLE_CHOICE'
FROM target_activity,
     (
         VALUES
             ('Por que Portugal decidiu dividir o território brasileiro em capitanias?'),
             ('Como a divisão em capitanias ajudava na administração do território?'),
             ('Qual era o principal objetivo da criação das capitanias hereditárias?')
     ) AS data(statement);

WITH questions_cte AS (
    SELECT q.id, q.statement
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Capitanias Hereditárias'
      AND u.title = 'Organizando o Território'
      AND a.type = 'FIXATION'
)
INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, data.text, data.is_correct
FROM questions_cte q
         JOIN LATERAL (
    VALUES
        ('Por que Portugal decidiu dividir o território brasileiro em capitanias?', 'Porque não tinha recursos para administrar sozinho todo o território', TRUE),
        ('Por que Portugal decidiu dividir o território brasileiro em capitanias?', 'Porque queria reduzir o território brasileiro', FALSE),
        ('Por que Portugal decidiu dividir o território brasileiro em capitanias?', 'Porque perdeu o controle do território', FALSE),

        ('Como a divisão em capitanias ajudava na administração do território?', 'Permitindo que diferentes regiões fossem administradas separadamente', TRUE),
        ('Como a divisão em capitanias ajudava na administração do território?', 'Centralizando todo o poder em uma única cidade', FALSE),
        ('Como a divisão em capitanias ajudava na administração do território?', 'Eliminando a necessidade de governantes locais', FALSE),

        ('Qual era o principal objetivo da criação das capitanias hereditárias?', 'Ocupar, defender e desenvolver economicamente o território', TRUE),
        ('Qual era o principal objetivo da criação das capitanias hereditárias?', 'Aumentar a população indígena', FALSE),
        ('Qual era o principal objetivo da criação das capitanias hereditárias?', 'Encerrar o comércio com a Europa', FALSE)
        ) AS data(statement, text, is_correct)
              ON data.statement = q.statement;

WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Capitanias Hereditárias'
      AND u.title = 'Como Funcionavam as Capitanias'
    LIMIT 1
    )
INSERT INTO activities (
    id, created_date_at, updated_date_at,
    unit_id, history_event_id, type, title, minimum_score
)
SELECT
    gen_random_uuid(), NOW(), NOW(),
    target_unit.id, NULL, 'FIXATION',
    'Exercícios de Fixação - Como Funcionavam as Capitanias', NULL
FROM target_unit;

WITH target_activity AS (
    SELECT a.id
    FROM activities a
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Capitanias Hereditárias'
      AND u.title = 'Como Funcionavam as Capitanias'
      AND a.type = 'FIXATION'
    ORDER BY a.created_date_at DESC
    LIMIT 1
    )
INSERT INTO questions (id, created_date_at, updated_date_at, activity_id, statement, type)
SELECT gen_random_uuid(), NOW(), NOW(), target_activity.id, data.statement, 'MULTIPLE_CHOICE'
FROM target_activity,
     (
         VALUES
             ('Quem eram os donatários e qual era sua função?'),
             ('Qual era a relação entre os donatários e a Coroa portuguesa?'),
             ('Por que o sucesso das capitanias dependia dos donatários?')
     ) AS data(statement);

WITH questions_cte AS (
    SELECT q.id, q.statement
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Capitanias Hereditárias'
      AND u.title = 'Como Funcionavam as Capitanias'
      AND a.type = 'FIXATION'
)
INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, data.text, data.is_correct
FROM questions_cte q
         JOIN LATERAL (
    VALUES
        ('Quem eram os donatários e qual era sua função?', 'Administradores responsáveis por desenvolver e proteger as capitanias', TRUE),
        ('Quem eram os donatários e qual era sua função?', 'Reis que governavam Portugal', FALSE),
        ('Quem eram os donatários e qual era sua função?', 'Indígenas escolhidos para liderar', FALSE),

        ('Qual era a relação entre os donatários e a Coroa portuguesa?', 'Eles administravam a terra, mas o território continuava pertencendo ao rei', TRUE),
        ('Qual era a relação entre os donatários e a Coroa portuguesa?', 'Eles eram donos absolutos da terra', FALSE),
        ('Qual era a relação entre os donatários e a Coroa portuguesa?', 'Eles não tinham ligação com o rei', FALSE),

        ('Por que o sucesso das capitanias dependia dos donatários?', 'Porque eles precisavam investir recursos e organizar a colonização', TRUE),
        ('Por que o sucesso das capitanias dependia dos donatários?', 'Porque o rei controlava tudo diretamente', FALSE),
        ('Por que o sucesso das capitanias dependia dos donatários?', 'Porque não havia administração local', FALSE)
        ) AS data(statement, text, is_correct)
              ON data.statement = q.statement;

WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Capitanias Hereditárias'
      AND u.title = 'Resultados do Sistema'
    LIMIT 1
    )
INSERT INTO activities (
    id, created_date_at, updated_date_at,
    unit_id, history_event_id, type, title, minimum_score
)
SELECT
    gen_random_uuid(), NOW(), NOW(),
    target_unit.id, NULL, 'FIXATION',
    'Exercícios de Fixação - Resultados do Sistema', NULL
FROM target_unit;

WITH target_activity AS (
    SELECT a.id
    FROM activities a
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Capitanias Hereditárias'
      AND u.title = 'Resultados do Sistema'
      AND a.type = 'FIXATION'
    ORDER BY a.created_date_at DESC
    LIMIT 1
    )
INSERT INTO questions (id, created_date_at, updated_date_at, activity_id, statement, type)
SELECT gen_random_uuid(), NOW(), NOW(), target_activity.id, data.statement, 'MULTIPLE_CHOICE'
FROM target_activity,
     (
         VALUES
             ('Por que a maioria das capitanias hereditárias fracassou?'),
             ('O que levou à criação do Governo-Geral?'),
             ('Qual foi uma consequência importante do sistema de capitanias?')
     ) AS data(statement);

WITH questions_cte AS (
    SELECT q.id, q.statement
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN units u ON u.id = a.unit_id
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Capitanias Hereditárias'
      AND u.title = 'Resultados do Sistema'
      AND a.type = 'FIXATION'
)
INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, data.text, data.is_correct
FROM questions_cte q
         JOIN LATERAL (
    VALUES
        ('Por que a maioria das capitanias hereditárias fracassou?', 'Falta de recursos e dificuldades na colonização', TRUE),
        ('Por que a maioria das capitanias hereditárias fracassou?', 'Excesso de apoio da Coroa', FALSE),
        ('Por que a maioria das capitanias hereditárias fracassou?', 'Território pequeno demais', FALSE),

        ('O que levou à criação do Governo-Geral?', 'O fracasso de várias capitanias e necessidade de centralizar o poder', TRUE),
        ('O que levou à criação do Governo-Geral?', 'O sucesso total das capitanias', FALSE),
        ('O que levou à criação do Governo-Geral?', 'A independência do Brasil', FALSE),

        ('Qual foi uma consequência importante do sistema de capitanias?', 'Início da ocupação do território brasileiro', TRUE),
        ('Qual foi uma consequência importante do sistema de capitanias?', 'Fim da colonização', FALSE),
        ('Qual foi uma consequência importante do sistema de capitanias?', 'Isolamento do Brasil', FALSE)
        ) AS data(statement, text, is_correct)
              ON data.statement = q.statement;

WITH target_event AS (
    SELECT he.id
    FROM history_events he
    WHERE he.name = 'Capitanias Hereditárias'
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
    'Avaliação Final - Capitanias Hereditárias',
    70
FROM target_event;

WITH target_activity AS (
    SELECT a.id
    FROM activities a
             JOIN history_events he ON he.id = a.history_event_id
    WHERE he.name = 'Capitanias Hereditárias'
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
             ('Por que Portugal criou o sistema de capitanias hereditárias?', 'MULTIPLE_CHOICE'),
             ('As capitanias eram faixas de terra que iam do litoral ao interior.', 'TRUE_FALSE'),
             ('Quem recebia a administração das capitanias?', 'MULTIPLE_CHOICE'),
             ('Os donatários eram donos absolutos das terras.', 'TRUE_FALSE'),
             ('Qual era uma das principais atividades econômicas incentivadas?', 'MULTIPLE_CHOICE'),

             -- MÉDIO
             ('Por que Portugal transferiu responsabilidades para os donatários?', 'MULTIPLE_CHOICE'),
             ('As capitanias funcionavam de forma totalmente centralizada.', 'TRUE_FALSE'),
             ('Qual era o papel das sesmarias?', 'MULTIPLE_CHOICE'),
             ('Quais eram deveres dos donatários?', 'MULTIPLE_CHOICE'),
             ('A carta de doação e o foral eram documentos importantes do sistema.', 'TRUE_FALSE'),

             -- DIFÍCIL
             ('Por que muitas capitanias fracassaram?', 'MULTIPLE_CHOICE'),
             ('O sucesso das capitanias dependia apenas da Coroa.', 'TRUE_FALSE'),
             ('Qual consequência levou à criação do Governo-Geral?', 'MULTIPLE_CHOICE'),
             ('Qual relação existe entre capitanias e economia colonial?', 'MULTIPLE_CHOICE'),
             ('As capitanias não tiveram impacto na formação do Brasil.', 'TRUE_FALSE')

     ) AS data(statement, type);

WITH questions_cte AS (
    SELECT q.id, q.statement, q.type
    FROM questions q
             JOIN activities a ON a.id = q.activity_id
             JOIN history_events he ON he.id = a.history_event_id
    WHERE he.name = 'Capitanias Hereditárias'
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

-- MÚLTIPLA ESCOLHA

('Por que Portugal criou o sistema de capitanias hereditárias?', 'Para organizar e ocupar o território com menos custos', TRUE),
('Por que Portugal criou o sistema de capitanias hereditárias?', 'Para abandonar a colônia', FALSE),
('Por que Portugal criou o sistema de capitanias hereditárias?', 'Para evitar a agricultura', FALSE),

('Quem recebia a administração das capitanias?', 'Donatários', TRUE),
('Quem recebia a administração das capitanias?', 'Indígenas', FALSE),
('Quem recebia a administração das capitanias?', 'Exploradores estrangeiros', FALSE),

('Qual era uma das principais atividades econômicas incentivadas?', 'Produção de açúcar', TRUE),
('Qual era uma das principais atividades econômicas incentivadas?', 'Indústria pesada', FALSE),
('Qual era uma das principais atividades econômicas incentivadas?', 'Comércio interno europeu', FALSE),

('Por que Portugal transferiu responsabilidades para os donatários?', 'Porque não tinha recursos suficientes', TRUE),
('Por que Portugal transferiu responsabilidades para os donatários?', 'Porque não queria explorar o território', FALSE),
('Por que Portugal transferiu responsabilidades para os donatários?', 'Porque perdeu o território', FALSE),

('Qual era o papel das sesmarias?', 'Distribuir terras para cultivo', TRUE),
('Qual era o papel das sesmarias?', 'Cobrar impostos', FALSE),
('Qual era o papel das sesmarias?', 'Construir navios', FALSE),

('Quais eram deveres dos donatários?', 'Defender, povoar e desenvolver a capitania', TRUE),
('Quais eram deveres dos donatários?', 'Apenas explorar ouro', FALSE),
('Quais eram deveres dos donatários?', 'Não tinham responsabilidades', FALSE),

('Por que muitas capitanias fracassaram?', 'Falta de recursos e dificuldades locais', TRUE),
('Por que muitas capitanias fracassaram?', 'Excesso de apoio da Coroa', FALSE),
('Por que muitas capitanias fracassaram?', 'Facilidade de colonização', FALSE),

('Qual consequência levou à criação do Governo-Geral?', 'Fracasso da maioria das capitanias', TRUE),
('Qual consequência levou à criação do Governo-Geral?', 'Sucesso total das capitanias', FALSE),
('Qual consequência levou à criação do Governo-Geral?', 'Fim da colonização', FALSE),

('Qual relação existe entre capitanias e economia colonial?', 'Basearam a economia agrícola de exportação', TRUE),
('Qual relação existe entre capitanias e economia colonial?', 'Eliminaram o comércio', FALSE),
('Qual relação existe entre capitanias e economia colonial?', 'Criaram indústria moderna', FALSE),

-- TRUE / FALSE

('As capitanias eram faixas de terra que iam do litoral ao interior.', 'Verdadeiro', TRUE),
('As capitanias eram faixas de terra que iam do litoral ao interior.', 'Falso', FALSE),

('Os donatários eram donos absolutos das terras.', 'Verdadeiro', FALSE),
('Os donatários eram donos absolutos das terras.', 'Falso', TRUE),

('As capitanias funcionavam de forma totalmente centralizada.', 'Verdadeiro', FALSE),
('As capitanias funcionavam de forma totalmente centralizada.', 'Falso', TRUE),

('A carta de doação e o foral eram documentos importantes do sistema.', 'Verdadeiro', TRUE),
('A carta de doação e o foral eram documentos importantes do sistema.', 'Falso', FALSE),

('O sucesso das capitanias dependia apenas da Coroa.', 'Verdadeiro', FALSE),
('O sucesso das capitanias dependia apenas da Coroa.', 'Falso', TRUE),

('As capitanias não tiveram impacto na formação do Brasil.', 'Verdadeiro', FALSE),
('As capitanias não tiveram impacto na formação do Brasil.', 'Falso', TRUE)

        ) AS data(statement, text, is_correct)
              ON data.statement = q.statement;