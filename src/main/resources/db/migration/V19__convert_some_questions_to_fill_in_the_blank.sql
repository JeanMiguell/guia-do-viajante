-- Converte questões factuais de resposta curta para FILL_IN_THE_BLANK
-- Estratégia: atualizar o type + deletar alternativas antigas + inserir resposta correta única

-- =====================================================================
-- Evento: Chegada dos Portugueses
-- =====================================================================

-- "Quem comandou a expedição que chegou ao Brasil em 1500?"
UPDATE questions
SET type = 'FILL_IN_THE_BLANK'
WHERE statement = 'Quem comandou a expedição que chegou ao Brasil em 1500?'
  AND id IN (
      SELECT q.id FROM questions q
      JOIN activities a ON a.id = q.activity_id
      JOIN history_events he ON he.id = a.history_event_id
      WHERE he.name = 'Chegada dos Portugueses'
  );

DELETE FROM answers
WHERE question_id IN (
    SELECT q.id FROM questions q
    JOIN activities a ON a.id = q.activity_id
    JOIN history_events he ON he.id = a.history_event_id
    WHERE he.name = 'Chegada dos Portugueses'
      AND q.statement = 'Quem comandou a expedição que chegou ao Brasil em 1500?'
);

INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, 'Pedro Álvares Cabral', TRUE
FROM questions q
JOIN activities a ON a.id = q.activity_id
JOIN history_events he ON he.id = a.history_event_id
WHERE he.name = 'Chegada dos Portugueses'
  AND q.statement = 'Quem comandou a expedição que chegou ao Brasil em 1500?';


-- "Qual recurso natural deu origem ao nome "Brasil"?"
UPDATE questions
SET type = 'FILL_IN_THE_BLANK'
WHERE statement = 'Qual recurso natural deu origem ao nome "Brasil"?'
  AND id IN (
      SELECT q.id FROM questions q
      JOIN activities a ON a.id = q.activity_id
      JOIN history_events he ON he.id = a.history_event_id
      WHERE he.name = 'Chegada dos Portugueses'
  );

DELETE FROM answers
WHERE question_id IN (
    SELECT q.id FROM questions q
    JOIN activities a ON a.id = q.activity_id
    JOIN history_events he ON he.id = a.history_event_id
    WHERE he.name = 'Chegada dos Portugueses'
      AND q.statement = 'Qual recurso natural deu origem ao nome "Brasil"?'
);

INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, 'Pau-brasil', TRUE
FROM questions q
JOIN activities a ON a.id = q.activity_id
JOIN history_events he ON he.id = a.history_event_id
WHERE he.name = 'Chegada dos Portugueses'
  AND q.statement = 'Qual recurso natural deu origem ao nome "Brasil"?';


-- =====================================================================
-- Evento: Capitanias Hereditárias
-- =====================================================================

-- "Qual era o principal objetivo das Capitanias Hereditárias?"
-- → convertida em fixação de lacuna: nome do sistema
UPDATE questions
SET type = 'FILL_IN_THE_BLANK',
    statement = 'O sistema de divisão do Brasil em lotes administrados por donatários recebeu o nome de Capitanias ___________.'
WHERE statement = 'Qual era o principal objetivo das Capitanias Hereditárias?'
  AND id IN (
      SELECT q.id FROM questions q
      JOIN activities a ON a.id = q.activity_id
      JOIN history_events he ON he.id = a.history_event_id
      WHERE he.name = 'Capitanias Hereditárias'
      LIMIT 1
  );

DELETE FROM answers
WHERE question_id IN (
    SELECT q.id FROM questions q
    JOIN activities a ON a.id = q.activity_id
    JOIN history_events he ON he.id = a.history_event_id
    WHERE he.name = 'Capitanias Hereditárias'
      AND q.statement = 'O sistema de divisão do Brasil em lotes administrados por donatários recebeu o nome de Capitanias ___________.'
);

INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, 'Hereditárias', TRUE
FROM questions q
JOIN activities a ON a.id = q.activity_id
JOIN history_events he ON he.id = a.history_event_id
WHERE he.name = 'Capitanias Hereditárias'
  AND q.statement = 'O sistema de divisão do Brasil em lotes administrados por donatários recebeu o nome de Capitanias ___________.';


-- =====================================================================
-- Exercícios de fixação: Grandes Navegações
-- =====================================================================

-- "O que fez Portugal se destacar nas Grandes Navegações?"
-- → resposta curta: investimento em navegação
UPDATE questions
SET type = 'FILL_IN_THE_BLANK',
    statement = 'Qual instrumento de navegação foi essencial para orientar os portugueses em alto mar?'
WHERE statement = 'O que fez Portugal se destacar nas Grandes Navegações?'
  AND id IN (
      SELECT q.id FROM questions q
      JOIN activities a ON a.id = q.activity_id
      JOIN units u ON u.id = a.unit_id
      JOIN history_events he ON he.id = u.history_event_id
      WHERE he.name = 'Chegada dos Portugueses'
        AND u.title = 'As Grandes Navegações'
  );

DELETE FROM answers
WHERE question_id IN (
    SELECT q.id FROM questions q
    JOIN activities a ON a.id = q.activity_id
    JOIN units u ON u.id = a.unit_id
    JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Chegada dos Portugueses'
      AND u.title = 'As Grandes Navegações'
      AND q.statement = 'Qual instrumento de navegação foi essencial para orientar os portugueses em alto mar?'
);

INSERT INTO answers (id, created_date_at, updated_date_at, question_id, text, is_correct)
SELECT gen_random_uuid(), NOW(), NOW(), q.id, 'Bússola', TRUE
FROM questions q
JOIN activities a ON a.id = q.activity_id
JOIN units u ON u.id = a.unit_id
JOIN history_events he ON he.id = u.history_event_id
WHERE he.name = 'Chegada dos Portugueses'
  AND u.title = 'As Grandes Navegações'
  AND q.statement = 'Qual instrumento de navegação foi essencial para orientar os portugueses em alto mar?';
