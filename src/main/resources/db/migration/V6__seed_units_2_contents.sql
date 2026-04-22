WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Capitanias Hereditárias'
      AND u.title = 'Organizando o Território'
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
                 'A necessidade de organizar a colônia',
                 'Após a chegada dos portugueses ao território brasileiro, a Coroa portuguesa percebeu que precisava garantir a posse da terra e iniciar um processo de ocupação mais efetivo. O território era extenso, pouco conhecido pelos europeus e sujeito à ameaça de invasões por outros países, como França e Espanha. Além disso, Portugal não possuía recursos financeiros e humanos suficientes para administrar sozinho toda essa região. Diante disso, tornou-se necessário encontrar uma forma de organizar o território que permitisse sua ocupação gradual, ao mesmo tempo em que garantisse a exploração econômica e a defesa da colônia.',
                 'Dica: Pense nos desafios de administrar um território enorme à distância. Por que Portugal precisaria de ajuda?',
                 1
             ),
             (
                 'A divisão do território em capitanias',
                 'Para facilitar a administração, o território brasileiro foi dividido em grandes faixas de terra chamadas capitanias hereditárias. Essas faixas eram longas e se estendiam do litoral até o interior, mesmo que o interior ainda fosse desconhecido. A divisão foi feita ao longo da costa brasileira, permitindo que diferentes regiões fossem ocupadas ao mesmo tempo. Essa estratégia buscava acelerar o processo de colonização, já que cada parte do território seria responsabilidade de um administrador específico.',
                 'Dica: Dividir o território pode ajudar na organização. Como isso facilita o controle?',
                 2
             ),
             (
                 'A escolha dos donatários',
                 'As capitanias foram entregues a indivíduos chamados donatários, escolhidos diretamente pelo rei de Portugal. Esses homens eram, em geral, nobres, militares ou pessoas de confiança da Coroa. Eles recebiam o direito de administrar uma capitania, mas não se tornavam donos absolutos da terra. O território continuava pertencendo ao rei, e os donatários deveriam agir como representantes da Coroa na colônia.',
                 'Dica: O rei precisava confiar nesses administradores. Por que isso era importante?',
                 3
             ),
             (
                 'Objetivos da organização territorial',
                 'A criação das capitanias hereditárias tinha como principais objetivos ocupar o território, garantir a defesa contra invasões estrangeiras e promover o desenvolvimento econômico. Portugal esperava que os donatários investissem na produção agrícola, especialmente no cultivo da cana-de-açúcar, que era um produto muito valorizado na época. Dessa forma, o sistema buscava transformar o território em uma colônia produtiva e integrada aos interesses da metrópole.',
                 'Dica: Pense no interesse econômico de Portugal. O que ele ganhava com a colonização?',
                 4
             ),
             (
                 'Primeiros desafios da ocupação',
                 'Mesmo com a divisão em capitanias, o processo de ocupação não foi simples. Os donatários enfrentaram dificuldades como a falta de recursos, a distância de Portugal, o desconhecimento do território e os conflitos com povos indígenas. Essas dificuldades mostraram que organizar o território era apenas o primeiro passo de um processo muito mais complexo de colonização.',
                 'Dica: Imagine começar uma nova sociedade em um lugar desconhecido. Quais seriam os maiores desafios?',
                 5
             )
     ) AS data(title, content, hint, page_order);


WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Capitanias Hereditárias'
      AND u.title = 'Como Funcionavam as Capitanias'
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
                 'A implementação do sistema',
                 'O sistema de capitanias hereditárias foi oficialmente implantado em 1534 como uma tentativa de organizar e desenvolver a colônia brasileira. Portugal optou por esse modelo porque não possuía recursos suficientes para investir diretamente em toda a colonização. Assim, transferiu parte dessa responsabilidade para os donatários, que deveriam utilizar seus próprios recursos para promover o desenvolvimento das capitanias.',
                 'Dica: Pense por que Portugal escolheu dividir responsabilidades. O que isso ajudava a resolver?',
                 1
             ),
             (
                 'Quem eram os donatários',
                 'Os donatários eram responsáveis por administrar as capitanias e tinham grande autonomia local. Eles deveriam organizar o povoamento, trazer colonos, incentivar a produção e garantir a defesa do território. Apesar disso, não eram proprietários das terras, pois o território continuava pertencendo à Coroa portuguesa. Essa relação mostrava que os donatários atuavam como representantes do rei.',
                 'Dica: Ter autonomia não significa independência total. Qual era o limite do poder dos donatários?',
                 2
             ),
             (
                 'Direitos concedidos aos donatários',
                 'Os donatários possuíam diversos direitos, como distribuir terras menores chamadas sesmarias, fundar vilas, explorar recursos naturais e cobrar certos tributos. Esses direitos eram importantes para incentivar o desenvolvimento econômico das capitanias e atrair colonos para a região.',
                 'Dica: Distribuir terras pode incentivar a ocupação. Por quê?',
                 3
             ),
             (
                 'Deveres e responsabilidades',
                 'Além dos direitos, os donatários tinham deveres importantes, como proteger o território contra invasões, manter a ordem local e desenvolver atividades econômicas. Eles precisavam investir recursos próprios, o que tornava a tarefa difícil para muitos. O sucesso da capitania dependia diretamente da capacidade do donatário de cumprir essas responsabilidades.',
                 'Dica: Ter muitas responsabilidades pode dificultar o sucesso. Por quê?',
                 4
             ),
             (
                 'Documentos que regulavam o sistema',
                 'O funcionamento das capitanias era definido por documentos oficiais, como a carta de doação e o foral. A carta de doação concedia o direito de administração ao donatário, enquanto o foral estabelecia regras sobre impostos, direitos e deveres. Esses documentos garantiam que o sistema tivesse uma base legal, mesmo sendo aplicado a grande distância de Portugal.',
                 'Dica: Por que seria importante ter regras bem definidas por escrito?',
                 5
             ),
             (
                 'Dificuldades no funcionamento',
                 'Na prática, muitas capitanias enfrentaram dificuldades como falta de recursos, isolamento, conflitos com povos indígenas e ausência de apoio constante da Coroa. Essas dificuldades impediram o desenvolvimento de várias capitanias, mostrando que o sistema não funcionava de maneira uniforme em todo o território.',
                 'Dica: O que acontece quando um plano não considera todas as dificuldades da realidade?',
                 6
             )
     ) AS data(title, content, hint, page_order);


WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Capitanias Hereditárias'
      AND u.title = 'Resultados do Sistema'
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
                 'Capitanias que prosperaram',
                 'Apesar das dificuldades, algumas capitanias tiveram relativo sucesso, como Pernambuco e São Vicente. Nessas regiões, houve maior organização administrativa e desenvolvimento da produção agrícola, especialmente da cana-de-açúcar. Esses casos mostraram que o sistema podia funcionar em determinadas condições.',
                 'Dica: O que você acha que fez essas capitanias funcionarem melhor que as outras?',
                 1
             ),
             (
                 'Fracasso da maioria das capitanias',
                 'A maior parte das capitanias hereditárias não teve sucesso. Muitos donatários não possuíam recursos suficientes para investir na colonização ou enfrentaram dificuldades que não conseguiram superar. Isso levou ao abandono de várias capitanias e mostrou as limitações do sistema.',
                 'Dica: Por que a falta de recursos pode comprometer um projeto?',
                 2
             ),
             (
                 'Criação do Governo-Geral',
                 'Diante do fracasso de muitas capitanias, a Coroa portuguesa decidiu centralizar a administração da colônia. Em 1549, foi criado o Governo-Geral, que tinha como objetivo coordenar melhor o território e garantir maior controle sobre a colônia.',
                 'Dica: Centralizar o poder pode ajudar na organização. Como?',
                 3
             ),
             (
                 'Consequências para a colonização',
                 'O sistema de capitanias hereditárias teve um papel importante no início da colonização do Brasil. Ele permitiu a ocupação inicial do território e o desenvolvimento de atividades econômicas, mesmo que de forma desigual. As experiências desse sistema influenciaram a organização posterior da colônia.',
                 'Dica: Mesmo com falhas, um sistema pode trazer aprendizados. Quais foram eles?',
                 4
             ),
             (
                 'Impactos duradouros',
                 'As capitanias hereditárias deixaram marcas na formação do território brasileiro, influenciando a ocupação do litoral e o desenvolvimento regional. Algumas dessas divisões ajudaram a moldar a organização territorial e econômica do Brasil ao longo do tempo.',
                 'Dica: Você consegue pensar em como decisões do passado ainda influenciam o presente?',
                 5
             )
     ) AS data(title, content, hint, page_order);