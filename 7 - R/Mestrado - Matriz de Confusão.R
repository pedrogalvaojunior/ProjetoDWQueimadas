#Definindo a limpeza das variáveis e memória
rm(list=ls())

#Carregando as Bibliotecas (Librarys)
library("caret")

#Declarando as variáveis padrões
PathDados <-"S:\\Mestrado\\Projeto\\6 - Defesa\\8 - R\\"

#Setando Path Padrão tornando o caminho para acesso
setwd(PathDados)

#Classes
classes=c("Mínimo","Baixo","Médio","Alto","Crítico")

#Carregando o Arquivo
dadoscalculados <- read.csv("dadoscalculados.csv")

#Definindo a variável como um dataframe
framedadoscalculados <-data.frame(dadoscalculados)

#Definindo a estrutura da Matriz de Confusão
Observacoes <- framedadoscalculados$ClassificacaoRiscoFogoReal
Predicao <- framedadoscalculados$ClassificacaoRiscoFogoCalculado

#Realizando a união dos dados Observacoes X Predicao
confusao <- union(Observacoes, Predicao)

#Montando a tabela com base nos fatores de acordo com a classificação
tabela <-table(factor(Observacoes,levels=classes), 
               factor(Predicao,levels=classes))

#Gerando a Matriz de Confusão
confusionMatrix(tabela)

