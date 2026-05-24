WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Invasões Holandesas'
      AND u.title = 'Disputa pelo Brasil'
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
                 'O interesse europeu pelo Brasil',
                 'Durante o período colonial, o território brasileiro despertava grande interesse de outras potências europeias, principalmente por causa da produção de açúcar. O Nordeste, especialmente Pernambuco, era uma das regiões mais lucrativas da colônia portuguesa. Países como a Holanda viam nessa riqueza uma oportunidade econômica, já que participavam do comércio e financiamento da produção açucareira. Esse interesse levou ao aumento das disputas pelo controle do território brasileiro. Além do açúcar, o Brasil também representava uma posição estratégica no Atlântico, facilitando rotas comerciais. O controle dessas regiões significava acesso a lucros elevados e maior influência no comércio internacional, o que intensificava ainda mais a rivalidade entre as potências europeias.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777838238/ChatGPT_Image_3_de_mai._de_2026_15_57_09_xxu4fs.png',
                 'Dica: Por que regiões economicamente importantes costumam ser alvo de disputas?',
                 1
             ),
             (
                 'A relação entre Portugal e Holanda',
                 'Aantes das invasões, os holandeses mantinham relações comerciais com Portugal, financiando engenhos e participando do transporte e venda do açúcar na Europa. No entanto, essa relação foi abalada quando Portugal passou a ser dominado pela Espanha, durante a União Ibérica (1580-1640). Como a Espanha era inimiga da Holanda, os holandeses passaram a atacar territórios portugueses, incluindo o Brasil. Esse conflito europeu teve impacto direto na colônia, transformando parceiros comerciais em inimigos. Assim, disputas políticas na Europa acabaram influenciando diretamente o cenário colonial americano, mostrando como os territórios estavam interligados.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777838401/ChatGPT_Image_3_de_mai._de_2026_15_59_15_lanxqo.png',
                 'Dica: Como conflitos na Europa podem impactar territórios na América?',
                 2
             ),
             (
                 'Primeiras tentativas de invasão',
                 'A primeira tentativa de invasão holandesa ocorreu na Bahia, em 1624. Os holandeses conseguiram ocupar Salvador por um curto período, mas foram expulsos no ano seguinte por forças portuguesas e espanholas. Essa tentativa mostrou que o Brasil era vulnerável a invasões e incentivou novas investidas holandesas no território. Além disso, revelou a importância de reforçar a defesa da colônia. Mesmo com a expulsão, os holandeses aprenderam com essa experiência, ajustando suas estratégias para futuras invasões, que seriam mais bem planejadas e organizadas.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777838632/ChatGPT_Image_3_de_mai._de_2026_16_03_42_asflnq.png',
                 'Dica: O que uma tentativa de invasão bem-sucedida pode incentivar?',
                 3
             ),
             (
                 'A invasão de Pernambuco',
                 'Em 1630, os holandeses iniciaram uma nova invasão, dessa vez em Pernambuco, região estratégica para a produção de açúcar. Diferente da tentativa anterior, essa invasão teve mais sucesso, e os holandeses conseguiram estabelecer domínio sobre partes do Nordeste brasileiro. Isso marcou o início de um período de ocupação que duraria mais de duas décadas. Pernambuco era especialmente importante por concentrar engenhos e produção em larga escala. Ao controlar essa região, os holandeses garantiam acesso direto à principal riqueza da colônia, fortalecendo sua posição econômica no comércio europeu.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777838538/ChatGPT_Image_3_de_mai._de_2026_16_01_20_gao834.png',
                 'Dica: Por que Pernambuco era um alvo importante para os holandeses?',
                 4
             )
     ) AS data(title, content, image_url, hint, page_order);

WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Invasões Holandesas'
      AND u.title = 'Os Holandeses no Nordeste'
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
                 'A administração holandesa',
                 'Após conquistar partes do Nordeste, os holandeses organizaram a administração do território ocupado. O principal líder desse período foi Maurício de Nassau, que governou entre 1637 e 1644. Durante sua gestão, foram feitas melhorias urbanas, incentivo à produção e organização administrativa, buscando tornar a colônia mais eficiente e lucrativa. Nassau procurou equilibrar interesses econômicos e sociais, promovendo certa estabilidade na região. Seu governo ficou marcado por uma administração considerada mais moderna para a época, com planejamento urbano e incentivo ao desenvolvimento local.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777838905/ChatGPT_Image_3_de_mai._de_2026_16_06_25_azhxuu.png',
                 'Dica: O que um governo precisa fazer para manter um território sob controle?',
                 1
             ),
             (
                 'Desenvolvimento urbano e cultural',
                 'Durante o governo de Nassau, a cidade de Recife passou por importantes transformações. Foram construídas pontes, ruas planejadas e prédios administrativos. Além disso, houve incentivo à produção científica e artística, com a presença de pintores, cientistas e estudiosos que registraram a fauna, a flora e a sociedade local. Esses registros são importantes até hoje para o estudo da história e da natureza do Brasil. O desenvolvimento urbano também contribuiu para transformar Recife em um dos principais centros da região durante o período holandês.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777838911/ChatGPT_Image_3_de_mai._de_2026_16_08_23_zrvr5j.png',
                 'Dica: Como o desenvolvimento urbano pode transformar uma cidade?',
                 2
             ),
             (
                 'Tolerância religiosa relativa',
                 'Diferente do domínio português, o período holandês apresentou certa tolerância religiosa. Católicos, protestantes e judeus puderam conviver na região, ainda que com algumas limitações. Isso contribuiu para uma maior diversidade cultural no território ocupado. Essa tolerância favoreceu o desenvolvimento econômico, já que permitia a participação de diferentes grupos sociais nas atividades comerciais. Mesmo assim, essa convivência não era totalmente igualitária, pois ainda existiam tensões e restrições em determinados contextos.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777839028/ChatGPT_Image_3_de_mai._de_2026_16_10_14_twrken.png',
                 'Dica: Por que permitir diferentes religiões pode influenciar a sociedade?',
                 3
             ),
             (
                 'Economia açucareira sob domínio holandês',
                 'Os holandeses continuaram investindo na produção de açúcar, mantendo engenhos em funcionamento e financiando a produção. Esse investimento buscava garantir lucros e fortalecer o controle econômico da região. No entanto, muitos produtores ficaram endividados com os financiadores holandeses. Esse modelo econômico criava dependência financeira, o que aumentava as tensões entre colonos e administradores. Apesar do crescimento econômico inicial, essas dívidas contribuíram para conflitos que surgiriam posteriormente.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777839160/ChatGPT_Image_3_de_mai._de_2026_16_12_30_s9ge0w.png',
                 'Dica: O que pode acontecer quando uma economia depende de financiamentos externos?',
                 4
             ),
             (
                 'Conflitos e tensões locais',
                 'Apesar de algumas melhorias, a presença holandesa gerou conflitos com colonos portugueses e luso-brasileiros. Com o tempo, aumentaram as tensões, especialmente após a saída de Maurício de Nassau, o que enfraqueceu a administração holandesa e abriu espaço para movimentos de resistência. Sem sua principal liderança, o controle político e social tornou-se mais instável. Esse cenário favoreceu o surgimento de revoltas que, ao longo do tempo, levariam à expulsão dos holandeses.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777839436/ChatGPT_Image_3_de_mai._de_2026_16_15_20_ipqnv2.png',
                 'Dica: O que pode acontecer quando um governo perde seu principal líder?',
                 5
             )
     ) AS data(title, content, image_url, hint, page_order);

WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Invasões Holandesas'
      AND u.title = 'Consequências das Invasões'
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
                 'Impactos econômicos no Nordeste',
                 'As invasões holandesas impactaram profundamente a economia do Nordeste, especialmente a produção de açúcar. Após a expulsão dos holandeses, muitos levaram conhecimentos técnicos e mudas de cana para o Caribe, criando concorrência para o açúcar brasileiro no mercado internacional. Essa nova concorrência reduziu os lucros da colônia portuguesa. Com o tempo, o Brasil perdeu parte de sua posição de destaque na produção açucareira, o que afetou diretamente a economia da região.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777839471/ChatGPT_Image_3_de_mai._de_2026_16_17_42_fhoux1.png',
                 'Dica: Como a concorrência pode afetar uma economia?',
                 1
             ),
             (
                 'Resistência e expulsão dos holandeses',
                 'A resistência dos colonos portugueses e luso-brasileiros levou a conflitos armados que culminaram na expulsão dos holandeses em 1654. Esse processo fortaleceu a organização militar local e a identidade dos colonos na defesa do território. A união entre diferentes grupos foi fundamental para o sucesso dessa resistência. Esse momento também contribuiu para o desenvolvimento de um sentimento de pertencimento e defesa da terra entre os habitantes da colônia.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777839880/ChatGPT_Image_3_de_mai._de_2026_16_22_16_j2mnal.png',
                 'Dica: Por que a união dos colonos foi importante nesse processo?',
                 2
             ),
             (
                 'Endividamento dos produtores',
                 'Durante o domínio holandês, muitos senhores de engenho contraíram dívidas para manter a produção. Após a expulsão, essas dívidas permaneceram, causando dificuldades econômicas e instabilidade na região. Sem o apoio financeiro holandês, muitos produtores enfrentaram dificuldades para manter suas atividades. Esse cenário contribuiu para crises econômicas locais e para o enfraquecimento de parte da produção açucareira.',
                'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777839912/ChatGPT_Image_3_de_mai._de_2026_16_25_06_yccfjq.png',
                 'Dica: O que pode acontecer quando alguém mantém dívidas após perder apoio financeiro?',
                 3
             ),
             (
                 'Fortalecimento do controle português',
                 'Após as invasões, Portugal aumentou o controle sobre o Brasil, investindo mais na defesa e na administração. Isso ocorreu porque ficou evidente que o território era estratégico e precisava de maior proteção contra novas invasões. Fortificações foram reforçadas e a presença administrativa aumentou. Essa mudança marcou um esforço maior da Coroa em garantir a segurança e a estabilidade da colônia.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777840163/ChatGPT_Image_3_de_mai._de_2026_16_27_12_qgovnn.png',
                 'Dica: Por que um território invadido tende a ser mais protegido depois?',
                 4
             ),
             (
                 'Consequências duradouras',
                 'As invasões holandesas deixaram marcas importantes na história do Brasil, influenciando a economia, a organização territorial e a cultura da região Nordeste. Esse período demonstrou a importância estratégica do Brasil no cenário internacional. Além disso, contribuiu para transformações sociais e econômicas que continuaram a impactar o país ao longo do tempo. Muitas dessas mudanças ainda podem ser percebidas na formação histórica e cultural da região.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777838632/ChatGPT_Image_3_de_mai._de_2026_16_03_42_asflnq.png',
                 'Dica: Você consegue pensar em como esse período ainda influencia o Brasil hoje?',
                 5
             )
     ) AS data(title, content, image_url, hint, page_order);