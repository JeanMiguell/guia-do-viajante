WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Chegada da Família Real'
      AND u.title = 'A Corte no Brasil'
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
                 'A transferência da Corte Portuguesa',
                 'Ao chegar ao Brasil, a família real portuguesa, liderada por Dom João VI, trouxe consigo toda a estrutura administrativa do governo. Essa mudança foi causada pela invasão de Portugal pelas tropas de Napoleão Bonaparte, que avançavam pela Europa durante as Guerras Napoleônicas. Para evitar a captura e manter o controle do império, a Corte decidiu se deslocar para a colônia, transformando o Brasil em sede do governo português. Essa foi uma decisão inédita na história, pois uma metrópole passou a ser governada a partir de sua colônia. Com isso, o Brasil deixou de ser apenas um território explorado e passou a ter maior importância política dentro do império.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777841379/ChatGPT_Image_3_de_mai._de_2026_16_47_16_zmpkf1.png',
                 'Dica: Por que um rei decidiria governar a partir de uma colônia?',
                 1
             ),
             (
                 'A chegada ao Rio de Janeiro',
                 'A família real chegou ao Brasil após uma longa viagem pelo oceano Atlântico, desembarcando inicialmente em Salvador e depois se estabelecendo no Rio de Janeiro. A cidade passou a ser o centro político e administrativo do Império Português, recebendo investimentos e transformações importantes para abrigar a Corte. Casas foram adaptadas para receber nobres, ruas foram reorganizadas e novos espaços administrativos foram criados. A presença da Corte também aumentou a circulação de pessoas, produtos e ideias, transformando o Rio de Janeiro em uma cidade mais dinâmica e central no cenário colonial.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777841799/ChatGPT_Image_3_de_mai._de_2026_16_54_23_mheunq.png',
                 'Dica: Como a presença do governo pode transformar uma cidade?',
                 2
             ),
             (
                 'Mudanças imediatas na colônia',
                 'Com a chegada da Corte, diversas mudanças foram implementadas no Brasil. Uma das principais foi a abertura dos portos às nações amigas, que permitiu o comércio direto com outros países, rompendo o monopólio comercial com Portugal. Além disso, foram criadas instituições importantes, como bancos, escolas e órgãos administrativos. Essas mudanças impulsionaram o desenvolvimento econômico e cultural do território. O Brasil passou a ter maior contato com o mundo, ampliando suas relações comerciais e fortalecendo sua estrutura interna.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777841908/ChatGPT_Image_3_de_mai._de_2026_16_56_34_d4dp3r.png',
                 'Dica: O que muda quando um país começa a negociar diretamente com outros?',
                 3
             ),
             (
                 'O Brasil como centro do Império',
                 'A presença da família real transformou o Brasil de colônia em centro do Império Português. Isso elevou o status político e econômico do território, trazendo maior autonomia e desenvolvimento. O país passou a desempenhar um papel central nas decisões do império, deixando de ser apenas fornecedor de recursos. Essa mudança também contribuiu para o crescimento das elites locais, que passaram a ter maior participação política e econômica, influenciando os rumos do território.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777841912/ChatGPT_Image_3_de_mai._de_2026_16_58_24_js8aqa.png',
                 'Dica: Como você acha que os habitantes do Brasil se sentiram com essa mudança?',
                 4
             )
     ) AS data(title, content, image_url, hint, page_order);

WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Chegada da Família Real'
      AND u.title = 'Por que a Corte Veio?'
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
                 'As Guerras Napoleônicas',
                 'No início do século XIX, a Europa estava envolvida nas Guerras Napoleônicas, lideradas por Napoleão Bonaparte. Ele buscava expandir o poder da França e enfraquecer seus adversários, especialmente a Inglaterra. Portugal, aliado dos ingleses, recusou-se a aderir ao bloqueio continental imposto por Napoleão, o que resultou na invasão do território português. Esse conflito europeu teve consequências diretas nas colônias, demonstrando como decisões tomadas na Europa podiam afetar territórios distantes, como o Brasil.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777842217/ChatGPT_Image_3_de_mai._de_2026_17_01_09_c4uxjd.png',
                 'Dica: Como decisões políticas na Europa podem afetar colônias distantes?',
                 1
             ),
             (
                 'A ameaça de invasão',
                 'Diante do avanço das tropas francesas, a família real portuguesa viu-se ameaçada. Permanecer em Portugal poderia significar a perda do trono e do controle do império. A solução encontrada foi transferir a Corte para o Brasil, onde estariam mais seguros e poderiam continuar governando. Essa decisão foi estratégica, pois permitiu a continuidade do governo português sem submissão ao domínio francês, além de reforçar o controle sobre a colônia mais importante do império.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777842361/ChatGPT_Image_3_de_mai._de_2026_17_05_54_fmhlaz.png',
                 'Dica: O que você faria se estivesse no lugar da família real?',
                 2
             ),
             (
                 'A escolha do Brasil',
                 'O Brasil foi escolhido como destino por ser a principal colônia portuguesa e possuir recursos suficientes para sustentar a Corte. Além disso, sua distância da Europa oferecia maior segurança contra as tropas napoleônicas. O território também apresentava condições econômicas favoráveis, com produção agrícola e estrutura suficiente para abrigar a administração. Essa escolha demonstrou a importância do Brasil dentro do império português naquele momento histórico.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777842366/ChatGPT_Image_3_de_mai._de_2026_17_03_31_jf2zls.png',
                 'Dica: Por que a distância pode ser uma vantagem em tempos de guerra?',
                 3
             ),
             (
                 'A importância da Inglaterra',
                 'A Inglaterra teve papel fundamental na transferência da Corte, oferecendo apoio naval para a travessia até o Brasil. Em troca, obteve vantagens comerciais, fortalecendo suas relações com Portugal e ampliando sua influência econômica. Esse acordo beneficiou os ingleses, que passaram a ter maior acesso ao mercado brasileiro. Assim, a transferência da Corte não apenas garantiu a segurança da família real, mas também reforçou alianças políticas e econômicas importantes.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777842733/ChatGPT_Image_3_de_mai._de_2026_17_08_29_lhcvbi.png',
                 'Dica: Por que países ajudam outros em momentos de crise?',
                 4
             )
     ) AS data(title, content, image_url, hint, page_order);


WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Chegada da Família Real'
      AND u.title = 'Transformações no Brasil'
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
                 'Abertura dos portos',
                 'Uma das primeiras medidas tomadas por Dom João VI no Brasil foi a abertura dos portos às nações amigas, em 1808. Essa decisão permitiu o comércio direto com outros países, especialmente a Inglaterra, rompendo com o antigo pacto colonial que obrigava o Brasil a negociar apenas com Portugal. Com isso, houve maior circulação de mercadorias e crescimento das atividades comerciais. Essa mudança marcou o início de uma nova fase econômica, com maior integração do Brasil ao comércio internacional.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777842862/ChatGPT_Image_3_de_mai._de_2026_17_12_08_f5hbal.png',
                 'Dica: Como o comércio internacional pode impactar a economia de um país?',
                 1
             ),
             (
                 'Criação de instituições',
                 'Durante a permanência da Corte no Brasil, foram criadas diversas instituições importantes, como o Banco do Brasil, a Imprensa Régia, bibliotecas e escolas. Essas iniciativas contribuíram para o desenvolvimento cultural, econômico e administrativo do país. A criação dessas instituições fortaleceu a organização do território e ampliou o acesso à informação e ao conhecimento, favorecendo transformações importantes na sociedade brasileira.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777842990/ChatGPT_Image_3_de_mai._de_2026_17_14_19_tpxsi9.png',
                 'Dica: Por que a criação de instituições é importante para o desenvolvimento de uma sociedade?',
                 2
             ),
             (
                 'Mudanças sociais e urbanas',
                 'A chegada da família real trouxe mudanças significativas para a sociedade brasileira, especialmente no Rio de Janeiro. Houve crescimento populacional, transformação urbana e maior circulação de ideias e produtos. No entanto, essas mudanças também aumentaram as desigualdades sociais, pois os benefícios não foram distribuídos de forma igual. Enquanto alguns grupos se enriqueceram, outros continuaram enfrentando dificuldades, evidenciando contrastes sociais no período.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777843135/ChatGPT_Image_3_de_mai._de_2026_17_16_58_v1rbor.png',
                 'Dica: O desenvolvimento pode beneficiar todos da mesma forma?',
                 3
             ),
             (
                 'Caminho para a independência',
                 'As transformações ocorridas durante a permanência da Corte no Brasil contribuíram para o processo de independência. O aumento da autonomia e o desenvolvimento de estruturas administrativas fortaleceram a ideia de separação de Portugal. Com o tempo, as elites locais passaram a desejar maior autonomia política, o que levou à independência em 1822. Assim, a presença da Corte no Brasil foi um passo importante na construção do país como nação independente.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777843139/ChatGPT_Image_3_de_mai._de_2026_17_18_52_sjjfmd.png',
                 'Dica: Como mudanças políticas e econômicas podem levar à independência de um país?',
                 4
             )
     ) AS data(title, content, image_url, hint, page_order);