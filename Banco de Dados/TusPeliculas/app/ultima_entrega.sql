/*

Para o sistema de Filmes, vocês vão ter que desenvolver:

1. Devem ser controladas as seguintes restrições de integridade perdidas no mapeamento ao esquema relacional (Implemente em SQL uma solução para isso): 20%
    a. Deve-se considerar que uma pessoa não pode ser júri de um Evento se participar de um filme aí indicado, com qualquer papel. 
*/

-- Juri imparcial

-- a ideia na verdade é pegar todos os filmes indicados 
-- juntar com todas as pessoas que trabalharam em filmes e considerar a edição

CREATE OR REPLACE FUNCTION JURI_IMPARCIAL() RETURNS TRIGGER AS $$
BEGIN
IF NEW.ID_Pessoa IN
    (WITH CombinedPeople AS (
    SELECT ID_Filme, ID_Pessoa
    FROM DIRETOR AS D
    FULL OUTER JOIN PRODUTOR AS P USING(ID_Pessoa,ID_Filme)
    FULL OUTER JOIN ATOR AS A USING(ID_Pessoa,ID_Filme)
    FULL OUTER JOIN ROTEIRISTA AS R USING(ID_Pessoa,ID_Filme)
),

FilmesIndicados AS (
    Select ID_Edicao, ID_Filme, ID_Pessoa
    FROM PREMIO
    FULL OUTER JOIN MELHOR_FILME USING (ID_Edicao, ID_Filme)
)


SELECT ID_Pessoa
FROM FilmesIndicados
JOIN CombinedPeople USING(ID_Filme, ID_Pessoa)
WHERE NEW.ID_Edicao = ID_Edicao) THEN RAISE
EXCEPTION 'Esta pessoa participa de um filme nesta edição e não pode ser juri. ID_Pessoa: %',
          NEW.ID_Pessoa;

END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER TRIGGER_JURI_IMPARCIAL
BEFORE
INSERT
OR
UPDATE ON JURI
FOR EACH ROW EXECUTE FUNCTION JURI_IMPARCIAL();



-- Juri imparcial - o que a gente fez para a outra entrega
CREATE OR REPLACE FUNCTION JURI_IMPARCIAL()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM PREMIO WHERE JURI.ID_Edicao = PREMIO.ID_Edicao AND PREMIO.ID_Pessoa = NEW.ID_Pessoa) THEN
        RAISE EXCEPTION 'Esta pessoa está concorrendo a prêmios e não pode ser juri. ID_Pessoa: %', NEW.ID_Pessoa;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER TRIGGER_JURI_IMPARCIAL
BEFORE INSERT OR UPDATE
ON JURI
FOR EACH ROW
EXECUTE FUNCTION JURI_IMPARCIAL();

/*
    b. Que um filme que foi documentário não tem atores. 

*/

-- Documentário não tem atores -  o que a gente fez para outra entrega e acho que não precisa mudar
CREATE OR REPLACE FUNCTION DOC_SEM_ATORES()
RETURNS TRIGGER AS $$
BEGIN
    IF (SELECT Genero_Filme FROM FILME WHERE FILME.ID_Filme = NEW.ID_Filme) = 'Documentário' THEN
        RAISE EXCEPTION 'Documentários não tem atores. ID_Filme: %', NEW.ID_Filme;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER TRIGGER_DOC_SEM_ATORES
BEFORE INSERT OR UPDATE
ON ATOR
FOR EACH ROW
EXECUTE FUNCTION DOC_SEM_ATORES();

