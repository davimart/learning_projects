import pandas as pd
from functions import *


dataset = 'MICRODADOS_ENEM_2022.csv'
colunas = ['NU_INSCRICAO','TP_SEXO','TP_COR_RACA',
            'TP_LOCALIZACAO_ESC', 'TP_STATUS_REDACAO',
            'Q001', 'Q002','Q006','Q025','NU_NOTA_REDACAO', 
            'TP_PRESENCA_LC' ,'TP_DEPENDENCIA_ADM_ESC', 'CO_MUNICIPIO_ESC', 'TP_ESCOLA']

df = pd.read_csv(dataset, sep=';', encoding='ISO-8859-1',usecols=colunas)
#imprimir_resumo(df, colunas)
#for coluna in colunas:
#    summary(df,coluna)

summary(df,'TP_DEPENDENCIA_ADM_ESC')
summary(df,'TP_ESCOLA')




