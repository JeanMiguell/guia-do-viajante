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
    NULL,
    data.hint,
    data.page_order
FROM target_unit,
     (
         VALUES
             (
                 'A Expansão Marítima Europeia',
                 'No final do século XV, os reinos europeus buscavam novas rotas comerciais para chegar às Índias, região conhecida por suas especiarias, como pimenta, cravo e canela. Essas mercadorias eram muito valorizadas na Europa, mas chegavam por rotas controladas por comerciantes árabes e italianos, o que encarecia bastante os produtos. Diante disso, países como Portugal e Espanha passaram a investir em viagens marítimas para encontrar caminhos alternativos. Portugal destacou-se nesse processo ao desenvolver técnicas de navegação, aperfeiçoar embarcações como as caravelas e formar navegadores experientes, dando início ao período conhecido como Expansão Marítima. Esse movimento marcou o início de uma nova fase na história mundial, com a ampliação do contato entre diferentes continentes.',
                 'Dica: Pense por que os europeus queriam tanto chegar às Índias. O que eles buscavam lá que não tinham na Europa?',
                 1
             ),
             (
                 'A Expedição de Pedro Álvares Cabral',
                 'No ano de 1500, o rei de Portugal organizou uma grande expedição com destino às Índias, comandada por Pedro Álvares Cabral. A frota era composta por treze embarcações e cerca de 1500 homens, incluindo marinheiros, soldados, religiosos e funcionários da Coroa. A viagem tinha como objetivo principal estabelecer relações comerciais com o Oriente. Durante o percurso pelo oceano Atlântico, a frota seguiu uma rota mais afastada da costa africana, estratégia que também ajudava a aproveitar melhor os ventos e correntes marítimas. Foi nesse contexto que, no dia 22 de abril de 1500, os navegadores avistaram terras desconhecidas, que posteriormente fariam parte do território brasileiro.',
                 'Dica: Observe a rota da viagem. Por que os portugueses não seguiram apenas a costa da África? Pense nos ventos e correntes marítimas.',
                 2
             ),
             (
                 'O Primeiro Contato com o Território',
                 'Ao chegarem ao território que hoje conhecemos como Brasil, os portugueses encontraram povos indígenas que já habitavam a região há milhares de anos. Esses povos possuíam culturas próprias, com línguas, costumes e formas de organização social distintas. O primeiro contato foi marcado pela curiosidade mútua e pela troca de objetos, como espelhos, miçangas e utensílios. Esse momento foi registrado por Pero Vaz de Caminha, escrivão da frota, em uma carta enviada ao rei de Portugal. Nesse documento, ele descreveu as características da terra, da natureza e dos habitantes locais, oferecendo um dos primeiros relatos escritos sobre o território brasileiro.',
                 'Dica: Lembre-se de que os indígenas já viviam aqui antes da chegada dos portugueses. Como você acha que foi esse primeiro contato entre culturas diferentes?',
                 3
             ),
             (
                 'A Posse e a Nomeação da Nova Terra',
                 'Após o contato inicial, os portugueses realizaram uma cerimônia para marcar a posse da terra em nome da Coroa portuguesa. Foi celebrada uma missa, considerada um marco simbólico da ocupação. Inicialmente, o território recebeu o nome de Ilha de Vera Cruz e, posteriormente, passou a ser chamado de Terra de Santa Cruz. Com o passar do tempo, a região ficou conhecida como Brasil, nome associado à exploração do pau-brasil, árvore abundante no litoral e muito valorizada por sua tinta avermelhada. Esse momento marcou o início da presença portuguesa no território e abriu caminho para o processo de colonização, que traria profundas transformações para os povos que aqui viviam.',
                 'Dica: O nome "Brasil" está ligado a um recurso natural importante. Você lembra qual era e por que ele era valioso?',
                 4
             )
     ) AS data(title, content, hint, page_order);

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
    NULL,
    data.hint,
    data.page_order
