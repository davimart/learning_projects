-- Juri imparcial
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


-- Pessoa tem que encaixar na categoria proposta
-- ('Melhor Ator Principal', 'Melhor Ator Coadjuvante','Melhor Atriz Principal', 'Melhor Atriz Coadjuvante', 'Melhor Diretor')
CREATE OR REPLACE FUNCTION PREMIO_ATOR()
RETURNS TRIGGER AS $$
BEGIN
    CASE
        WHEN NEW.TIPO = 'Melhor Ator Principal' THEN
            CASE
                -- Não trabalhou como ator nesse filme
                WHEN NEW.ID_Pessoa NOT IN (SELECT ID_Pessoa FROM ATOR WHERE ATOR.ID_Filme = NEW.ID_Filme) THEN
                    RAISE EXCEPTION 'A pessoa % não trabalhou como ator no filme %', NEW.ID_Pessoa, NEW.ID_Filme;

                -- Não é do sexo do tipo/categoria do premio
                WHEN (SELECT SEXO FROM PESSOA WHERE PESSOA.ID_Pessoa = NEW.ID_Pessoa) NOT IN ('Masculino', 'Não-Binário') THEN
                    RAISE EXCEPTION 'A pessoa não se encaixa nessa categoria devido ao sexo';

                -- Não é um ator principal nesse filme
                WHEN (SELECT Principal FROM ATOR WHERE ATOR.ID_Filme = NEW.ID_Filme AND ATOR.ID_Pessoa = NEW.ID_Pessoa) <> 1 THEN
                    RAISE EXCEPTION 'A pessoa % não foi um ator principal no filme %', NEW.ID_Pessoa, NEW.ID_Filme;
            END CASE;
        WHEN NEW.TIPO = 'Melhor Ator Coadjuvante' THEN
            CASE
                -- Não trabalhou como ator nesse filme
                WHEN NEW.ID_Pessoa NOT IN (SELECT ID_Pessoa FROM ATOR WHERE ATOR.ID_Filme = NEW.ID_Filme) THEN
                    RAISE EXCEPTION 'A pessoa % não trabalhou como ator no filme %', NEW.ID_Pessoa, NEW.ID_Filme;

                -- Não é do sexo do tipo/categoria do premio
                WHEN (SELECT SEXO FROM PESSOA WHERE PESSOA.ID_Pessoa = NEW.ID_Pessoa) NOT IN ('Masculino', 'Não-Binário') THEN
                    RAISE EXCEPTION 'A pessoa não se encaixa nessa categoria devido ao sexo';

                -- Não é um ator coadjuvante nesse filme
                WHEN (SELECT Principal FROM ATOR WHERE ATOR.ID_Filme = NEW.ID_Filme AND ATOR.ID_Pessoa = NEW.ID_Pessoa) <> 0 THEN
                    RAISE EXCEPTION 'A pessoa % não foi um ator coadjuvante no filme %', NEW.ID_Pessoa, NEW.ID_Filme;
            END CASE;
        WHEN NEW.TIPO = 'Melhor Atriz Principal' THEN
            CASE
                -- Não trabalhou como ator nesse filme
                WHEN NEW.ID_Pessoa NOT IN (SELECT ID_Pessoa FROM ATOR WHERE ATOR.ID_Filme = NEW.ID_Filme) THEN
                    RAISE EXCEPTION 'A pessoa % não trabalhou como ator no filme %', NEW.ID_Pessoa, NEW.ID_Filme;

                -- Não é do sexo do tipo/categoria do premio
                WHEN (SELECT SEXO FROM PESSOA WHERE PESSOA.ID_Pessoa = NEW.ID_Pessoa) NOT IN ('Feminino', 'Não-Binário') THEN
                    RAISE EXCEPTION 'A pessoa não se encaixa nessa categoria devido ao sexo';

                -- Não é uma atriz principal nesse filme
                WHEN (SELECT Principal FROM ATOR WHERE ATOR.ID_Filme = NEW.ID_Filme AND ATOR.ID_Pessoa = NEW.ID_Pessoa) <> 1 THEN
                    RAISE EXCEPTION 'A pessoa % não foi uma atriz principal no filme %', NEW.ID_Pessoa, NEW.ID_Filme;
            END CASE;
        WHEN NEW.TIPO = 'Melhor Atriz Coadjuvante' THEN
            CASE
                -- Não trabalhou como ator nesse filme
                WHEN NEW.ID_Pessoa NOT IN (SELECT ID_Pessoa FROM ATOR WHERE ATOR.ID_Filme = NEW.ID_Filme) THEN
                    RAISE EXCEPTION 'A pessoa % não trabalhou como ator no filme %', NEW.ID_Pessoa, NEW.ID_Filme;

                -- Não é do sexo do tipo/categoria do premio
                WHEN (SELECT SEXO FROM PESSOA WHERE PESSOA.ID_Pessoa = NEW.ID_Pessoa) NOT IN ('Feminino', 'Não-Binário') THEN
                    RAISE EXCEPTION 'A pessoa não se encaixa nessa categoria devido ao sexo';

                -- Não é um ator coadjuvante nesse filme
                WHEN (SELECT Principal FROM ATOR WHERE ATOR.ID_Filme = NEW.ID_Filme AND ATOR.ID_Pessoa = NEW.ID_Pessoa) <> 0 THEN
                    RAISE EXCEPTION 'A pessoa % não foi um ator coadjuvante no filme %', NEW.ID_Pessoa, NEW.ID_Filme;
            END CASE;
        -- Remove the unnecessary empty CASE statement
    END CASE;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER TRIGGER_PREMIO_ATOR
BEFORE INSERT OR UPDATE
ON PREMIO
FOR EACH ROW
EXECUTE FUNCTION PREMIO_ATOR();

-- Se é diretor do filme indicado
CREATE OR REPLACE FUNCTION DIRETOR_PREMIO()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.ID_Pessoa NOT IN (SELECT ID_Pessoa FROM DIRETOR WHERE DIRETOR.ID_Filme = NEW.ID_Filme) THEN
        RAISE EXCEPTION 'A pessoa % não trabalhou como diretor no filme %', NEW.ID_Pessoa, NEW.ID_Filme;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER TRIGGER_DIRETOR_PREMIO
BEFORE INSERT OR UPDATE
ON PREMIO
FOR EACH ROW
EXECUTE FUNCTION DIRETOR_PREMIO();

-- Se o filme é do ano anterior a edicao do premio
CREATE OR REPLACE FUNCTION FILME_ANO_PREMIO()
RETURNS TRIGGER AS $$
BEGIN

    IF (SELECT EXTRACT(YEAR FROM Data_Estreia) FROM FILME WHERE FILME.ID_Filme = NEW.ID_Filme) = (SELECT Ano FROM EDICAO WHERE EDICAO.ID_Edicao = NEW.ID_Edicao) - 1
    THEN RAISE EXCEPTION 'O filme % não elígvel por conta do ano', NEW.ID_Filme;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER TRIGGER_FILME_ANO_PREMIO
BEFORE INSERT OR UPDATE
ON PREMIO
FOR EACH ROW
EXECUTE FUNCTION FILME_ANO_PREMIO();




