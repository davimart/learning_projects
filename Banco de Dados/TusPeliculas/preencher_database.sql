-- Insert into EVENTO table
INSERT INTO EVENTO (Nome_Evento, Nacionalidade, Tipo, Ano_Inicio) VALUES
('Cannes Film Festival', 'France', 'Film Festival', 1946),
('Sundance Film Festival', 'USA', 'Film Festival', 1978),
('Berlin International Film Festival', 'Germany', 'Film Festival', 1951),
('Venice Film Festival', 'Italy', 'Film Festival', 1932),
('Toronto International Film Festival', 'Canada', 'Film Festival', 1976),
('Cinequest Film & Creativity Festival', 'USA', 'Film Festival', 1990),
('Tokyo International Film Festival', 'Japan', 'Film Festival', 1985),
('San Sebastián International Film Festival', 'Spain', 'Film Festival', 1953),
('Busan International Film Festival', 'South Korea', 'Film Festival', 1996),
('Locarno Film Festival', 'Switzerland', 'Film Festival', 1946),
('International Documentary Film Festival Amsterdam', 'Netherlands', 'Documentary Festival', 1988),
('Sydney Film Festival', 'Australia', 'Film Festival', 1954),
('Shanghai International Film Festival', 'China', 'Film Festival', 1993),
('Mumbai Film Festival', 'India', 'Film Festival', 1997),
('Cairo International Film Festival', 'Egypt', 'Film Festival', 1976),
('Cleveland International Film Festival', 'USA', 'Film Festival', 1977),
('Göteborg Film Festival', 'Sweden', 'Film Festival', 1979),
('Havana Film Festival', 'Cuba', 'Film Festival', 1979),
('Dubai International Film Festival', 'UAE', 'Film Festival', 2004),
('Jerusalem Film Festival', 'Israel', 'Film Festival', 1984);

-- Insert into EDICAO table
INSERT INTO EDICAO (ID_Edicao, Nome_Evento, Ano, Localidade) VALUES
(1, 'Cannes Film Festival', 2022, 'Cannes'),
(2, 'Sundance Film Festival', 2022, 'Park City'),
(3, 'Berlin International Film Festival', 2022, 'Berlin'),
(4, 'Venice Film Festival', 2022, 'Venice'),
(5, 'Toronto International Film Festival', 2022, 'Toronto'),
(6, 'Cinequest Film & Creativity Festival', 2022, 'San Jose'),
(7, 'Tokyo International Film Festival', 2022, 'Tokyo'),
(8, 'San Sebastián International Film Festival', 2022, 'San Sebastián'),
(9, 'Busan International Film Festival', 2022, 'Busan'),
(10, 'Locarno Film Festival', 2022, 'Locarno'),
(11, 'International Documentary Film Festival Amsterdam', 2022, 'Amsterdam'),
(12, 'Sydney Film Festival', 2022, 'Sydney'),
(13, 'Shanghai International Film Festival', 2022, 'Shanghai'),
(14, 'Mumbai Film Festival', 2022, 'Mumbai'),
(15, 'Cairo International Film Festival', 2022, 'Cairo'),
(16, 'Cleveland International Film Festival', 2022, 'Cleveland'),
(17, 'Göteborg Film Festival', 2022, 'Göteborg'),
(18, 'Havana Film Festival', 2022, 'Havana'),
(19, 'Dubai International Film Festival', 2022, 'Dubai'),
(20, 'Jerusalem Film Festival', 2022, 'Jerusalem');

