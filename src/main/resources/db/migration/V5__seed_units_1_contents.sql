WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Chegada dos Portugueses'
      AND u.title = 'As Grandes Navegações'
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
                 'A Expansão Marítima Europeia',
                 'No final do século XV, os reinos europeus buscavam novas rotas comerciais para chegar às Índias, região conhecida por suas especiarias, como pimenta, cravo e canela. Essas mercadorias eram muito valorizadas na Europa, mas chegavam por rotas controladas por comerciantes árabes e italianos, o que encarecia bastante os produtos. Diante disso, países como Portugal e Espanha passaram a investir em viagens marítimas para encontrar caminhos alternativos. Portugal destacou-se nesse processo ao desenvolver técnicas de navegação, aperfeiçoar embarcações como as caravelas e formar navegadores experientes, dando início ao período conhecido como Expansão Marítima. Esse movimento marcou o início de uma nova fase na história mundial, com a ampliação do contato entre diferentes continentes',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777399278/ChatGPT_Image_28_de_abr._de_2026_14_00_38-Photoroom_g2q5kw.png',
                 'Dica: Pense por que os europeus queriam tanto chegar às Índias.',
                 1
             ),
             (
                 'A Expedição de Pedro Álvares Cabral',
                 'No ano de 1500, o rei de Portugal organizou uma grande expedição com destino às Índias, comandada por Pedro Álvares Cabral. A frota era composta por treze embarcações e cerca de 1500 homens, incluindo marinheiros, soldados, religiosos e funcionários da Coroa. A viagem tinha como objetivo principal estabelecer relações comerciais com o Oriente. Durante o percurso pelo oceano Atlântico, a frota seguiu uma rota mais afastada da costa africana, estratégia que também ajudava a aproveitar melhor os ventos e correntes marítimas. Foi nesse contexto que, no dia 22 de abril de 1500, os navegadores avistaram terras desconhecidas, que posteriormente fariam parte do território brasileiro.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777395943/unit1_image2_ikjipw.png',
                 'Dica: Observe a rota da viagem.',
                 2
             ),
             (
                 'O Primeiro Contato com o Território',
                 'Ao chegarem ao território que hoje conhecemos como Brasil, os portugueses encontraram povos indígenas que já habitavam a região há milhares de anos. Esses povos possuíam culturas próprias, com línguas, costumes e formas de organização social distintas. O primeiro contato foi marcado pela curiosidade mútua e pela troca de objetos, como espelhos, miçangas e utensílios. Esse momento foi registrado por Pero Vaz de Caminha, escrivão da frota, em uma carta enviada ao rei de Portugal. Nesse documento, ele descreveu as características da terra, da natureza e dos habitantes locais, oferecendo um dos primeiros relatos escritos sobre o território brasileiro.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777398628/ChatGPT_Image_28_de_abr._de_2026_13_50_23_hkoxxf.png',
                 'Dica: Lembre-se de que os indígenas já viviam aqui.',
                 3
             ),
             (
                 'A Posse e a Nomeação da Nova Terra',
                 'Após o contato inicial, os portugueses realizaram uma cerimônia para marcar a posse da terra em nome da Coroa portuguesa. Foi celebrada uma missa, considerada um marco simbólico da ocupação. Inicialmente, o território recebeu o nome de Ilha de Vera Cruz e, posteriormente, passou a ser chamado de Terra de Santa Cruz. Com o passar do tempo, a região ficou conhecida como Brasil, nome associado à exploração do pau-brasil, árvore abundante no litoral e muito valorizada por sua tinta avermelhada. Esse momento marcou o início da presença portuguesa no território e abriu caminho para o processo de colonização, que traria profundas transformações para os povos que aqui viviam.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777399559/ChatGPT_Image_28_de_abr._de_2026_14_05_52_aogmdi.png',
                 'Dica: O nome "Brasil" está ligado a um recurso natural.',
                 4
             )
     ) AS data(title, content, image_url, hint, page_order);

WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Chegada dos Portugueses'
      AND u.title = 'A Jornada até o Brasil'
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
                 'Planejamento da Viagem',
                 'A viagem liderada por Pedro Álvares Cabral não aconteceu de forma improvisada. Ela foi cuidadosamente planejada pela Coroa portuguesa, que já possuía experiência em navegações pelo oceano Atlântico. Os portugueses utilizavam conhecimentos acumulados ao longo de décadas, como mapas, rotas marítimas e técnicas de navegação. Além disso, havia um grande interesse econômico por trás da expedição, já que o objetivo principal era alcançar as Índias e estabelecer relações comerciais lucrativas.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777401364/ChatGPT_Image_28_de_abr._de_2026_14_33_08_1_epdpm5.png',
                 'Dica: Pense que essa viagem era como uma missão.',
                 1
             ),
             (
                 'A Rota pelo Atlântico',
                 'Durante a viagem, os navegadores não seguiram uma linha reta até as Índias. Eles utilizaram uma estratégia chamada "volta do mar", que consistia em se afastar da costa africana para aproveitar melhor os ventos e correntes marítimas. Essa técnica permitia uma navegação mais rápida e segura. Foi ao seguir essa rota que a frota acabou chegando ao território que hoje corresponde ao Brasil',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777401624/ChatGPT_Image_28_de_abr._de_2026_14_40_05_1_kniiqq.png',
                 'Dica: Ventos e correntes eram fundamentais.',
                 2
             ),
             (
                 'Tecnologias de Navegação',
                 'Os portugueses utilizavam diversos instrumentos para se orientar no mar, como a bússola, o astrolábio e mapas chamados de cartas náuticas. Esses instrumentos ajudavam a determinar a direção e a localização das embarcações. Além disso, as caravelas eram navios leves e rápidos, ideais para longas viagens. Essas inovações foram essenciais para o sucesso das grandes navegações.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777402537/ChatGPT_Image_28_de_abr._de_2026_14_55_30_gelo7r.png',
                 'Dica: Sem GPS, como eles se guiavam?',
                 3
             ),
             (
                 'A Chegada ao Novo Território',
                 'Ao avistar terra em 1500, os portugueses não tinham certeza do que haviam encontrado. Inicialmente, acreditaram tratar-se de uma ilha. Com o tempo, perceberam que era uma nova terra ainda desconhecida pelos europeus. A chegada foi registrada e comunicada ao rei de Portugal, marcando oficialmente o descobrimento sob a perspectiva europeia.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777403025/ChatGPT_Image_28_de_abr._de_2026_15_03_36_mahtxj.png',
                 'Dica: Imagine encontrar uma nova terra.',
                 4
             )
     ) AS data(title, content, image_url, hint, page_order);

WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Chegada dos Portugueses'
      AND u.title = 'Impactos da Chegada'
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
                 'Causas Econômicas',
                 'Uma das principais causas das grandes navegações foi o interesse econômico. Os europeus buscavam novas rotas comerciais para obter especiarias e outros produtos valiosos diretamente das fontes produtoras. Isso reduziria custos e aumentaria os lucros, fortalecendo o poder econômico dos reinos europeus.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777403349/ChatGPT_Image_28_de_abr._de_2026_15_08_59_yyocec.png',
                 'Dica: Por que comprar direto da fonte era melhor?',
                 1
             ),
             (
                 'Causas Políticas e Religiosas',
                 'Além dos interesses econômicos, havia também motivações políticas e religiosas. Os reis europeus queriam expandir seus territórios e aumentar seu poder. Ao mesmo tempo, havia o desejo de espalhar a religião cristã para outros povos. Essas ideias ajudaram a impulsionar as expedições marítimas.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777405305/ChatGPT_Image_28_de_abr._de_2026_15_41_31_oulodk.png',
                 'Dica: Conquistar terras aumentava o poder.',
                 2
             ),
             (
                 'Consequências para os Povos Indígenas',
                 'A chegada dos portugueses trouxe grandes mudanças para os povos indígenas que já habitavam o território. Com o tempo, ocorreram conflitos, exploração e a imposição de novos costumes. Muitos povos indígenas sofreram com doenças trazidas pelos europeus, além da perda de suas terras e de sua autonomia.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777405774/ChatGPT_Image_28_de_abr._de_2026_15_48_29_sq8u1h.png',
                 'Dica: Como novos povos impactam culturas existentes?',
                 3
             ),
             (
                 'Início da Colonização',
                 'A chegada dos portugueses marcou o início do processo de colonização do Brasil. Ao longo dos anos, os europeus passaram a explorar os recursos naturais e a ocupar o território. Isso levou à formação de uma sociedade marcada pela mistura de culturas, mas também por desigualdades e conflitos que influenciam o país até hoje.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777406198/ChatGPT_Image_28_de_abr._de_2026_15_56_19_rejmkb.png',
                 'Dica: Quais impactos ainda existem hoje?',
                 4
             )
     ) AS data(title, content, image_url, hint, page_order);