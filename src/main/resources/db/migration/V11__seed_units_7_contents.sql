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
    data.image_url,
    data.hint,
    data.page_order
FROM target_unit,
     (
         VALUES
             (
                 'O Brasil no final do Império',
                 'O Brasil no final do século XIX ainda era uma monarquia governada por Dom Pedro II. Apesar de avanços em áreas como educação e infraestrutura, o modelo monárquico começava a enfrentar críticas e perda de apoio político. Grupos como militares, fazendeiros e setores urbanos passaram a questionar a permanência da monarquia, especialmente por acreditarem que ela não atendia mais às necessidades de modernização do país. Além disso, novas ideias políticas circulavam, defendendo maior participação popular. Esse cenário de mudanças contribuiu para o enfraquecimento gradual do regime monárquico.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777930118/ChatGPT_Image_4_de_mai._de_2026_17_28_26_bor7rm.png',
                 'Dica: Por que um sistema político pode perder apoio ao longo do tempo?',
                 1
             ),
             (
                 'Crise política e insatisfação',
                 'A monarquia brasileira enfrentava uma série de crises políticas, incluindo conflitos com a Igreja, insatisfação dos militares e descontentamento das elites econômicas. A abolição da escravidão em 1888 também contribuiu para o desgaste do governo, pois muitos fazendeiros ficaram insatisfeitos por não receber indenizações. Esses fatores enfraqueceram o apoio ao imperador. A soma dessas tensões criou um ambiente de instabilidade política, no qual diferentes grupos passaram a defender mudanças no sistema de governo.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777930803/ChatGPT_Image_4_de_mai._de_2026_17_34_31_hb4o6t.png',
                 'Dica: Como diferentes grupos podem influenciar a estabilidade de um governo?',
                 2
             ),
             (
                 'O enfraquecimento da monarquia',
                 'Com o passar do tempo, Dom Pedro II foi perdendo apoio político e popular. A ausência de um sucessor forte e as constantes tensões internas contribuíram para o enfraquecimento do regime monárquico. Além disso, o imperador já não demonstrava o mesmo interesse em governar como antes, o que aumentava a insegurança em relação ao futuro do país. Esse enfraquecimento abriu espaço para o crescimento de ideias que defendiam a substituição da monarquia por outro sistema.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777931025/ChatGPT_Image_4_de_mai._de_2026_17_39_56_lifv22.png',
                 'Dica: O que acontece quando um governo perde apoio da população e das elites?',
                 3
             ),
             (
                 'Ideias republicanas',
                 'As ideias republicanas, que defendiam o fim da monarquia e a implantação de um governo baseado na eleição de representantes, começaram a ganhar força no Brasil. Essas ideias foram influenciadas por experiências de outros países, como os Estados Unidos, e por movimentos internos que buscavam maior participação política. O republicanismo passou a ser visto como uma alternativa mais moderna e adequada para o país. Com o tempo, essas ideias conquistaram apoio de diferentes grupos sociais.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777931392/ChatGPT_Image_4_de_mai._de_2026_17_46_54_ncv5db.png',
                 'Dica: O que diferencia uma monarquia de uma república?',
                 4
             )
     ) AS data(title, content, image_url, hint, page_order);


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
    data.image_url,
    data.hint,
    data.page_order
