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


--Pessoa tem que trabalhar no filme em que ela foi indicada e ser do mesmo sexo da indicação

--ENUM('Melhor Ator Principal', 'Melhor Ator Coadjuvante','Melhor Atriz Principal', 'Melhor Atriz Coadjuvante', 'Melhor Diretor')
CREATE OR REPLACE FUNCTION PARTICIPA_FILME()
RETURNS TRIGGER AS $$
BEGIN
    -- Não trabalhou como ator nesse filme
    CASE
        WHEN NEW.ID_Pessoa NOT IN (SELECT ID_Pessoa FROM ATOR WHERE ATOR.ID_Filme = NEW.ID_Filme) THEN
            RAISE EXCEPTION 'A pessoa % não trabalhou como ator no filme %', NEW.ID_Pessoa, NEW.ID_Filme;
    END CASE;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER TRIGGER_PARTICIPA_FILME
BEFORE INSERT OR UPDATE
ON PREMIO
FOR EACH ROW
EXECUTE FUNCTION PARTICIPA_FILME();



