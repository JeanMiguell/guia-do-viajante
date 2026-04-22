WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Independência do Brasil'
      AND u.title = 'Caminho para a Independência'
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
                 'O Brasil no período colonial',
                 'Durante grande parte de sua história, o Brasil foi uma colônia de Portugal, o que significava que suas atividades econômicas e políticas estavam subordinadas aos interesses da metrópole. O pacto colonial impunha restrições ao comércio e limitava a autonomia da colônia, garantindo que as riquezas produzidas aqui beneficiassem principalmente Portugal. Esse modelo começou a gerar insatisfação entre grupos locais, especialmente aqueles que desejavam maior liberdade econômica.',
                 'Dica: Como você acha que os colonos se sentiam ao não poder negociar livremente?',
                 1
             ),
             (
                 'Influências externas',
                 'O processo de independência do Brasil foi influenciado por movimentos que ocorreram em outras partes do mundo, como a Independência dos Estados Unidos e a Revolução Francesa. Essas transformações difundiram ideias de liberdade, igualdade e autonomia, inspirando elites brasileiras a questionarem o domínio português.',
                 'Dica: Como eventos em outros países podem influenciar mudanças locais?',
                 2
             ),
             (
                 'A presença da Corte no Brasil',
                 'A transferência da família real portuguesa para o Brasil, em 1808, trouxe mudanças importantes, como a abertura dos portos e a criação de instituições. Essas transformações aumentaram a importância do Brasil dentro do Império Português e fortaleceram sua autonomia, criando condições favoráveis para o processo de independência.',
                 'Dica: O que muda quando uma colônia passa a ter mais autonomia?',
                 3
             ),
             (
                 'O retorno da Corte a Portugal',
                 'Em 1821, Dom João VI retornou a Portugal, deixando seu filho Dom Pedro como regente do Brasil. Ao mesmo tempo, as Cortes portuguesas tentaram recolonizar o Brasil, impondo medidas que reduziriam sua autonomia. Isso gerou descontentamento entre as elites brasileiras.',
                 'Dica: Por que a tentativa de retirar autonomia pode gerar conflitos?',
                 4
             )
     ) AS data(title, content, hint, page_order);


WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Independência do Brasil'
      AND u.title = 'Os Conflitos e Decisões'
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
                 'Pressões das Cortes Portuguesas',
                 'As Cortes portuguesas exigiam que Dom Pedro retornasse a Portugal e que o Brasil voltasse à condição de colônia. Essas pressões ameaçavam as conquistas obtidas durante a permanência da Corte no Brasil e geraram forte reação entre os grupos locais.',
                 'Dica: O que você faria diante da perda de direitos já conquistados?',
                 1
             ),
             (
                 'O Dia do Fico',
                 'Em 1822, Dom Pedro tomou uma decisão importante ao declarar que permaneceria no Brasil, contrariando as ordens das Cortes portuguesas. Esse episódio ficou conhecido como o "Dia do Fico" e foi um passo decisivo rumo à independência.',
                 'Dica: Por que essa decisão foi tão importante?',
                 2
             ),
             (
                 'O Grito do Ipiranga',
                 'Em 7 de setembro de 1822, Dom Pedro proclamou a independência do Brasil às margens do rio Ipiranga, declarando a separação de Portugal. Esse momento ficou conhecido como o "Grito do Ipiranga" e simboliza o nascimento do Brasil como nação independente.',
                 'Dica: Por que esse momento se tornou um símbolo da independência?',
                 3
             ),
             (
                 'A consolidação da independência',
                 'Após a declaração, ainda houve conflitos em algumas regiões até que a independência fosse consolidada. Portugal só reconheceu oficialmente a independência do Brasil em 1825, após negociações e acordos diplomáticos.',
                 'Dica: Por que um país precisa reconhecer a independência de outro?',
                 4
             )
     ) AS data(title, content, hint, page_order);


WITH target_unit AS (
    SELECT u.id
    FROM units u
             JOIN history_events he ON he.id = u.history_event_id
    WHERE he.name = 'Independência do Brasil'
      AND u.title = 'O Brasil Independente'
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
                 'Formação do Império do Brasil',
                 'Após a independência, o Brasil se tornou uma monarquia, com Dom Pedro I como imperador. Esse modelo político manteve várias estruturas do período colonial, mas marcou o início de uma nova fase na história do país.',
                 'Dica: O que mudou e o que permaneceu igual após a independência?',
                 1
             ),
             (
                 'Desafios do novo país',
                 'O Brasil independente enfrentou diversos desafios, como a organização política, a definição de leis e a manutenção da unidade territorial. Além disso, persistiam desigualdades sociais e econômicas herdadas do período colonial.',
                 'Dica: Quais desafios você acha que um país recém-independente enfrenta?',
                 2
             ),
             (
                 'Continuidade da escravidão',
                 'Apesar da independência, o Brasil manteve a escravidão como base de sua economia por várias décadas. Isso mostra que nem todas as estruturas sociais foram transformadas imediatamente após a separação de Portugal.',
                 'Dica: Por que algumas mudanças demoram mais para acontecer?',
                 3
             ),
             (
                 'Impactos duradouros',
                 'A independência marcou o início de uma nova etapa na história do Brasil, permitindo maior autonomia política e econômica. No entanto, muitos desafios e desigualdades continuaram presentes, influenciando o desenvolvimento do país ao longo do tempo.',
                 'Dica: Como eventos históricos continuam influenciando o presente?',
                 4
             )
     ) AS data(title, content, hint, page_order);