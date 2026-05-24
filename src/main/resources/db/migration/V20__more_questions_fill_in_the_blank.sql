-- Converte mais questoes para FILL_IN_THE_BLANK em multiplos eventos

-- =====================================================================
-- Evento: Chegada da Familia Real
-- =====================================================================

UPDATE questions SET type = 'FILL_IN_THE_BLANK'
WHERE statement = 'Quem liderava a família real portuguesa nesse período?'
  AND id IN (
    SELECT q.id FROM questions q
    JOIN activities a ON a.id = q.activity_id
    JOIN history_events he ON he.id = a.history_event_id
    WHERE he.name = 'Chegada da Família Real'
  );

DELETE FROM answers WHERE question_id IN (
    SELECT q.id FROM questions q
    JOIN activities a ON a.id = q.activity_id
    JOIN history_events he ON he.id = a.history_event_id
    WHERE he.name = 'Chegada da Família Real'
      AND q.statement = 'Quem liderava a família real portuguesa nesse período?'
);

INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, 'Dom João VI', TRUE
FROM questions q
JOIN activities a ON a.id = q.activity_id
JOIN history_events he ON he.id = a.history_event_id
WHERE he.name = 'Chegada da Família Real'
  AND q.statement = 'Quem liderava a família real portuguesa nesse período?';


UPDATE questions SET type = 'FILL_IN_THE_BLANK'
WHERE statement = 'Qual cidade se tornou o centro político do Império?'
  AND id IN (
    SELECT q.id FROM questions q
    JOIN activities a ON a.id = q.activity_id
    JOIN history_events he ON he.id = a.history_event_id
    WHERE he.name = 'Chegada da Família Real'
  );

DELETE FROM answers WHERE question_id IN (
    SELECT q.id FROM questions q
    JOIN activities a ON a.id = q.activity_id
    JOIN history_events he ON he.id = a.history_event_id
    WHERE he.name = 'Chegada da Família Real'
      AND q.statement = 'Qual cidade se tornou o centro político do Império?'
);

INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, 'Rio de Janeiro', TRUE
FROM questions q
JOIN activities a ON a.id = q.activity_id
JOIN history_events he ON he.id = a.history_event_id
WHERE he.name = 'Chegada da Família Real'
  AND q.statement = 'Qual cidade se tornou o centro político do Império?';


UPDATE questions SET type = 'FILL_IN_THE_BLANK'
WHERE statement = 'Qual cidade se tornou capital do Império Português no Brasil?'
  AND id IN (
    SELECT q.id FROM questions q
    JOIN activities a ON a.id = q.activity_id
    JOIN history_events he ON he.id = a.history_event_id
    WHERE he.name = 'Chegada da Família Real'
  );

DELETE FROM answers WHERE question_id IN (
    SELECT q.id FROM questions q
    JOIN activities a ON a.id = q.activity_id
    JOIN history_events he ON he.id = a.history_event_id
    WHERE he.name = 'Chegada da Família Real'
      AND q.statement = 'Qual cidade se tornou capital do Império Português no Brasil?'
);

INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, 'Rio de Janeiro', TRUE
FROM questions q
JOIN activities a ON a.id = q.activity_id
JOIN history_events he ON he.id = a.history_event_id
WHERE he.name = 'Chegada da Família Real'
  AND q.statement = 'Qual cidade se tornou capital do Império Português no Brasil?';


-- =====================================================================
-- Evento: Independencia do Brasil
-- =====================================================================

UPDATE questions SET type = 'FILL_IN_THE_BLANK'
WHERE statement = 'Quem permaneceu no Brasil como regente em 1821?'
  AND id IN (
    SELECT q.id FROM questions q
    JOIN activities a ON a.id = q.activity_id
    JOIN history_events he ON he.id = a.history_event_id
    WHERE he.name = 'Independência do Brasil'
  );

DELETE FROM answers WHERE question_id IN (
    SELECT q.id FROM questions q
    JOIN activities a ON a.id = q.activity_id
    JOIN history_events he ON he.id = a.history_event_id
    WHERE he.name = 'Independência do Brasil'
      AND q.statement = 'Quem permaneceu no Brasil como regente em 1821?'
);

INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, 'Dom Pedro', TRUE
FROM questions q
JOIN activities a ON a.id = q.activity_id
JOIN history_events he ON he.id = a.history_event_id
WHERE he.name = 'Independência do Brasil'
  AND q.statement = 'Quem permaneceu no Brasil como regente em 1821?';


UPDATE questions
SET type = 'FILL_IN_THE_BLANK',
    statement = 'Em 1815, o Brasil foi elevado à categoria de ___________, deixando de ser colônia.'
WHERE statement = 'Qual mudança aumentou a autonomia do Brasil antes da independência?'
  AND id IN (
    SELECT q.id FROM questions q
    JOIN activities a ON a.id = q.activity_id
    JOIN units u ON u.id = a.unit_id
    JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Independência do Brasil'
      AND u.title = 'Caminho para a Independência'
  );

DELETE FROM answers WHERE question_id IN (
    SELECT q.id FROM questions q
    JOIN activities a ON a.id = q.activity_id
    JOIN units u ON u.id = a.unit_id
    JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Independência do Brasil'
      AND u.title = 'Caminho para a Independência'
      AND q.statement = 'Em 1815, o Brasil foi elevado à categoria de ___________, deixando de ser colônia.'
);

INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, 'Reino Unido', TRUE
FROM questions q
JOIN activities a ON a.id = q.activity_id
JOIN units u ON u.id = a.unit_id
JOIN history_events he ON he.id = u.history_event_id
WHERE he.name = 'Independência do Brasil'
  AND u.title = 'Caminho para a Independência'
  AND q.statement = 'Em 1815, o Brasil foi elevado à categoria de ___________, deixando de ser colônia.';


-- =====================================================================
-- Evento: Abolicao da Escravidao
-- =====================================================================

UPDATE questions
SET type = 'FILL_IN_THE_BLANK',
    statement = 'A lei que aboliu definitivamente a escravidão no Brasil em 1888 ficou conhecida como Lei ___________.'
WHERE statement = 'Qual foi o resultado dessas pressões?'
  AND id IN (
    SELECT q.id FROM questions q
    JOIN activities a ON a.id = q.activity_id
    JOIN units u ON u.id = a.unit_id
    JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Abolição da Escravidão'
      AND u.title = 'Pressões pela Abolição'
  );

DELETE FROM answers WHERE question_id IN (
    SELECT q.id FROM questions q
    JOIN activities a ON a.id = q.activity_id
    JOIN units u ON u.id = a.unit_id
    JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Abolição da Escravidão'
      AND u.title = 'Pressões pela Abolição'
      AND q.statement = 'A lei que aboliu definitivamente a escravidão no Brasil em 1888 ficou conhecida como Lei ___________.'
);

INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, 'Áurea', TRUE
FROM questions q
JOIN activities a ON a.id = q.activity_id
JOIN units u ON u.id = a.unit_id
JOIN history_events he ON he.id = u.history_event_id
WHERE he.name = 'Abolição da Escravidão'
  AND u.title = 'Pressões pela Abolição'
  AND q.statement = 'A lei que aboliu definitivamente a escravidão no Brasil em 1888 ficou conhecida como Lei ___________.';


UPDATE questions
SET type = 'FILL_IN_THE_BLANK',
    statement = 'A Princesa ___________ assinou a Lei Áurea em 1888, abolindo a escravidão no Brasil.'
WHERE statement = 'Qual foi o papel da princesa Isabel?'
  AND id IN (
    SELECT q.id FROM questions q
    JOIN activities a ON a.id = q.activity_id
    JOIN history_events he ON he.id = a.history_event_id
    WHERE he.name = 'Abolição da Escravidão'
  );

DELETE FROM answers WHERE question_id IN (
    SELECT q.id FROM questions q
    JOIN activities a ON a.id = q.activity_id
    JOIN history_events he ON he.id = a.history_event_id
    WHERE he.name = 'Abolição da Escravidão'
      AND q.statement = 'A Princesa ___________ assinou a Lei Áurea em 1888, abolindo a escravidão no Brasil.'
);

INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, 'Isabel', TRUE
FROM questions q
JOIN activities a ON a.id = q.activity_id
JOIN history_events he ON he.id = a.history_event_id
WHERE he.name = 'Abolição da Escravidão'
  AND q.statement = 'A Princesa ___________ assinou a Lei Áurea em 1888, abolindo a escravidão no Brasil.';


-- =====================================================================
-- Evento: Proclamacao da Republica
-- =====================================================================

UPDATE questions SET type = 'FILL_IN_THE_BLANK'
WHERE statement = 'Quem liderou a Proclamação da República?'
  AND id IN (
    SELECT q.id FROM questions q
    JOIN activities a ON a.id = q.activity_id
    JOIN units u ON u.id = a.unit_id
    JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Proclamação da República'
      AND u.title = 'O Movimento Republicano'
  );

DELETE FROM answers WHERE question_id IN (
    SELECT q.id FROM questions q
    JOIN activities a ON a.id = q.activity_id
    JOIN units u ON u.id = a.unit_id
    JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Proclamação da República'
      AND u.title = 'O Movimento Republicano'
      AND q.statement = 'Quem liderou a Proclamação da República?'
);

INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, 'Deodoro da Fonseca', TRUE
FROM questions q
JOIN activities a ON a.id = q.activity_id
JOIN units u ON u.id = a.unit_id
JOIN history_events he ON he.id = u.history_event_id
WHERE he.name = 'Proclamação da República'
  AND u.title = 'O Movimento Republicano'
  AND q.statement = 'Quem liderou a Proclamação da República?';


UPDATE questions SET type = 'FILL_IN_THE_BLANK'
WHERE statement = 'Quem liderou o movimento de 1889?'
  AND id IN (
    SELECT q.id FROM questions q
    JOIN activities a ON a.id = q.activity_id
    JOIN history_events he ON he.id = a.history_event_id
    WHERE he.name = 'Proclamação da República'
      AND a.type = 'ASSESSMENT'
  );

DELETE FROM answers WHERE question_id IN (
    SELECT q.id FROM questions q
    JOIN activities a ON a.id = q.activity_id
    JOIN history_events he ON he.id = a.history_event_id
    WHERE he.name = 'Proclamação da República'
      AND a.type = 'ASSESSMENT'
      AND q.statement = 'Quem liderou o movimento de 1889?'
);

INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, 'Deodoro da Fonseca', TRUE
FROM questions q
JOIN activities a ON a.id = q.activity_id
JOIN history_events he ON he.id = a.history_event_id
WHERE he.name = 'Proclamação da República'
  AND a.type = 'ASSESSMENT'
  AND q.statement = 'Quem liderou o movimento de 1889?';


-- =====================================================================
-- Capitanias Hereditarias
-- =====================================================================

UPDATE questions
SET type = 'FILL_IN_THE_BLANK',
    statement = 'Os nobres responsáveis por administrar as capitanias eram chamados de ___________.'
WHERE statement = 'Quem recebia a administração das capitanias?'
  AND id IN (
    SELECT q.id FROM questions q
    JOIN activities a ON a.id = q.activity_id
    JOIN history_events he ON he.id = a.history_event_id
    WHERE he.name = 'Capitanias Hereditárias'
      AND a.type = 'ASSESSMENT'
  );

DELETE FROM answers WHERE question_id IN (
    SELECT q.id FROM questions q
    JOIN activities a ON a.id = q.activity_id
    JOIN history_events he ON he.id = a.history_event_id
    WHERE he.name = 'Capitanias Hereditárias'
      AND a.type = 'ASSESSMENT'
      AND q.statement = 'Os nobres responsáveis por administrar as capitanias eram chamados de ___________.'
);

INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, 'Donatários', TRUE
FROM questions q
JOIN activities a ON a.id = q.activity_id
JOIN history_events he ON he.id = a.history_event_id
WHERE he.name = 'Capitanias Hereditárias'
  AND a.type = 'ASSESSMENT'
  AND q.statement = 'Os nobres responsáveis por administrar as capitanias eram chamados de ___________.';