-- Insert into PESSOA table
INSERT INTO PESSOA (ID_Pessoa, Nome, Nome_Arte, Sexo, Ano_nasc, Site, Ano_Estreia, Situacao, Nacionalidade) VALUES
(1, 'Quentin Tarantino', 'Quentin', 'Masculino', '1963-03-27', 'www.quentintarantino.info', 1987, 'ATIVO(A)', 'USA'),
(2, 'Cate Blanchett', 'Cate', 'Feminino', '1969-05-14', 'www.cateblanchett.com', 1992, 'ATIVO(A)', 'Australia'),
(3, 'Pedro Almodóvar', 'Pedro', 'Masculino', '1949-09-25', 'www.pedroalmodovar.com', 1974, 'ATIVO(A)', 'Spain'),
(4, 'Bong Joon-ho', 'Bong', 'Masculino', '1969-09-14', 'www.bongjoonho.com', 2000, 'ATIVO(A)', 'South Korea'),
(5, 'Isabelle Huppert', 'Isabelle', 'Feminino', '1953-03-16', 'www.isabellehuppert.fr', 1971, 'ATIVO(A)', 'France'),
(6, 'Rajkumar Hirani', 'Rajkumar', 'Masculino', '1962-11-20', 'www.rajkumarhirani.com', 2003, 'ATIVO(A)', 'India'),
(7, 'Sofia Coppola', 'Sofia', 'Feminino', '1971-05-14', 'www.sofiacoppola.com', 1999, 'ATIVO(A)', 'USA'),
(8, 'Alfonso Cuarón', 'Alfonso', 'Masculino', '1961-11-28', 'www.alfonsocuaron.com', 1991, 'ATIVO(A)', 'Mexico'),
(9, 'Agnes Varda', 'Agnes', 'Feminino', '1928-05-30', 'www.agnesvarda.com', 1955, 'ATIVO(A)', 'France'),
(10, 'Wong Kar-wai', 'Wong', 'Masculino', '1958-07-17', 'www.wongkarwai.com', 1988, 'ATIVO(A)', 'Hong Kong'),
(11, 'Aki Kaurismäki', 'Aki', 'Masculino', '1957-04-04', 'www.akikaurismaki.com', 1983, 'ATIVO(A)', 'Finland'),
(12, 'Greta Gerwig', 'Greta', 'Feminino', '1983-08-04', 'www.gretagerwig.com', 2006, 'ATIVO(A)', 'USA'),
(13, 'Ang Lee', 'Ang', 'Masculino', '1954-10-23', 'www.anglee.com', 1992, 'ATIVO(A)', 'Taiwan'),
(14, 'Lynne Ramsay', 'Lynne', 'Feminino', '1969-12-05', 'www.lynnramsay.com', 1995, 'ATIVO(A)', 'UK'),
(15, 'Park Chan-wook', 'Park', 'Masculino', '1963-08-23', 'www.parkchanwook.com', 1992, 'ATIVO(A)', 'South Korea'),
(16, 'Agnès Jaoui', 'Agnès', 'Feminino', '1964-10-19', 'www.agnesjaoui.com', 1987, 'ATIVO(A)', 'France'),
(17, 'Spike Lee', 'Spike', 'Masculino', '1957-03-20', 'www.spikelee.com', 1983, 'ATIVO(A)', 'USA'),
(18, 'Amitabh Bachchan', 'Amitabh', 'Masculino', '1942-10-11', 'www.amitabhbachchan.net', 1969, 'ATIVO(A)', 'India'),
(19, 'Lars von Trier', 'Lars', 'Masculino', '1956-04-30', 'www.larsvontrier.com', 1977, 'ATIVO(A)', 'Denmark'),
(20, 'Juliette Binoche', 'Juliette', 'Feminino', '1964-03-09', 'www.juliettebinoche.net', 1983, 'ATIVO(A)', 'France');

