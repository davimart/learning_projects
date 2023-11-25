CREATE TABLE EVENTO (
  Nome_Evento VARCHAR(50) PRIMARY KEY,
  Nacionalidade VARCHAR(50) NOT NULL,
  Tipo VARCHAR(50) NOT NULL,
  Ano_Inicio DATE NOT NULL
);

CREATE TABLE EDICAO (
  ID_Edicao INT PRIMARY KEY,
  Nome_Evento VARCHAR(50) UNIQUE NOT NULL,
  Ano DATE UNIQUE NOT NULL,
  Localidade VARCHAR(50) NOT NULL,
  FOREIGN KEY (Nome_Evento) REFERENCES EVENTO(Nome_Evento)
);

CREATE TYPE GENERO AS ENUM ('Masculino', 'Feminino', 'Não-Binário');
CREATE TYPE SITUACAO AS ENUM('APOSENTADO(A)', 'ATIVO(A)', 'FALECIDO(A)');

CREATE TABLE PESSOA (
ID_Pessoa int PRIMARY KEY,
  Nome VARCHAR(50) NOT NULL,
  Nome_Arte VARCHAR(50),
  Sexo GENERO NOT NULL,
  Ano_nasc SMALLINT NOT NULL,
  Site VARCHAR(50),
  Ano_Estreia SMALLINT NOT NULL,
  Situacao SITUACAO NOT NULL,
  Nacionalidade VARCHAR(50) NOT NULL

  CONSTRAINT ANO CHECK(Ano_Estreia >= 1888 AND Ano_Estreia <= 2200)
);


CREATE TABLE FILME(
ID_Filme INT PRIMARY KEY,
  Titulo_Original VARCHAR(50) NOT NULL,
  Ano_Prod SMALLINT NOT NULL,
  Titulo_BR VARCHAR(50),
  Data_Estreia DATE NOT NULL,
  Local_Estreia VARCHAR(50),
  Idioma_Original VARCHAR(50) NOT NULL,
  Arrec_PrimAno INT,
  Arrec_Total INT,
 
  CONSTRAINT Estreia_Antes_Da_Prod CHECK(EXTRACT(YEAR FROM Data_Estreia) >= Ano_Prod),
  CONSTRAINT Arrecadacao CHECK(Arrec_Total >= Arrec_PrimAno)
);

CREATE TYPE CATEGORIA AS ENUM('Melhor Ator Principal', 'Melhor Ator Coadjuvante','Melhor Atriz Principal', 'Melhor Atriz Coadjuvante', 'Melhor Diretor');

CREATE TABLE PREMIO (
  ID_Edicao INT NOT NULL,
  Nome VARCHAR(50) NOT NULL,
  Tipo CATEGORIA NOT NULL,
  ID_Pessoa INT NOT NULL,
  ID_Filme INT NOT NULL,
  Vencedor BOOL DEFAULT FALSE,
  FOREIGN KEY (ID_Edicao) REFERENCES EDICAO(ID_Edicao),
  PRIMARY KEY (ID_Edicao, Tipo),
  FOREIGN KEY (ID_Pessoa) REFERENCES PESSOA(ID_Pessoa),
  FOREIGN KEY (ID_Filme) REFERENCES FILME(ID_Filme)
);

CREATE TABLE MELHOR_FILME(
ID_Edicao INT NOT NULL,
  ID_Filme INT NOT NULL,
  Vencedor BOOL not NULL,
  FOREIGN KEY (ID_Edicao) REFERENCES EDICAO(ID_Edicao),
  FOREIGN KEY (ID_Filme) REFERENCES FILME(ID_Filme),
  PRIMARY KEY (ID_Edicao, ID_Filme)
);

CREATE TABLE DOCUMENTARIOS(
ID_Filme INT NOT NULL,
  FOREIGN KEY (ID_Filme) REFERENCES FILME(ID_Filme),
  PRIMARY KEY (ID_Filme)
);

CREATE TABLE OUTROS_FILMES(
ID_Filme INT NOT NULL,
  FOREIGN KEY (ID_Filme) REFERENCES FILME(ID_Filme),
  PRIMARY KEY (ID_Filme)
);

-- Aqui, foi necessário criar as constraints depois da criação das tabelas
-- pois quando a tabela DOCUMENTARIOS é criada a tabela OUTROS_FILMES aindaDOCUMENTARIOS
-- não existe, e portanto não pode ser referenciada

-- Alter table DOCUMENTARIOS add CONSTRAINT DOC_NAO_OUTROS check(not exists (Select 1 from OUTROS_FILMES where DOCUMENTARIOS.ID_Filme = OUTROS_FILMES.ID_Filme));
-- Alter table OUTROS_FILMES Add CONSTRAINT OUTROS_NAO_DOC check(ID_Filme not in (Select ID_Filme from DOCUMENTARIOS));

CREATE TABLE DIRETOR(
ID_Pessoa INT NOT NULL,
  ID_Filme INT NOT NULL,
  E_Principal BOOL DEFAULT FALSE,
  FOREIGN key (ID_Pessoa) REFERENCES PESSOA(ID_Pessoa),
  FOREIGN key (ID_Filme) REFERENCES FILME(ID_Filme),
  PRIMARY KEY (ID_Pessoa, ID_Filme)
);

CREATE TABLE PRODUTOR(
ID_Pessoa INT NOT NULL,
  ID_Filme INT NOT NULL,
  FOREIGN key (ID_Pessoa) REFERENCES PESSOA(ID_Pessoa),
  FOREIGN key (ID_Filme) REFERENCES FILME(ID_Filme),
  PRIMARY KEY (ID_Pessoa, ID_Filme)
);

CREATE TABLE ATOR(
ID_Pessoa INT NOT NULL,
  ID_Filme INT NOT NULL,
  Principal BOOL DEFAULT FALSE,
  Personagem varchar(50) NOT NULL,
  FOREIGN key (ID_Pessoa) REFERENCES PESSOA(ID_Pessoa),
  FOREIGN key (ID_Filme) REFERENCES FILME(ID_Filme),
  PRIMARY KEY (ID_Pessoa, ID_Filme)
);

CREATE TABLE ROTEIRISTA(
ID_Pessoa INT NOT NULL,
  ID_Filme INT NOT NULL,
  FOREIGN key (ID_Pessoa) REFERENCES PESSOA(ID_Pessoa),
  FOREIGN key (ID_Filme) REFERENCES FILME(ID_Filme),
  PRIMARY KEY (ID_Pessoa, ID_Filme)
);

CREATE TABLE JURI(
ID_Edicao INT NOT NULL,
  ID_Pessoa INT NOT NULL,
  FOREIGN KEY (ID_Edicao) REFERENCES EDICAO(ID_Edicao),
  FOREIGN KEY (ID_Pessoa) REFERENCES PESSOA(ID_Pessoa),
  PRIMARY KEY (ID_Edicao, ID_Pessoa)
);






