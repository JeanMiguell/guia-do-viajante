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
    data.image_url,
    data.hint,
    data.page_order
FROM target_unit,
     (
         VALUES
             (
                 'A escravidão no Brasil',
                 'A escravidão foi uma das bases da economia brasileira durante séculos, especialmente nas atividades agrícolas como a produção de açúcar e café. Milhões de africanos foram trazidos à força para o Brasil e submetidos a condições de vida extremamente difíceis, marcadas por violência, exploração e ausência de direitos. Esse sistema sustentava a economia colonial e imperial, garantindo lucros para as elites, mas gerava profundas desigualdades sociais e humanas. Além disso, a escravidão impactou a formação cultural do país, já que os africanos trouxeram costumes, crenças e conhecimentos que influenciam o Brasil até hoje. Mesmo sendo economicamente importante para a época, tratava-se de um sistema profundamente injusto e desumano.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777923837/ChatGPT_Image_4_de_mai._de_2026_15_43_13_iofvql.png',
                 'Dica: Pense nas condições de vida das pessoas escravizadas. Por que esse sistema era tão injusto?',
                 1
             ),
             (
                 'Formas de resistência',
                 'Mesmo diante das dificuldades, as pessoas escravizadas resistiram de diversas formas. Algumas fugiam e formavam comunidades chamadas quilombos, como o Quilombo dos Palmares, que se tornou um dos maiores símbolos de resistência. Outras resistiam no dia a dia, preservando suas culturas, religiões, línguas e tradições, mesmo sob repressão. Também havia formas de resistência mais sutis, como desacelerar o trabalho ou sabotar atividades. Essas ações mostram que os escravizados não aceitavam passivamente sua condição, mas lutavam constantemente por liberdade e dignidade.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777923962/ChatGPT_Image_4_de_mai._de_2026_15_45_27_i95xid.png',
                 'Dica: Resistir nem sempre significa lutar diretamente. Que outras formas de resistência podem existir?',
                 2
             ),
             (
                 'Movimentos abolicionistas',
                 'Ao longo do século XIX, surgiram movimentos abolicionistas que defendiam o fim da escravidão. Esses grupos eram formados por intelectuais, políticos, jornalistas e também por pessoas comuns que acreditavam na liberdade. Eles organizavam campanhas, escreviam artigos, realizavam debates públicos e pressionavam o governo por mudanças. Além disso, muitos ajudavam diretamente na fuga de escravizados ou arrecadavam recursos para libertá-los. Esse movimento ganhou força ao longo do tempo e foi essencial para a conquista da abolição.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777924115/ChatGPT_Image_4_de_mai._de_2026_15_48_04_s3chyp.png',
                 'Dica: Como a mobilização de pessoas pode ajudar a mudar uma sociedade?',
                 3
             ),
             (
                 'Leis anteriores à abolição',
                 'Antes da abolição completa, foram criadas leis que buscavam reduzir gradualmente a escravidão, como a Lei do Ventre Livre (1871), que libertava os filhos de mulheres escravizadas, e a Lei dos Sexagenários (1885), que libertava pessoas com mais de 60 anos. No entanto, essas leis tinham muitas limitações e não resolviam o problema de forma efetiva. Muitas pessoas continuavam vivendo em condições precárias mesmo após serem libertadas. Essas medidas mostram que o fim da escravidão foi um processo gradual e cheio de contradições.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777924397/ChatGPT_Image_4_de_mai._de_2026_15_53_10_xv4iu3.png',
                 'Dica: Essas leis realmente acabavam com a escravidão? Por quê?',
                 4
             )
     ) AS data(title, content, image_url, hint, page_order);


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
    data.image_url,
    data.hint,
    data.page_order
