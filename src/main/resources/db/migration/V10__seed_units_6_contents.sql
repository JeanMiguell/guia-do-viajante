WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Abolição da Escravidão'
      AND u.title = 'A Luta pela Liberdade'
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
                 'A escravidão no Brasil',
                 'A escravidão foi uma das bases da economia brasileira durante séculos, especialmente nas atividades agrícolas como a produção de açúcar e café. Milhões de africanos foram trazidos à força para o Brasil e submetidos a condições de vida extremamente difíceis. Esse sistema sustentava a economia, mas gerava profundas desigualdades sociais e humanas.',
                 'Dica: Pense nas condições de vida das pessoas escravizadas. Por que esse sistema era tão injusto?',
                 1
             ),
             (
                 'Formas de resistência',
                 'Mesmo diante das dificuldades, as pessoas escravizadas resistiram de diversas formas. Algumas fugiam e formavam comunidades chamadas quilombos, como o Quilombo dos Palmares. Outras resistiam no dia a dia, preservando suas culturas e enfrentando o sistema de diferentes maneiras.',
                 'Dica: Resistir nem sempre significa lutar diretamente. Que outras formas de resistência podem existir?',
                 2
             ),
             (
                 'Movimentos abolicionistas',
                 'Ao longo do século XIX, surgiram movimentos abolicionistas que defendiam o fim da escravidão. Esses grupos eram formados por intelectuais, políticos, jornalistas e até pessoas comuns que acreditavam na liberdade. Eles organizavam campanhas, escreviam textos e pressionavam o governo.',
                 'Dica: Como a mobilização de pessoas pode ajudar a mudar uma sociedade?',
                 3
             ),
             (
                 'Leis anteriores à abolição',
                 'Antes da abolição completa, foram criadas leis que buscavam reduzir gradualmente a escravidão, como a Lei do Ventre Livre (1871), que libertava os filhos de mulheres escravizadas, e a Lei dos Sexagenários (1885), que libertava pessoas com mais de 60 anos. Essas leis, no entanto, tinham limitações e não resolveram o problema completamente.',
                 'Dica: Essas leis realmente acabavam com a escravidão? Por quê?',
                 4
             )
     ) AS data(title, content, hint, page_order);


WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Abolição da Escravidão'
      AND u.title = 'Pressões pela Abolição'
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
                 'Pressões internas',
                 'No Brasil, cresciam as pressões internas pelo fim da escravidão. Intelectuais, jornalistas e parte da população passaram a defender a abolição como uma questão moral e social. Além disso, havia revoltas, fugas e resistência constante por parte das pessoas escravizadas.',
                 'Dica: Como a pressão da sociedade pode influenciar decisões políticas?',
                 1
             ),
             (
                 'Pressões externas',
                 'Outros países, especialmente a Inglaterra, também pressionavam o Brasil para acabar com a escravidão. Isso estava ligado a interesses econômicos e à defesa do trabalho livre. Essas pressões internacionais aumentaram o debate sobre o tema no país.',
                 'Dica: Por que outros países se interessariam por decisões internas do Brasil?',
                 2
             ),
             (
                 'Mudanças econômicas',
                 'Ao longo do século XIX, a economia brasileira começou a passar por mudanças. O trabalho assalariado passou a ser visto como uma alternativa mais eficiente em alguns setores, especialmente com a chegada de imigrantes europeus.',
                 'Dica: Como mudanças na economia podem influenciar decisões sociais?',
                 3
             ),
             (
                 'O papel da monarquia',
                 'A monarquia brasileira, especialmente a princesa Isabel, teve papel importante no processo de abolição. Em 1888, ela assinou a Lei Áurea, que colocou fim oficial à escravidão no Brasil.',
                 'Dica: Por que a assinatura de uma lei pode ser tão importante?',
                 4
             )
     ) AS data(title, content, hint, page_order);


WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Abolição da Escravidão'
      AND u.title = 'Depois da Abolição'
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
                 'A liberdade sem apoio',
                 'Após a abolição, as pessoas libertas não receberam apoio do governo, como terras, educação ou emprego. Isso dificultou sua integração na sociedade e contribuiu para a continuidade das desigualdades.',
                 'Dica: O que é necessário para garantir que a liberdade seja realmente efetiva?',
                 1
             ),
             (
                 'Desigualdades sociais',
                 'A abolição não resolveu imediatamente os problemas sociais. As desigualdades continuaram, e muitos ex-escravizados enfrentaram dificuldades para sobreviver. Essas desigualdades ainda impactam a sociedade brasileira atualmente.',
                 'Dica: Por que algumas mudanças levam muito tempo para gerar igualdade?',
                 2
             ),
             (
                 'Transformações na sociedade',
                 'O fim da escravidão trouxe mudanças importantes para a sociedade brasileira, como a ampliação do trabalho livre e novas formas de organização econômica. No entanto, essas transformações ocorreram de forma lenta e desigual.',
                 'Dica: Mudanças sociais acontecem de forma imediata ou gradual?',
                 3
             ),
             (
                 'Impactos históricos',
                 'A abolição da escravidão é um marco importante na história do Brasil, mas seus efeitos continuam sendo discutidos até hoje. Ela marcou o fim de um sistema injusto, mas deixou desafios que ainda precisam ser enfrentados.',
                 'Dica: Como o passado pode influenciar o presente?',
                 4
             )
     ) AS data(title, content, hint, page_order);