-- Insert into FILME table
INSERT INTO FILME (ID_Filme, Titulo_Original, Ano_Prod, Titulo_BR, Data_Estreia, Local_Estreia, Idioma_Original, Arrec_PrimAno, Arrec_Total, Genero_Filme) VALUES
(1, 'Pulp Fiction', 1994, 'Pulp Fiction', '1994-05-21', 'USA', 'English', 5000000, 213928762, 'Não-Documentário'),
(2, 'Blue Jasmine', 2013, 'Blue Jasmine', '2013-07-26', 'USA', 'English', 1800000, 97505481, 'Não-Documentário'),
(3, 'Todo sobre mi madre', 1999, 'All About My Mother', '1999-04-16', 'Spain', 'Spanish', 1200000, 6897205, 'Não-Documentário'),
(4, 'Parasite', 2019, 'Parasita', '2019-05-21', 'South Korea', 'Korean', 5000000, 266902953, 'Não-Documentário'),
(5, 'Elle', 2016, 'Elle', '2016-05-21', 'France', 'French', 2000000, 13144937, 'Não-Documentário'),
(6, 'Munna Bhai M.B.B.S.', 2003, 'Munna Bhai M.B.B.S.', '2003-12-19', 'India', 'Hindi', 1000000, 20000000, 'Não-Documentário'),
(7, 'Lost in Translation', 2003, 'Encontros e Desencontros', '2003-08-29', 'USA', 'English', 3500000, 119723856, 'Não-Documentário'),
(8, 'Roma', 2018, 'Roma', '2018-08-30', 'Mexico', 'Spanish', 4000000, 48958273, 'Não-Documentário'),
(9, 'Cléo de 5 à 7', 1962, 'Cleo das 5 às 7', '1962-04-11', 'France', 'French', 180556, 200000, 'Não-Documentário'),
(10, 'Chungking Express', 1994, 'Chungking Express', '1994-07-14', 'Hong Kong', 'Cantonese', 500000, 1300000, 'Não-Documentário'),
(11, 'Kauas pilvet karkaavat', 1996, 'As Nuvens Correm', '1996-11-01', 'Finland', 'Finnish', 700000, 3300000, 'Não-Documentário'),
(12, 'Lady Bird', 2017, 'Lady Bird', '2017-09-01', 'USA', 'English', 3000000, 79128623, 'Não-Documentário'),
(13, 'Crouching Tiger, Hidden Dragon', 2000, 'O Tigre e o Dragão', '2000-05-20', 'Taiwan', 'Mandarin', 12000000, 213525736, 'Não-Documentário'),
(14, 'We Need to Talk About Kevin', 2011, 'Precisamos Falar Sobre o Kevin', '2011-05-12', 'UK', 'English', 5000000, 10949013, 'Não-Documentário'),
(15, 'Oldboy', 2003, 'Oldboy', '2003-11-21', 'South Korea', 'Korean', 3000000, 14900000, 'Não-Documentário'),
(16, 'Le goût des autres', 2000, 'O Gosto dos Outros', '2000-03-15', 'France', 'French', 2000000, 17950813, 'Não-Documentário'),
(17, 'Do the Right Thing', 1989, 'Faça a Coisa Certa', '1989-06-30', 'USA', 'English', 6000000, 37724289, 'Não-Documentário'),
(18, 'Sholay', 1975, 'Sholay', '1975-08-15', 'India', 'Hindi', 3000000, 30000000, 'Não-Documentário'),
(19, 'Breaking the Waves', 1996, 'Ondas do Destino', '1996-05-18', 'Denmark', 'Danish', 4000000, 6300000, 'Não-Documentário'),
(20, 'Trois couleurs: Rouge', 1994, 'Três Cores: Vermelho', '1994-05-27', 'France', 'French', 3000000, 17281075, 'Não-Documentário');

-- Insert into DIRETOR table
INSERT INTO DIRETOR (ID_Pessoa, ID_Filme, E_Principal) VALUES
(1, 1, TRUE),
(2, 2, TRUE),
(3, 3, TRUE),
(4, 4, TRUE),
(5, 5, TRUE),
(6, 6, TRUE),
(7, 7, TRUE),
(8, 8, TRUE),
(9, 9, TRUE),
(10, 10, TRUE),
(11, 11, TRUE),
(12, 12, TRUE),
(13, 13, TRUE),
(14, 14, TRUE),
(15, 15, TRUE),
(16, 16, TRUE),
(17, 17, TRUE),
(18, 18, TRUE),
(19, 19, TRUE),
(20, 20, TRUE);

-- Insert into PRODUTOR table
INSERT INTO PRODUTOR (ID_Pessoa, ID_Filme) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

