/*

2. Desenvolva uma pequena aplicação que: 80%
(30%)
a. Permita cadastrar pessoas 
*/
INSERT INTO PESSOA (ID_Pessoa, Nome, Nome_Arte, Sexo, Ano_nasc, Site, Ano_Estreia, Situacao, Nacionalidade)
VALUES (1, 'John Doe', 'JD', 'Masculino', '1990-01-01', 'http://example.com', '2010', 'ATIVO(A)', 'Brazil');

/*
cadastre eventos 
*/
INSERT INTO EVENTO (Nome_Evento, Nacionalidade, Tipo, Ano_Inicio)
VALUES ('Example Event', 'International', 'Conference', '2022');

--cadastre edicão

INSERT INTO EDICAO (ID_Edicao, Nome_Evento, Ano, Localidade)
VALUES (1, 'Example Event', '2022', 'City XYZ');



/*
e prêmios, nominações, premiações
-- para gente essa parte era tudo uma coisa só
*/
INSERT INTO PREMIO (ID_Edicao, Nome, Tipo, ID_Pessoa, ID_Filme, Vencedor)
VALUES (1, 'Example Award', 'Melhor Ator Principal', 123, 456, TRUE);

--e/ou

INSERT INTO MELHOR_FILME (ID_Edicao, ID_Filme, Vencedor)
VALUES (1, 123, TRUE);

/*
, e filmes.
*/
INSERT INTO FILME (
    ID_Filme,
    Titulo_Original,
    Ano_Prod,
    Titulo_BR,
    Data_Estreia,
    Local_Estreia,
    Idioma_Original,
    Arrec_PrimAno,
    Arrec_Total,
    Genero_Filme
)
VALUES (
    1,
    'Sample Movie',
    '2022',
    'Filme de Exemplo',
    '2022-01-01',
    'City Theater',
    'Portuguese',
    5000000,
    10000000,
    'Documentário'
);



/*
*/

/*
(50%)
b. Resolva os seguintes resultados: 
i. Gerar um gráfico, histograma, que apresente os dez atores (atrizes) com maior número de prêmios. 
*/

SELECT P.Nome, COUNT(*) AS Numero_Premios
FROM PESSOA P
JOIN PREMIO PR ON P.ID_Pessoa = PR.ID_Pessoa
WHERE PR.Tipo IN ('Melhor Ator Principal', 'Melhor Ator Coadjuvante','Melhor Atriz Principal', 'Melhor Atriz Coadjuvante') 
AND PR.Vencedor = True
GROUP BY P.ID_Pessoa, P.Nome
ORDER BY Numero_Premios DESC
LIMIT 10;


    
--ii. Gerar um gráfico, histograma, que apresente os 10 filmes mais premiados.
SELECT F.Titulo_Original, COUNT(*) AS Numero_Premios
FROM FILME F
LEFT JOIN PREMIO P ON F.ID_Filme = P.ID_Filme
LEFT JOIN MELHOR_FILME MF ON F.ID_Filme = MF.ID_Filme,
WHERE P.Vencedor = TRUE OR MF.Vencedor  = TRUE
GROUP BY F.ID_Filme, F.Titulo_Original
ORDER BY Numero_Premios DESC
LIMIT 10;


    
--iii. Gerar um gráfico, histograma, que apresente os 10 filmes com maior arrecadação
SELECT Titulo_Original, Arrec_Total
FROM FILME
ORDER BY Arrec_Total DESC
LIMIT 10;

--iv. Listar os atores (atrizes) nominados como melhor ator em todos os eventos existentes”.
SELECT P.Nome
FROM PESSOA P
NOT EXISTS (
    SELECT E.ID_Edicao
    FROM EVENTO E
    WHERE NOT EXISTS (
      SELECT 1
      FROM PREMIO PR
      WHERE PR.ID_Pessoa = P.ID_Pessoa
        AND PR.ID_Edicao = E.ID_Edicao
        AND PR.Tipo IN ('Melhor Ator Principal', 'Melhor Ator Coadjuvante','Melhor Atriz Principal', 'Melhor Atriz Coadjuvante')
    )
  );


--v. Dado um prêmio, indique quais foram os autores ou filmes nominados e premiados.

-- Replace 'your_award_id' with the actual ID of the award you are interested in.
DECLARE @edition_id INT = edicao;
DECLARE @tipo INT = tipo;
-- For authors (Diretor, Produtor, Ator, Roteirista), if applicable
SELECT P.Nome, PR.Vencedor
FROM PREMIO PR
JOIN PESSOA P ON PR.ID_Pessoa = P.ID_Pessoa
WHERE PR.ID_Edicao =  @edition_id and PR.Tipo = @tipo;

-- For films (Melhor Filme, etc.)
SELECT F.Titulo_Original, MF.Vencedor
FROM MELHOR_FILME MF
JOIN FILME F ON MF.ID_Filme = F.ID_Filme -- Assuming 'Melhor ' is the prefix for film categories
WHERE MF.ID_Edicao = @edition_id;



