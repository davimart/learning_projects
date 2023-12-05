import pandas as pd
import matplotlib.pyplot as plt
import os

def dummy_acesso_internet(df):
    df.rename(columns={'Q025': 'Acesso_Internet'}, inplace=True)

    # Substituir os valores 'A' por 0 e 'B' por 1 
    df['Acesso_Internet'] = df['Acesso_Internet'].replace({'A': 0, 'B': 1})
    return df

def dummy_renda_familiar(df):
    #RENDA FAMILIAR
    #Q006 - Qual é a renda mensal de sua família? (Some a sua renda com a dos seus familiares.)
    #A-B
    #Nenhuma Renda
    #Até R$ 1.212,00
    #C-E
    #De R$ 1.212,01 até R$ 1.818,00.
    #De R$ 1.818,01 até R$ 2.424,00.
    #De R$ 2.424,01 até R$ 3.030,00.
    #F+
    #De R$ 3.030,01 até máximo

    df['Ate_1212'] = df['Q006'].isin(['A', 'B']).astype(int)
    df['Entre_1212_e_3030'] = df['Q006'].isin(['C','D','E']).astype(int)         
    #Para além de 3.030,00 não precisa pq se for 0 nas duas primeiras é para além

    df = df.drop('Q006', axis=1)
    return df

def dummy_escolaridade_parente(df):
    #'Q001' Até que série seu pai, ou o homem responsável por você, estudou?
    #'Q002' Até que série seu mãe, ou o homem responsável por você, estudou?
    #A	Nunca estudou.
    #B	Não completou a 4ª série/5º ano do Ensino Fundamental.
    #C	Completou a 4ª série/5º ano, mas não completou a 8ª série/9º ano do Ensino Fundamental.
    #D	Completou a 8ª série/9º ano do Ensino Fundamental, mas não completou o Ensino Médio.
    # Separação
    #E	Completou o Ensino Médio, mas não completou a Faculdade.
    #Separação
    #F	Completou a Faculdade, mas não completou a Pós-graduação.
    #G	Completou a Pós-graduação.
    #H	Não sei.

    # Remover linhas onde é 'H'
    parentes = ['Q001','Q002']
    for parente in parentes:
        df = df[df[parente] != 'H']

        # Criar colunas separadas para os grupos

        if parente == 'Q001':
            nome = 'Pai_'
        
        if parente == 'Q002':
            nome = 'Mae_'
        #df['Q001_A_D'] = df['Q001'].isin(['A', 'B', 'C', 'D']).astype(int) -- não precisa se não tem EM completo ou superior, é abaixo
        aux = nome + 'Ensino_Medio_Completo'
        df[aux] = df[parente].eq('E').astype(int)
        aux = nome + 'Ensino_Superior_Mais'
        df[aux] = df[parente].isin(['F', 'G']).astype(int)        
        
        # Remover a coluna original 'Q001' e 'Q002'
        df = df.drop(parente, axis=1)
        
    return df



def dummy_sexo(df):
    # 'TP_SEXO' - > Sexo_Masculino (0 - feminino, 1 - masculino)
    #variáveis dummy
    dados_dummies = pd.get_dummies(df['TP_SEXO'], drop_first=True)

    # Concatenar as variáveis dummy ao DataFrame original
    df = pd.concat([df, dados_dummies], axis=1)

    #mudanças de nomes
    df.rename(columns={'M': 'Sexo_Masculino'}, inplace=True)
    df['Sexo_Masculino'] = df['Sexo_Masculino'].astype(int)

    #print(df)
    # Remover a variável categórica original se necessário
    df = df.drop('TP_SEXO', axis=1)
    return df


def dummy_raca(df):
    # 'TP_COR_RACA' - > Preta,etc,Indígena (0 em tudo é Branca)

    #remover Não declarado - retirar do dataset
    #        Não dispõe da informação - retirar do dataset

    df = df[(df['TP_COR_RACA'] != 0) & (df['TP_COR_RACA'] != 6)]

    #variáveis dummy
    dados_dummies = pd.get_dummies(df['TP_COR_RACA'], drop_first=True)
    #print(dados_dummies)

    # Concatenar as variáveis dummy ao DataFrame original
    df = pd.concat([df, dados_dummies], axis=1)

    #mudanças de nomes
    df.rename(columns={2: 'Preta'}, inplace=True)
    df['Preta'] = df['Preta'].astype(int)
    df.rename(columns={3: 'Parda'}, inplace=True)
    df['Parda'] = df['Parda'].astype(int)
    df.rename(columns={4: 'Amarela'}, inplace=True)
    df['Amarela'] = df['Amarela'].astype(int)
    df.rename(columns={5: 'Indigena'}, inplace=True)
    df['Indigena'] = df['Indigena'].astype(int)

    # Remover a variável categórica original se necessário
    df = df.drop('TP_COR_RACA', axis=1)
    return df

def summary(df,nome_coluna):
    # Contagem de cada tipo de variável na coluna 'TP_STATUS_REDACAO'
    contagem = df[nome_coluna].value_counts()

    # Calcular a porcentagem
    porcentagem = (contagem / len(df)) * 100
    print('Contagem: ',contagem)
    print('Porcentagem: ',porcentagem)

    porcentagem_faltando = (df[nome_coluna].isnull().mean()) * 100
    print('Porcentagem nula: ', porcentagem_faltando)

    print(df[nome_coluna].describe())




def imprimir_resumo(df, columns):
    # Create a directory to store the exported plots (if it doesn't exist)
    output_dir = 'Imagens'
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    # Create a text file to save the descriptions
    with open('descriptions.txt', 'w') as description_file:
        for column in columns:
            if column != 'NU_INSCRICAO':
                # Verificar o tipo de variável (numérica ou categórica)
                if df[column].dtype == 'int64' or df[column].dtype == 'float64':
                    # Análise para variáveis numéricas
                    description_file.write(f"Análise da variável '{column}':\n")
                    description_file.write(str(df[column].describe()))  # Medidas de tendência central e dispersão
                    description_file.write('\n\n')
                    df[column].plot(kind='hist', bins=10, title=f'Distribuição de Frequências - {column}')
                    plt.xlabel(column)
                    plt.savefig(os.path.join(output_dir, f'hist_{column}.png'))  # Save the plot
                    plt.close()  # Close the current plot
                    df.boxplot(column=column, vert=False)
                    plt.title(f'Box Plot - {column}')
                    plt.savefig(os.path.join(output_dir, f'boxplot_{column}.png'))  # Save the plot
                    plt.close()  # Close the current plot
                elif df[column].dtype == 'object':
                    # Análise para variáveis categóricas
                    description_file.write(f"Análise da variável '{column}':\n")
                    description_file.write(str(df[column].value_counts()))  # Tabela de distribuição de frequências
                    description_file.write('\n\n')
                    df[column].value_counts().plot(kind='bar', title=f'Distribuição de Frequências - {column}')
                    plt.xlabel(column)
                    plt.savefig(os.path.join(output_dir, f'bar_{column}.png'))  # Save the plot
                    plt.close()  # Close the current plot
                else:
                    print(f"A variável '{column}' não é numérica nem categórica e não pode ser analisada automaticamente.")


