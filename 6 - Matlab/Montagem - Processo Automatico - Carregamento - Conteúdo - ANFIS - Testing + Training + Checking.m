%Limpando a Command Window
clc;

%Limpando o Workspace
clear;

% Import the file Testing
Testing = importdata('P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo6-Conteudo-ANFIS-ValidacaoCruzada-Testing.txt');

% Import the file CheckinGroup
CheckingGroup1 = importdata('P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo6-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup1.txt');
CheckingGroup2 = importdata('P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo6-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup2.txt');
CheckingGroup3 = importdata('P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo6-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup3.txt');
CheckingGroup4 = importdata('P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo6-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup4.txt');
CheckingGroup5 = importdata('P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo6-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup5.txt');

% Import the file TrainingGroup
TrainingGroup2345 = importdata('P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo6-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup2345.txt');
TrainingGroup1345 = importdata('P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo6-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup1345.txt');
TrainingGroup1245 = importdata('P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo6-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup1245.txt');
TrainingGroup1235 = importdata('P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo6-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup1235.txt');
TrainingGroup1234 = importdata('P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo6-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup1234.txt');

%Definindo as variávies para utilização na geração do ANFIS%
InputData = TrainingGroup1234(:,:);
OutPutData = TrainingGroup1234(:,3);

%Definindo as opções e configurações para geração do FIS%
genOpt = genfisOptions('SubtractiveClustering');
genOpt.ClusterInfluenceRange = 0.5;
genOpt.DataScale = 'auto';
genOpt.SquashFactor = 1.25;
genOpt.AcceptRatio = 0.5;
genOpt.RejectRatio =0.15;
genOpt.Verbose = true;

%Gerando o ANFIS%
GenANFIS = genfis(InputData,OutPutData,genOpt);

%Definindo as configurações para processamento do ANFIS%
genOpt = anfisOptions('InitialFIS',4,'EpochNumber',40);
genOpt.DisplayANFISInformation = 1;
genOpt.DisplayErrorValues = 1;
genOpt.DisplayStepSize = 1;
genOpt.DisplayFinalResults = 1;
genOpt.ValidationData = CheckingGroup5;

%Processando o ANFIS%
[fis,trainError,stepSize,chkFIS,chkError] = anfis(InputData,genOpt);

%Armazenando a avaliação do processamento do ANFIS%
OutPutANFIS = evalfis(GenANFIS,InputData);

%Armazenando a quantidade de passos 
LinhasEixoX = length(stepSize);

%Gráfico de Resultado ANFIS%
nexttile;
plot(InputData(:,1),OutPutData(),'*r',InputData(),OutPutANFIS,'.b');

%Gerando a Legenda%
legend('Training Data','ANFIS Output','Location','NorthWest');

%Adicionando Título a Legenda%
title('Processamento ANFIS');

%Gráfico Training Error%
nexttile;
plot((1:LinhasEixoX),trainError,'*r',(1:LinhasEixoX),trainError,'-b');
legend('Training Error','Steps','Location','NorthEast');
title('Dados de Treinamento');

%Gráfico Checking Error%
nexttile;
plot((1:LinhasEixoX),chkError,'*r',(1:LinhasEixoX),chkError,'-b');
legend('Checking Error','Steps','Location','NorthEast');
title('Daddos de Checagem');