FROM target_unit,
     (
         VALUES
             (
                 'O crescimento do movimento republicano',
                 'Ao longo do século XIX, o movimento republicano foi ganhando força no Brasil, especialmente entre militares, intelectuais e parte das elites urbanas. Esses grupos defendiam mudanças no sistema político, buscando maior participação, modernização e autonomia nas decisões do país. A insatisfação com a monarquia e o desejo de reformas políticas impulsionaram esse movimento. Com o tempo, o republicanismo deixou de ser uma ideia isolada e passou a representar uma alternativa concreta de governo.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777931395/ChatGPT_Image_4_de_mai._de_2026_17_49_44_qs4lyz.png',
                 'Dica: Por que diferentes grupos sociais apoiariam mudanças políticas?',
                 1
             ),
             (
                 'O papel dos militares',
                 'Os militares tiveram um papel fundamental na Proclamação da República. Insatisfeitos com o governo monárquico, eles se organizaram e passaram a defender a mudança de regime. Muitos oficiais acreditavam que a monarquia não valorizava adequadamente o Exército. Esse descontentamento fortaleceu o apoio militar ao movimento republicano. Como possuíam poder e organização, os militares foram decisivos para a queda da monarquia.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777931602/ChatGPT_Image_4_de_mai._de_2026_17_46_54_ahtyco.png',
                 'Dica: Por que o apoio dos militares é importante em mudanças de governo?',
                 2
             ),
             (
                 'O 15 de novembro de 1889',
                 'No dia 15 de novembro de 1889, um movimento liderado pelo marechal Deodoro da Fonseca proclamou a República no Brasil. Dom Pedro II foi deposto e enviado ao exílio, encerrando o período monárquico no país. Esse evento ocorreu de forma relativamente rápida e sem grande participação popular direta. A mudança foi conduzida principalmente por militares e elites políticas. Esse dia se tornou um marco histórico por representar o início de um novo regime.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777931608/ChatGPT_Image_4_de_mai._de_2026_17_53_16_wru0el.png',
                 'Dica: Por que esse dia é considerado um marco histórico?',
                 3
             ),
             (
                 'A mudança de regime',
                 'A Proclamação da República marcou a transição de um sistema monárquico para um sistema republicano. Essa mudança alterou a forma de governo, substituindo o poder centralizado do imperador por uma estrutura baseada em representantes eleitos. Novas instituições foram criadas e a organização política do país foi modificada. Apesar disso, nem todas as mudanças ocorreram imediatamente, e muitos desafios surgiram nesse processo.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777931782/ChatGPT_Image_4_de_mai._de_2026_17_56_06_tnbllx.png',
                 'Dica: O que muda quando um país troca seu sistema de governo?',
                 4
             )
     ) AS data(title, content, image_url, hint, page_order);


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
    data.image_url,
    data.hint,
    data.page_order
FROM target_unit,
     (
         VALUES
             (
                 'A organização da República',
                 'Após a Proclamação da República, o Brasil iniciou um processo de reorganização política. Foram criadas novas instituições e elaborada uma Constituição em 1891, que estabeleceu as bases do regime republicano. Essa Constituição definiu a separação dos poderes e organizou o funcionamento do Estado. A mudança buscava modernizar o país e adaptar sua estrutura política ao novo sistema de governo. Esse momento foi fundamental para consolidar a República.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777932160/ChatGPT_Image_4_de_mai._de_2026_18_00_12_h4on2n.png',
                 'Dica: Por que uma nova Constituição é importante após mudanças políticas?',
                 1
             ),
             (
                 'Primeiros desafios do novo regime',
                 'A República enfrentou diversos desafios em seus primeiros anos, como instabilidade política, disputas entre grupos de poder e dificuldades na consolidação do novo sistema. Diferentes interesses regionais e políticos geravam conflitos constantes. Esse período inicial ficou conhecido como República Velha. As dificuldades mostram que a mudança de regime não resolve automaticamente os problemas de um país.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777932171/ChatGPT_Image_4_de_mai._de_2026_18_02_31_ghxhrx.png',
                 'Dica: Por que mudanças políticas podem gerar instabilidade?',
                 2
             ),
             (
                 'Participação política limitada',
                 'Apesar da mudança para a República, a participação política ainda era restrita a uma pequena parcela da população. O voto não era universal e muitos grupos, como mulheres e pessoas de baixa renda, estavam excluídos do processo político. Isso manteve desigualdades sociais e limitou a representação da população nas decisões do país. A ampliação da participação política só aconteceria gradualmente ao longo do tempo.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777932476/ChatGPT_Image_4_de_mai._de_2026_18_05_03_c66f0v.png',
                 'Dica: O que é necessário para uma participação política mais ampla?',
                 3
             ),
             (
                 'Impactos duradouros',
                 'A Proclamação da República trouxe mudanças importantes na forma de governo do Brasil, influenciando a organização política e administrativa do país até os dias atuais. Mesmo com desafios, marcou o início de uma nova fase na história brasileira. Muitas estruturas criadas nesse período continuam presentes. Compreender esse processo ajuda a entender o funcionamento do Brasil contemporâneo.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777932481/ChatGPT_Image_4_de_mai._de_2026_18_07_48_julqie.png',
                 'Dica: Como essa mudança ainda influencia o Brasil hoje?',
                 4
             )
     ) AS data(title, content, image_url, hint, page_order);