-- Insert into ATOR table
INSERT INTO ATOR (ID_Pessoa, ID_Filme, Principal, Personagem) VALUES
(1, 1, TRUE, 'Jules Winnfield'),
(2, 2, TRUE, 'Jasmine French'),
(3, 3, TRUE, 'Lola'),
(4, 4, TRUE, 'Kim Ki-taek'),
(5, 5, TRUE, 'Michèle Leblanc'),
(6, 6, TRUE, 'Munna'),
(7, 7, TRUE, 'Charlotte'),
(8, 8, TRUE, 'Cleo'),
(9, 9, TRUE, 'Chow Mo-wan'),
(10, 10, TRUE, 'M'),
(11, 11, TRUE, 'Aki Kaurismäki'),
(12, 12, TRUE, 'Lady Bird'),
(13, 13, TRUE, 'Li Mu-bai'),
(14, 14, TRUE, 'Eva Khatchadourian'),
(15, 15, TRUE, 'Oh Dae-su'),
(16, 16, TRUE, 'Manie'),
(17, 17, TRUE, 'Mookie'),
(18, 18, TRUE, 'Vijay Verma'),
(19, 19, TRUE, 'Jan Nyman'),
(20, 20, TRUE, 'Anne Laurent');

-- Insert into ROTEIRISTA table
INSERT INTO ROTEIRISTA (ID_Pessoa, ID_Filme) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

-- Insert into PREMIO table
INSERT INTO PREMIO (ID_Edicao, Nome, Tipo, ID_Pessoa, ID_Filme, Vencedor) VALUES
(1, 'Best Director', 'Melhor Diretor', 1, 1, TRUE),
(1, 'Best Actress', 'Melhor Atriz Principal', 2, 2, TRUE),
--(2, 'Best Screenplay', 'Melhor Roteiro', 3, 3, TRUE),
--(2, 'Best Picture', 'Melhor Filme', 4, 4, TRUE),
(3, 'Best Director', 'Melhor Diretor', 5, 5, TRUE),
(3, 'Best Actor', 'Melhor Ator Principal', 6, 6, TRUE),
--(4, 'Best Foreign Language Film', 'Melhor Filme em Língua Estrangeira', 7, 7, TRUE),
--(4, 'Best Cinematography', 'Melhor Fotografia', 8, 8, TRUE),
(5, 'Best Director', 'Melhor Diretor', 9, 9, TRUE),
--(5, 'Best Foreign Language Film', 'Melhor Filme em Língua Estrangeira', 10, 10, TRUE),
--(6, 'Best Original Screenplay', 'Melhor Roteiro Original', 11, 11, TRUE),
--(6, 'Best Picture', 'Melhor Filme', 12, 12, TRUE),
(7, 'Best Director', 'Melhor Diretor', 13, 13, TRUE),
--(7, 'Best Foreign Language Film', 'Melhor Filme em Língua Estrangeira', 14, 14, TRUE),
(8, 'Best Actor', 'Melhor Ator Principal', 15, 15, TRUE),
(8, 'Best Director', 'Melhor Diretor', 16, 16, TRUE),
--(9, 'Best Picture', 'Melhor Filme', 17, 17, TRUE),
(9, 'Best Director', 'Melhor Diretor', 18, 18, TRUE),
(10, 'Best Director', 'Melhor Diretor', 19, 19, TRUE),
(10, 'Best Director', 'Melhor Diretor', 20, 20, TRUE);

-- Insert into MELHOR_FILME table
INSERT INTO MELHOR_FILME (ID_Edicao, ID_Filme, Vencedor) VALUES
(1, 1, TRUE),
(1, 2, FALSE),
(2, 3, TRUE),
(2, 4, FALSE),
(3, 5, TRUE),
(3, 6, FALSE),
(4, 7, TRUE),
(4, 8, FALSE),
(5, 9, TRUE),
(5, 10, FALSE),
(6, 11, TRUE),
(6, 12, FALSE),
(7, 13, TRUE),
(7, 14, FALSE),
(8, 15, TRUE),
(8, 16, FALSE),
(9, 17, TRUE),
(9, 18, FALSE),
(10, 19, TRUE),
(10, 20, FALSE);


-- Insert into JURI table
INSERT INTO JURI (ID_Edicao, ID_Pessoa) VALUES
(2, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);