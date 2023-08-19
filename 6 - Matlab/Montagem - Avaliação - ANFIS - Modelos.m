%Limpando a Command Window
clc

%Limpando o Workspace
clear

%Importando o arquivo CheckinGroup
Testing= importdata('P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo3-Conteudo-ANFIS-ValidacaoCruzada-Testing.txt');

%Definindo a leitura das vari�veis de entrada
FISInputData = Testing (:,1:2);

%Realizando a leitura do FIS
FISRead = readfis('P:\Projeto - ICRQB\4 - Dados\Modelos\FIS\Modelo3-Conteudo-ANFIS-FIS-Sugeno.fis');

%Realizando a avalia��o do FIS
FISOutput = evalfis(FISInputData,FISRead);

%Escrevendo o resultado de sa�da para um arquivo em Excel
xlswrite('P:\Projeto - ICRQB\4 - Dados\Modelos\FIS\Modelo3-Conteudo-ANFIS-EvalFIS-Saida.xls',FISOutput);
