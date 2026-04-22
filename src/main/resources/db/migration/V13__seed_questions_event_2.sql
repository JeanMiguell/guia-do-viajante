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