FROM target_unit,
     (
         VALUES
             (
                 'Pressões internas',
                 'No Brasil, cresciam as pressões internas pelo fim da escravidão. Intelectuais, jornalistas e parte da população passaram a defender a abolição como uma questão moral, social e também econômica. Além disso, havia revoltas, fugas e resistência constante por parte das pessoas escravizadas, o que enfraquecia o sistema. Esse conjunto de fatores criou um ambiente de instabilidade, aumentando a necessidade de mudanças. A pressão interna foi fundamental para acelerar o processo de abolição.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777924681/ChatGPT_Image_4_de_mai._de_2026_15_57_48_jzkxlk.png',
                 'Dica: Como a pressão da sociedade pode influenciar decisões políticas?',
                 1
             ),
             (
                 'Pressões externas',
                 'Outros países, especialmente a Inglaterra, também pressionavam o Brasil para acabar com a escravidão. Isso estava ligado tanto a interesses econômicos quanto a ideais políticos, já que o trabalho assalariado era mais vantajoso para o comércio internacional. A Inglaterra, por exemplo, já havia abolido a escravidão em suas colônias e buscava expandir esse modelo. Essas pressões internacionais contribuíram para aumentar o debate sobre o tema no Brasil e influenciar decisões políticas.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777924969/ChatGPT_Image_4_de_mai._de_2026_16_01_40_gmagv4.png',
                 'Dica: Por que outros países se interessariam por decisões internas do Brasil?',
                 2
             ),
             (
                 'Mudanças econômicas',
                 'Ao longo do século XIX, a economia brasileira começou a passar por mudanças. O trabalho assalariado passou a ser visto como uma alternativa mais eficiente em alguns setores, especialmente com a chegada de imigrantes europeus. Esse modelo econômico começou a substituir gradualmente o trabalho escravo, mostrando que a escravidão não era mais considerada essencial em todos os contextos. Essas transformações econômicas contribuíram para enfraquecer o sistema escravista.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777925443/ChatGPT_Image_4_de_mai._de_2026_16_07_10_dzph8m.png',
                 'Dica: Como mudanças na economia podem influenciar decisões sociais?',
                 3
             ),
             (
                 'O papel da monarquia',
                 'A monarquia brasileira, especialmente a princesa Isabel, teve papel importante no processo de abolição. Em 1888, ela assinou a Lei Áurea, que colocou fim oficial à escravidão no Brasil. Esse ato representou uma mudança histórica importante, encerrando legalmente um sistema que durou séculos. No entanto, a decisão também foi resultado de pressões sociais, econômicas e políticas acumuladas ao longo do tempo. A assinatura da lei marcou o fim formal da escravidão, mas não resolveu todos os problemas sociais.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777925447/ChatGPT_Image_4_de_mai._de_2026_16_10_36_dlnjbf.png',
                 'Dica: Por que a assinatura de uma lei pode ser tão importante?',
                 4
             )
     ) AS data(title, content, image_url, hint, page_order);


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
    data.image_url,
    data.hint,
    data.page_order
FROM target_unit,
     (
         VALUES
             (
                 'A liberdade sem apoio',
                 'Após a abolição, as pessoas libertas não receberam apoio do governo, como acesso à terra, educação ou oportunidades de trabalho. Isso dificultou sua integração na sociedade e contribuiu para a continuidade das desigualdades. Muitas pessoas libertas tiveram que sobreviver em condições precárias, sem recursos ou assistência. Essa ausência de políticas públicas teve consequências duradouras na estrutura social do país.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777925655/ChatGPT_Image_4_de_mai._de_2026_16_14_03_o2k8lk.png',
                 'Dica: O que é necessário para garantir que a liberdade seja realmente efetiva?',
                 1
             ),
             (
                 'Desigualdades sociais',
                 'A abolição não resolveu imediatamente os problemas sociais. As desigualdades continuaram, e muitos ex-escravizados enfrentaram dificuldades para sobreviver e se inserir na sociedade. A falta de oportunidades e o preconceito dificultaram a construção de uma vida digna. Essas desigualdades persistem até hoje e fazem parte dos desafios sociais do Brasil. Isso mostra que mudanças legais nem sempre são suficientes para transformar a realidade.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777926027/ChatGPT_Image_4_de_mai._de_2026_16_17_11_zkxaqp.png',
                 'Dica: Por que algumas mudanças levam muito tempo para gerar igualdade?',
                 2
             ),
             (
                 'Transformações na sociedade',
                 'O fim da escravidão trouxe mudanças importantes para a sociedade brasileira, como a ampliação do trabalho livre e novas formas de organização econômica. No entanto, essas transformações ocorreram de forma lenta e desigual. Enquanto alguns setores se desenvolveram, outros permaneceram marcados por dificuldades. A transição do trabalho escravo para o trabalho livre foi um processo gradual e complexo.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777926359/ChatGPT_Image_4_de_mai._de_2026_16_20_20_ulu2vl.png',
                 'Dica: Mudanças sociais acontecem de forma imediata ou gradual?',
                 3
             ),
             (
                 'Impactos históricos',
                 'A abolição da escravidão é um marco importante na história do Brasil, pois representou o fim de um sistema profundamente injusto. No entanto, seus efeitos continuam sendo discutidos até hoje. As consequências sociais, econômicas e culturais desse período ainda influenciam o país. Compreender esse processo é essencial para entender os desafios atuais e refletir sobre a construção de uma sociedade mais justa.',
                 'https://res.cloudinary.com/dwirkp1qv/image/upload/q_auto/f_auto/v1777926384/ChatGPT_Image_4_de_mai._de_2026_16_25_52_a3ckuw.png',
                 'Dica: Como o passado pode influenciar o presente?',
                 4
             )
     ) AS data(title, content, image_url, hint, page_order);