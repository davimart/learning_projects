import pandas as pd
from functions import *


dataset = 'MICRODADOS_ENEM_2022.csv'
colunas = ['NU_INSCRICAO','TP_SEXO','TP_COR_RACA',
            'TP_LOCALIZACAO_ESC', 'TP_STATUS_REDACAO',
            'Q001', 'Q002','Q006','Q025','NU_NOTA_REDACAO', 'TP_PRESENCA_LC']

df = pd.read_csv(dataset, sep=';', encoding='ISO-8859-1',usecols=colunas)
#imprimir_resumo(df, colunas)
for coluna in colunas:
    summary(df,coluna)

# ------------ DUMMIES --------------

# 'TP_SEXO' - > Sexo_Masculino (0 - feminino, 1 - masculino)
df = dummy_sexo(df)

# 'TP_COR_RACA' - > Preta,etc,Indígena (0 em tudo é Branca)
df = dummy_raca(df)

# ESCOLARIDADE DOS PAIS - Menos que médio, médio, mais que médio e sem 'Não sei'

df = dummy_escolaridade_parente(df)

#RENDA FAMILIAR - menos 1200, entre 1200 e 3000, mais do que 3000
df = dummy_renda_familiar(df)


#'Q025' Na sua residência tem acesso à Internet?
df = dummy_acesso_internet(df)

#Varíavel dependente/target
#Bottom 10% + valores nulos - 1 e resto - 0

# Escolha a coluna 'NU_NOTA_REDACAO'
coluna_notas_redacao = 'NU_NOTA_REDACAO'

# Passo 1: Calcule o 10º percentil
percentil_10 = df[coluna_notas_redacao].quantile(0.1)
print('PERCENTIL 10% DE NOTAS DA REDACAÇÃO: ', percentil_10)

# Passo 2: Crie a nova coluna com base nas condições
# Nota nula + 10 percentil
df['Performance_Redacao'] = 0  # Inicializa com 0
df.loc[(df[coluna_notas_redacao].isnull()) | (df[coluna_notas_redacao] <= percentil_10), 'Performance_Redacao'] = 1

#10percentil
df['10Percentil_Redacao'] = 0  # Inicializa com 0
df.loc[(df[coluna_notas_redacao] <= percentil_10), '10Percentil_Redacao'] = 1

#nota nula
df['Redacao_Nula'] = 0  # Inicializa com 0
df.loc[(df[coluna_notas_redacao].isnull()), 'Redacao_Nula'] = 1

#falta ou eliminado
df['Redacao_Falta'] = 0  # Inicializa com 0
df.loc[(df['TP_PRESENCA_LC'] == 0) | (df['TP_PRESENCA_LC'] == 2), 'Redacao_Falta'] = 1

#redacao com problema
df['Problema_Redacao'] = 0  # Inicializa com 0
df.loc[(df['TP_STATUS_REDACAO'] != 1) & (~df['TP_STATUS_REDACAO'].isnull()), 'Problema_Redacao'] = 1


# Exibir o DataFrame resultante
print(df[['NU_NOTA_REDACAO', 'Performance_Redacao']])

print(df)

df.to_csv('MICRODADOS_ENEM_2022_FILTRADOS.csv', index=False, sep=';')
colunas = df.columns.tolist()
#imprimir_resumo(df, colunas)

