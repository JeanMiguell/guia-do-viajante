WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Proclamação da República'
      AND u.title = 'Fim da Monarquia'
    LIMIT 1
    )

INSERT INTO unit_contents (
    id,
    created_date_at,
    updated_date_at,
    unit_id,
    title,
    content,
    image_url,
    hint,
    page_order
)
SELECT
    gen_random_uuid(),
    NOW(),
    NOW(),
    target_unit.id,
    data.title,
    data.content,
    NULL,
    data.hint,
    data.page_order
FROM target_unit,
     (
         VALUES
             (
                 'O Brasil no final do Império',
                 'No final do século XIX, o Brasil ainda era uma monarquia governada por Dom Pedro II. Apesar de avanços em algumas áreas, o modelo monárquico enfrentava críticas e perda de apoio político. Grupos como militares, fazendeiros e setores urbanos começaram a questionar a permanência da monarquia, principalmente por acreditarem que ela não atendia mais aos interesses do país.',
                 'Dica: Por que um sistema político pode perder apoio ao longo do tempo?',
                 1
             ),
             (
                 'Crise política e insatisfação',
                 'A monarquia brasileira enfrentava uma série de crises políticas, incluindo conflitos com a Igreja, insatisfação dos militares e descontentamento das elites econômicas. A abolição da escravidão em 1888 também contribuiu para o desgaste do governo, pois parte dos fazendeiros perdeu apoio à monarquia após não receber indenizações.',
                 'Dica: Como diferentes grupos podem influenciar a estabilidade de um governo?',
                 2
             ),
             (
                 'O enfraquecimento da monarquia',
                 'Com o passar do tempo, Dom Pedro II foi perdendo apoio político e popular. A ausência de um sucessor forte e as constantes tensões internas contribuíram para o enfraquecimento do regime monárquico, abrindo espaço para a ideia de um novo modelo de governo.',
                 'Dica: O que acontece quando um governo perde apoio da população e das elites?',
                 3
             ),
             (
                 'Ideias republicanas',
                 'As ideias republicanas, que defendiam o fim da monarquia e a implantação de um governo baseado na eleição de representantes, começaram a ganhar força no Brasil. Essas ideias foram influenciadas por outros países e por movimentos internos que buscavam maior participação política.',
                 'Dica: O que diferencia uma monarquia de uma república?',
                 4
             )
     ) AS data(title, content, hint, page_order);


WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Proclamação da República'
      AND u.title = 'O Movimento Republicano'
    LIMIT 1
    )

INSERT INTO unit_contents (
    id,
    created_date_at,
    updated_date_at,
    unit_id,
    title,
    content,
    image_url,
    hint,
    page_order
)
SELECT
    gen_random_uuid(),
    NOW(),
    NOW(),
    target_unit.id,
    data.title,
    data.content,
    NULL,
    data.hint,
    data.page_order
FROM target_unit,
     (
         VALUES
             (
                 'O crescimento do movimento republicano',
                 'Ao longo do século XIX, o movimento republicano foi ganhando força no Brasil, especialmente entre militares, intelectuais e parte das elites urbanas. Esses grupos defendiam mudanças no sistema político, buscando maior participação e modernização do país.',
                 'Dica: Por que diferentes grupos sociais apoiariam mudanças políticas?',
                 1
             ),
             (
                 'O papel dos militares',
                 'Os militares tiveram um papel fundamental na Proclamação da República. Insatisfeitos com o governo monárquico, eles se organizaram e passaram a defender a mudança de regime. Esse descontentamento foi um dos fatores decisivos para a queda da monarquia.',
                 'Dica: Por que o apoio dos militares é importante em mudanças de governo?',
                 2
             ),
             (
                 'O 15 de novembro de 1889',
                 'No dia 15 de novembro de 1889, um movimento liderado pelo marechal Deodoro da Fonseca proclamou a República no Brasil. Dom Pedro II foi deposto e enviado ao exílio, encerrando o período monárquico no país.',
                 'Dica: Por que esse dia é considerado um marco histórico?',
                 3
             ),
             (
                 'A mudança de regime',
                 'A Proclamação da República marcou a transição de um sistema monárquico para um sistema republicano. Essa mudança alterou a forma de governo, introduzindo novas estruturas políticas e administrativas no país.',
                 'Dica: O que muda quando um país troca seu sistema de governo?',
                 4
             )
     ) AS data(title, content, hint, page_order);


WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Proclamação da República'
      AND u.title = 'O Novo Regime'
    LIMIT 1
    )

INSERT INTO unit_contents (
    id,
    created_date_at,
    updated_date_at,
    unit_id,
    title,
    content,
    image_url,
    hint,
    page_order
)
SELECT
    gen_random_uuid(),
    NOW(),
    NOW(),
    target_unit.id,
    data.title,
    data.content,
    NULL,
    data.hint,
    data.page_order
FROM target_unit,
     (
         VALUES
             (
                 'A organização da República',
                 'Após a Proclamação da República, o Brasil iniciou um processo de reorganização política. Foram criadas novas instituições e elaborada uma Constituição em 1891, que estabeleceu as bases do regime republicano e definiu a divisão de poderes.',
                 'Dica: Por que uma nova Constituição é importante após mudanças políticas?',
                 1
             ),
             (
                 'Primeiros desafios do novo regime',
                 'A República enfrentou diversos desafios em seus primeiros anos, como instabilidade política, disputas entre grupos de poder e dificuldades na consolidação do novo sistema. Essas questões marcaram o início da chamada República Velha.',
                 'Dica: Por que mudanças políticas podem gerar instabilidade?',
                 2
             ),
             (
                 'Participação política limitada',
                 'Apesar da mudança para a República, a participação política ainda era restrita a uma pequena parcela da população. Muitos grupos continuaram excluídos do processo político, mantendo desigualdades sociais.',
                 'Dica: O que é necessário para uma participação política mais ampla?',
                 3
             ),
             (
                 'Impactos duradouros',
                 'A Proclamação da República trouxe mudanças importantes na forma de governo do Brasil, influenciando a organização política e administrativa do país até os dias atuais. Mesmo com desafios, marcou o início de uma nova fase na história brasileira.',
                 'Dica: Como essa mudança ainda influencia o Brasil hoje?',
                 4
             )
     ) AS data(title, content, hint, page_order);