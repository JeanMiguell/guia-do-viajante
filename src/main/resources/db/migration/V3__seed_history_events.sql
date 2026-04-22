INSERT INTO history_events (
    id,
    created_date_at,
    updated_date_at,
    name,
    description,
    start_year,
    end_year,
    period_description,
    event_type,
    intro_text
)
VALUES

(
    gen_random_uuid(),
    NOW(),
    NOW(),
    'Chegada dos Portugueses',
    'Chegada da expedição portuguesa ao território brasileiro em 1500.',
    '1500-01-01',
    '1500-12-31',
    'Brasil Pré-Colonial',
    'Marco Inicial',
    'Marca o início do contato entre portugueses e povos indígenas no território brasileiro.'
),

(
    gen_random_uuid(),
    NOW(),
    NOW(),
    'Capitanias Hereditárias',
    'Divisão do território brasileiro em capitanias para facilitar a administração.',
    '1534-01-01',
    '1549-12-31',
    'Brasil Colonial',
    'Administração',
    'Sistema criado por Portugal para organizar a ocupação do território.'
),

(
    gen_random_uuid(),
    NOW(),
    NOW(),
    'Invasões Holandesas',
    'Tentativas de ocupação do território brasileiro pelos holandeses.',
    '1630-01-01',
    '1654-12-31',
    'Brasil Colonial',
    'Conflito',
    'Período de disputas pelo controle econômico e territorial no Brasil.'
),

(
    gen_random_uuid(),
    NOW(),
    NOW(),
    'Chegada da Família Real',
    'Transferência da corte portuguesa para o Brasil em 1808.',
    '1808-01-01',
    '1808-12-31',
    'Período Joanino',
    'Político',
    'Transformou o Brasil em sede do governo português.'
),

(
    gen_random_uuid(),
    NOW(),
    NOW(),
    'Independência do Brasil',
    'Rompimento político com Portugal em 1822.',
    '1822-01-01',
    '1822-12-31',
    'Brasil Império',
    'Político',
    'Marca o fim do período colonial e início do Império.'
),

(
    gen_random_uuid(),
    NOW(),
    NOW(),
    'Abolição da Escravidão',
    'Fim oficial da escravidão no Brasil com a Lei Áurea.',
    '1888-01-01',
    '1888-12-31',
    'Brasil Império',
    'Social',
    'Encerramento de um longo período de escravidão no país.'
),

(
    gen_random_uuid(),
    NOW(),
    NOW(),
    'Proclamação da República',
    'Fim da monarquia e início da República em 1889.',
    '1889-01-01',
    '1889-12-31',
    'Brasil República',
    'Político',
    'Mudança do regime político brasileiro.'
);