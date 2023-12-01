import pandas as pd
from functions import *


dataset = 'MICRODADOS_ENEM_2022.csv'
colunas = ['NU_INSCRICAO','TP_SEXO','TP_COR_RACA',
            'TP_LOCALIZACAO_ESC', 'TP_STATUS_REDACAO',
            'Q001', 'Q002','Q006','Q025','Q007','NU_NOTA_REDACAO', 'NU_NOTA_MT']

df = pd.read_csv(dataset, sep=';', encoding='ISO-8859-1',usecols=colunas)

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



#print(df)

