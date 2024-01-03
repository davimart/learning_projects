# database_operations.py

def cadastrar_pessoas():
    print("Executando cadastrar_pessoas")

    # Obter entradas do usuário
    nome = input("Digite o nome: ")
    nome_arte = input("Digite o nome artístico: ")
    sexo = input("Digite o gênero: ")
    ano_nasc = input("Digite o ano de nascimento: ")
    site = input("Digite o site: ")
    ano_estreia = input("Digite o ano de estreia: ")
    situacao = input("Digite a situação (por exemplo, ATIVO(A)): ")
    nacionalidade = input("Digite a nacionalidade: ")

    # Construir a consulta SQL
    query = f"INSERT INTO PESSOA (Nome, Nome_Arte, Sexo, Ano_nasc, Site, Ano_Estreia, Situacao, Nacionalidade) " \
            f"VALUES ('{nome}', '{nome_arte}', '{sexo}', '{ano_nasc}', '{site}', '{ano_estreia}', '{situacao}', '{nacionalidade}');"
    return query  # Retornar a consulta SQL


def cadastrar_eventos():
    print("Executando cadastrar_eventos")

    # Obter entradas do usuário
    nome_evento = input("Digite o nome do evento: ")
    nacionalidade = input("Digite a nacionalidade: ")
    tipo = input("Digite o tipo de evento: ")
    ano_inicio = input("Digite o ano de início: ")

    # Construir a consulta SQL
    query = f"INSERT INTO EVENTO (Nome_Evento, Nacionalidade, Tipo, Ano_Inicio) " \
            f"VALUES ('{nome_evento}', '{nacionalidade}', '{tipo}', '{ano_inicio}');"

    return query  # Retornar a consulta SQL

def cadastrar_edicao():
    print("Executando cadastrar_edicao")

    # Obter entradas do usuário
    nome_evento = input("Digite o nome do evento: ")
    ano = input("Digite o ano da edição: ")
    localidade = input("Digite a localidade da edição: ")

    # Construir a consulta SQL
    query = f"INSERT INTO EDICAO (Nome_Evento, Ano, Localidade) " \
            f"VALUES ('{nome_evento}', '{ano}', '{localidade}');"

    return query  # Retornar a consulta SQL

# database_operations.py

def cadastrar_premios():
    print("Executando cadastrar_premios")

    # Obter entradas do usuário
    id_edicao = input("Digite o ID da edição: ")
    nome_premio = input("Digite o nome do prêmio: ")
    tipo_premio = input("Digite o tipo do prêmio: ")
    id_pessoa = input("Digite o ID da pessoa: ")
    id_filme = input("Digite o ID do filme: ")
    vencedor = input("Digite se é o vencedor (TRUE/FALSE): ")

    # Construir a consulta SQL
    query = f"INSERT INTO PREMIO (ID_Edicao, Nome, Tipo, ID_Pessoa, ID_Filme, Vencedor) " \
            f"VALUES ({id_edicao}, '{nome_premio}', '{tipo_premio}', {id_pessoa}, {id_filme}, {vencedor});"

    return query  # Retornar a consulta SQL
# database_operations.py

def cadastrar_melhor_filme():
    print("Executando cadastrar_melhor_filme")

    # Obter entradas do usuário
    id_edicao = input("Digite o ID da edição: ")
    id_filme = input("Digite o ID do filme: ")
    vencedor = input("Digite se é o vencedor (TRUE/FALSE): ")

    # Construir a consulta SQL
    query = f"INSERT INTO MELHOR_FILME (ID_Edicao, ID_Filme, Vencedor) " \
            f"VALUES ({id_edicao}, {id_filme}, {vencedor});"

    return query  # Retornar a consulta SQL


def cadastrar_filmes():
    print("Executando cadastrar_filmes")

    # Obter entradas do usuário
    id_filme = input("Digite o ID do filme: ")
    titulo_original = input("Digite o título original: ")
    ano_prod = input("Digite o ano de produção: ")
    titulo_br = input("Digite o título em português: ")
    data_estreia = input("Digite a data de estreia (formato YYYY-MM-DD): ")
    local_estreia = input("Digite o local de estreia: ")
    idioma_original = input("Digite o idioma original: ")
    arrec_prim_ano = input("Digite a arrecadação no primeiro ano: ")
    arrec_total = input("Digite a arrecadação total: ")
    genero_filme = input("Digite o gênero do filme: ")

    # Construir a consulta SQL
    query = f"INSERT INTO FILME (ID_Filme, Titulo_Original, Ano_Prod, Titulo_BR, Data_Estreia, Local_Estreia, Idioma_Original, Arrec_PrimAno, Arrec_Total, Genero_Filme) " \
            f"VALUES ({id_filme}, '{titulo_original}', '{ano_prod}', '{titulo_br}', '{data_estreia}', '{local_estreia}', '{idioma_original}', {arrec_prim_ano}, {arrec_total}, '{genero_filme}');"

    return query  # Retornar a consulta SQL


def gerar_grafico_atores():
    print("Executing gerar_grafico_atores")
    # Implement the logic to generate a graph for atores
    # ...
    query = "SELECT * FROM atores"

    return query  # You can modify this to return relevant information

def gerar_grafico_filmes():
    print("Executing gerar_grafico_filmes")
    # Implement the logic to generate a graph for filmes
    # ...
    query = "SELECT * FROM filmes"

    return query  # You can modify this to return relevant information

def gerar_grafico_arrecadacao():
    print("Executing gerar_grafico_arrecadacao")
    # Implement the logic to generate a graph for arrecadacao
    # ...
    query = "SELECT * FROM arrecadacao"

    return query  # You can modify this to return relevant information

def listar_melhores_atores():
    print("Executing listar_melhores_atores")
    # Implement the logic to list melhores atores
    # ...
    query = "SELECT * FROM melhores_atores"

    return query  # You can modify this to return relevant information

def listar_premios_por_evento(evento_id):
    print(f"Executing listar_premios_por_evento for evento_id {evento_id}")
    # Implement the logic to list premios for a given evento
    # ...
    query = f"SELECT * FROM premios WHERE evento_id = {evento_id}"

    return query  # You can modify this to return relevant information