FROM target_unit,
     (
         VALUES
             (
                 'Planejamento da Viagem',
                 'A viagem liderada por Pedro Álvares Cabral não aconteceu de forma improvisada. Ela foi cuidadosamente planejada pela Coroa portuguesa, que já possuía experiência em navegações pelo oceano Atlântico. Os portugueses utilizavam conhecimentos acumulados ao longo de décadas, como mapas, rotas marítimas e técnicas de navegação. Além disso, havia um grande interesse econômico por trás da expedição, já que o objetivo principal era alcançar as Índias e estabelecer relações comerciais lucrativas.',
                 'Dica: Pense que essa viagem era como uma grande missão. O que você acha que foi necessário planejar antes de sair pelo oceano?',
                 1
             ),
             (
                 'A Rota pelo Atlântico',
                 'Durante a viagem, os navegadores não seguiram uma linha reta até as Índias. Eles utilizaram uma estratégia chamada "volta do mar", que consistia em se afastar da costa africana para aproveitar melhor os ventos e correntes marítimas. Essa técnica permitia uma navegação mais rápida e segura. Foi ao seguir essa rota que a frota acabou chegando ao território que hoje corresponde ao Brasil.',
                 'Dica: Ventos e correntes marítimas eram fundamentais para a navegação. Como eles poderiam ajudar ou atrapalhar uma viagem?',
                 2
             ),
             (
                 'Tecnologias de Navegação',
                 'Os portugueses utilizavam diversos instrumentos para se orientar no mar, como a bússola, o astrolábio e mapas chamados de cartas náuticas. Esses instrumentos ajudavam a determinar a direção e a localização das embarcações. Além disso, as caravelas eram navios leves e rápidos, ideais para longas viagens. Essas inovações foram essenciais para o sucesso das grandes navegações.',
                 'Dica: Sem GPS naquela época, como você acha que os navegadores sabiam para onde estavam indo?',
                 3
             ),
             (
                 'A Chegada ao Novo Território',
                 'Ao avistar terra em 1500, os portugueses não tinham certeza do que haviam encontrado. Inicialmente, acreditaram tratar-se de uma ilha. Com o tempo, perceberam que era uma nova terra ainda desconhecida pelos europeus. A chegada foi registrada e comunicada ao rei de Portugal, marcando oficialmente o descobrimento sob a perspectiva europeia.',
                 'Dica: Imagine encontrar uma terra desconhecida depois de semanas no mar. Como você acha que os navegadores reagiram?',
                 4
             )
     ) AS data(title, content, hint, page_order);

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
    NULL,
    data.hint,
    data.page_order
FROM target_unit,
     (
         VALUES
             (
                 'Causas Econômicas',
                 'Uma das principais causas das grandes navegações foi o interesse econômico. Os europeus buscavam novas rotas comerciais para obter especiarias e outros produtos valiosos diretamente das fontes produtoras. Isso reduziria custos e aumentaria os lucros, fortalecendo o poder econômico dos reinos europeus.',
                 'Dica: O comércio era muito importante. Por que comprar direto da fonte poderia ser melhor?',
                 1
             ),
             (
                 'Causas Políticas e Religiosas',
                 'Além dos interesses econômicos, havia também motivações políticas e religiosas. Os reis europeus queriam expandir seus territórios e aumentar seu poder. Ao mesmo tempo, havia o desejo de espalhar a religião cristã para outros povos. Essas ideias ajudaram a impulsionar as expedições marítimas.',
                 'Dica: Pense que conquistar terras também significava ter mais poder. Por que isso era importante para os reis?',
                 2
             ),
             (
                 'Consequências para os Povos Indígenas',
                 'A chegada dos portugueses trouxe grandes mudanças para os povos indígenas que já habitavam o território. Com o tempo, ocorreram conflitos, exploração e a imposição de novos costumes. Muitos povos indígenas sofreram com doenças trazidas pelos europeus, além da perda de suas terras e de sua autonomia.',
                 'Dica: Como você acha que a chegada de um novo povo pode impactar quem já vivia naquele lugar?',
                 3
             ),
             (
                 'Início da Colonização',
                 'A chegada dos portugueses marcou o início do processo de colonização do Brasil. Ao longo dos anos, os europeus passaram a explorar os recursos naturais e a ocupar o território. Isso levou à formação de uma sociedade marcada pela mistura de culturas, mas também por desigualdades e conflitos que influenciam o país até hoje.',
                 'Dica: A colonização trouxe mudanças que ainda existem hoje. Você consegue pensar em algum exemplo?',
                 4
             )
     ) AS data(title, content, hint, page_order);