-- Processamento Manual --
%Limpando a Command Window
clc

%Limpando o Workspace
clear

%Estabelecendo a conexão%
conexao = database("WIN10PROSQL2019",'','');

%Definindo as Tabelas que serão consultadas%
TabelaTesting = "AnaliseQueimadasSelecionadasTesting";
TabelaChecking = "AnaliseQueimadasSelecionadasTraining";
TabelaCheckingGroup1 = "AnaliseQueimadasSelecionadasTrainingGroup1";
TabelaCheckingGroup2 = "AnaliseQueimadasSelecionadasTrainingGroup2";
TabelaCheckingGroup3 = "AnaliseQueimadasSelecionadasTrainingGroup3";
TabelaCheckingGroup4 = "AnaliseQueimadasSelecionadasTrainingGroup4";
TabelaCheckingGroup5 = "AnaliseQueimadasSelecionadasTrainingGroup5";
TabelaCheckingGroup1234 = "AnaliseQueimadasSelecionadasTrainingGroup1234";
TabelaCheckingGroup1235 = "AnaliseQueimadasSelecionadasTrainingGroup1235";
TabelaCheckingGroup1245 = "AnaliseQueimadasSelecionadasTrainingGroup1245";
TabelaCheckingGroup1345 = "AnaliseQueimadasSelecionadasTrainingGroup1345";
TabelaCheckingGroup2345 = "AnaliseQueimadasSelecionadasTrainingGroup2345";

%Armazenando os dados de cada tabela como tabela em memória na MatLab%
DadosTabelaTesting = sqlread(conexao,TabelaTesting);
DadosTabelaChecking = sqlread(conexao,TabelaChecking);
DadosTabelaCheckingGroup1 = sqlread(conexao,TabelaCheckingGroup1);
DadosTabelaCheckingGroup2 = sqlread(conexao,TabelaCheckingGroup2);
DadosTabelaCheckingGroup3 = sqlread(conexao,TabelaCheckingGroup3);
DadosTabelaCheckingGroup4 = sqlread(conexao,TabelaCheckingGroup4);
DadosTabelaCheckingGroup5 = sqlread(conexao,TabelaCheckingGroup5);
DadosTabelaCheckingGroup1234 = sqlread(conexao,TabelaCheckingGroup1234);
DadosTabelaCheckingGroup1235 = sqlread(conexao,TabelaCheckingGroup1235);
DadosTabelaCheckingGroup1245 = sqlread(conexao,TabelaCheckingGroup1245);
DadosTabelaCheckingGroup1345 = sqlread(conexao,TabelaCheckingGroup1345);
DadosTabelaCheckingGroup2345 = sqlread(conexao,TabelaCheckingGroup2345);

%Removendo as colunas%
DadosTabelaTesting = removevars(DadosTabelaTesting, 'CodigoAnaliseQueimadasSelecionadasTesting');
DadosTabelaTesting = removevars(DadosTabelaTesting, 'DataAnaliseQueimadasSelecionadasTesting');
DadosTabelaTesting = removevars(DadosTabelaTesting, 'DataRiscoFogoObservadoTresDiasPraFrenteTesting');

DadosTabelaChecking = removevars(DadosTabelaChecking, 'CodigoAnaliseQueimadasSelecionadasTraining');
DadosTabelaChecking = removevars(DadosTabelaChecking, 'DataAnaliseQueimadasSelecionadasTraining');
DadosTabelaChecking = removevars(DadosTabelaChecking, 'DataRiscoFogoObservadoTresDiasPraFrenteTraining');

DadosTabelaCheckingGroup1 = removevars(DadosTabelaCheckingGroup1, 'CodigoAnaliseQueimadasSelecionadasTrainingGroup1');
DadosTabelaCheckingGroup1 = removevars(DadosTabelaCheckingGroup1, 'DataAnaliseQueimadasSelecionadasTrainingGroup1');
DadosTabelaCheckingGroup1 = removevars(DadosTabelaCheckingGroup1, 'DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup1');

DadosTabelaCheckingGroup2 = removevars(DadosTabelaCheckingGroup2, 'CodigoAnaliseQueimadasSelecionadasTrainingGroup2');
DadosTabelaCheckingGroup2 = removevars(DadosTabelaCheckingGroup2, 'DataAnaliseQueimadasSelecionadasTrainingGroup2');
DadosTabelaCheckingGroup2 = removevars(DadosTabelaCheckingGroup2, 'DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup2');

DadosTabelaCheckingGroup3 = removevars(DadosTabelaCheckingGroup3, 'CodigoAnaliseQueimadasSelecionadasTrainingGroup3');
DadosTabelaCheckingGroup3 = removevars(DadosTabelaCheckingGroup3, 'DataAnaliseQueimadasSelecionadasTrainingGroup3');
DadosTabelaCheckingGroup3 = removevars(DadosTabelaCheckingGroup3, 'DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup3');

DadosTabelaCheckingGroup4 = removevars(DadosTabelaCheckingGroup4, 'CodigoAnaliseQueimadasSelecionadasTrainingGroup4');
DadosTabelaCheckingGroup4 = removevars(DadosTabelaCheckingGroup4, 'DataAnaliseQueimadasSelecionadasTrainingGroup4');
DadosTabelaCheckingGroup4 = removevars(DadosTabelaCheckingGroup4, 'DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup4');

DadosTabelaCheckingGroup5 = removevars(DadosTabelaCheckingGroup5, 'CodigoAnaliseQueimadasSelecionadasTrainingGroup5');
DadosTabelaCheckingGroup5 = removevars(DadosTabelaCheckingGroup5, 'DataAnaliseQueimadasSelecionadasTrainingGroup5');
DadosTabelaCheckingGroup5 = removevars(DadosTabelaCheckingGroup5, 'DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup5');

DadosTabelaCheckingGroup1234 = removevars(DadosTabelaCheckingGroup1234, 'CodigoAnaliseQueimadasSelecionadasTrainingGroup1234');
DadosTabelaCheckingGroup1234 = removevars(DadosTabelaCheckingGroup1234, 'DataAnaliseQueimadasSelecionadasTrainingGroup1234');
DadosTabelaCheckingGroup1234 = removevars(DadosTabelaCheckingGroup1234, 'DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup1234');

DadosTabelaCheckingGroup1235 = removevars(DadosTabelaCheckingGroup1235, 'CodigoAnaliseQueimadasSelecionadasTrainingGroup1235');
DadosTabelaCheckingGroup1235 = removevars(DadosTabelaCheckingGroup1235, 'DataAnaliseQueimadasSelecionadasTrainingGroup1235');
DadosTabelaCheckingGroup1235 = removevars(DadosTabelaCheckingGroup1235, 'DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup1235');

DadosTabelaCheckingGroup1245 = removevars(DadosTabelaCheckingGroup1245, 'CodigoAnaliseQueimadasSelecionadasTrainingGroup1245');
DadosTabelaCheckingGroup1245 = removevars(DadosTabelaCheckingGroup1245, 'DataAnaliseQueimadasSelecionadasTrainingGroup1245');
DadosTabelaCheckingGroup1245 = removevars(DadosTabelaCheckingGroup1245, 'DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup1245');

DadosTabelaCheckingGroup1345 = removevars(DadosTabelaCheckingGroup1345, 'CodigoAnaliseQueimadasSelecionadasTrainingGroup1345');
DadosTabelaCheckingGroup1345 = removevars(DadosTabelaCheckingGroup1345, 'DataAnaliseQueimadasSelecionadasTrainingGroup1345');
DadosTabelaCheckingGroup1345 = removevars(DadosTabelaCheckingGroup1345, 'DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup1345');

DadosTabelaCheckingGroup2345 = removevars(DadosTabelaCheckingGroup2345, 'CodigoAnaliseQueimadasSelecionadasTrainingGroup2345');
DadosTabelaCheckingGroup2345 = removevars(DadosTabelaCheckingGroup2345, 'DataAnaliseQueimadasSelecionadasTrainingGroup2345');
DadosTabelaCheckingGroup2345 = removevars(DadosTabelaCheckingGroup2345, 'DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup2345');

%Transformando as Tabelas em variáveis locais para uso posterior com o AnfisEdit%
Testing = table2array(DadosTabelaTesting(:,:));
Training = table2array(DadosTabelaChecking(:,:));
CheckingGroup1 = table2array(DadosTabelaCheckingGroup1(:,:));
CheckingGroup2 = table2array(DadosTabelaCheckingGroup2(:,:));
CheckingGroup3 = table2array(DadosTabelaCheckingGroup3(:,:));
CheckingGroup4 = table2array(DadosTabelaCheckingGroup4(:,:));
CheckingGroup5 = table2array(DadosTabelaCheckingGroup5(:,:));
TrainingGroup1234 = table2array(DadosTabelaCheckingGroup1234(:,:));
TrainingGroup1235 = table2array(DadosTabelaCheckingGroup1235(:,:));
TrainingGroup1245 = table2array(DadosTabelaCheckingGroup1245(:,:));
TrainingGroup1345 = table2array(DadosTabelaCheckingGroup1345(:,:));
TrainingGroup2345 = table2array(DadosTabelaCheckingGroup2345(:,:));

%Removendo as tabelas e dados armazenados em tabelas alocadas na memória%
clear TabelaTesting;
clear TabelaChecking;
clear TabelaCheckingGroup1;
clear TabelaCheckingGroup2;
clear TabelaCheckingGroup3;
clear TabelaCheckingGroup4;
clear TabelaCheckingGroup5;
clear TabelaCheckingGroup1234;
clear TabelaCheckingGroup1235;
clear TabelaCheckingGroup1245;
clear TabelaCheckingGroup1345;
clear TabelaCheckingGroup2345;

clear DadosTabelaTesting;
clear DadosTabelaChecking;
clear DadosTabelaCheckingGroup1;
clear DadosTabelaCheckingGroup2;
clear DadosTabelaCheckingGroup3;
clear DadosTabelaCheckingGroup4;
clear DadosTabelaCheckingGroup5;
clear DadosTabelaCheckingGroup1234;
clear DadosTabelaCheckingGroup1235;
clear DadosTabelaCheckingGroup1245;
clear DadosTabelaCheckingGroup1345;
clear DadosTabelaCheckingGroup2345;

%Removendo a variável de conexão%
clear conexao;

%Carregando o AnsfiEdit%
anfisedit;

-- Processamento automático --
%Limpando a Command Window
clc;

%Limpando o Workspace
clear;

%Estabelecendo a conexão%
conexao = database("WIN10PROSQL2019",'','');

%Definindo as Tabelas que serão consultadas%
TabelaTesting = "AnaliseQueimadasSelecionadasTesting";
TabelaTraining = "AnaliseQueimadasSelecionadasTraining";
TabelaCheckingGroup1 = "AnaliseQueimadasSelecionadasTrainingGroup1";
TabelaCheckingGroup2 = "AnaliseQueimadasSelecionadasTrainingGroup2";
TabelaCheckingGroup3 = "AnaliseQueimadasSelecionadasTrainingGroup3";
TabelaCheckingGroup4 = "AnaliseQueimadasSelecionadasTrainingGroup4";
TabelaCheckingGroup5 = "AnaliseQueimadasSelecionadasTrainingGroup5";
TabelaCheckingGroup1234 = "AnaliseQueimadasSelecionadasTrainingGroup1234";
TabelaCheckingGroup1235 = "AnaliseQueimadasSelecionadasTrainingGroup1235";
TabelaCheckingGroup1245 = "AnaliseQueimadasSelecionadasTrainingGroup1245";
TabelaCheckingGroup1345 = "AnaliseQueimadasSelecionadasTrainingGroup1345";
TabelaCheckingGroup2345 = "AnaliseQueimadasSelecionadasTrainingGroup2345";

%Armazenando os dados de cada tabela como tabela em memória na MatLab%
DadosTabelaTesting = sqlread(conexao,TabelaTesting);
DadosTabelaTraining = sqlread(conexao,TabelaTraining);
DadosTabelaCheckingGroup1 = sqlread(conexao,TabelaCheckingGroup1);
DadosTabelaCheckingGroup2 = sqlread(conexao,TabelaCheckingGroup2);
DadosTabelaCheckingGroup3 = sqlread(conexao,TabelaCheckingGroup3);
DadosTabelaCheckingGroup4 = sqlread(conexao,TabelaCheckingGroup4);
DadosTabelaCheckingGroup5 = sqlread(conexao,TabelaCheckingGroup5);
DadosTabelaCheckingGroup1234 = sqlread(conexao,TabelaCheckingGroup1234);
DadosTabelaCheckingGroup1235 = sqlread(conexao,TabelaCheckingGroup1235);
DadosTabelaCheckingGroup1245 = sqlread(conexao,TabelaCheckingGroup1245);
DadosTabelaCheckingGroup1345 = sqlread(conexao,TabelaCheckingGroup1345);
DadosTabelaCheckingGroup2345 = sqlread(conexao,TabelaCheckingGroup2345);

%Removendo as colunas%
DadosTabelaTesting = removevars(DadosTabelaTesting, 'CodigoAnaliseQueimadasSelecionadasTesting');
DadosTabelaTesting = removevars(DadosTabelaTesting, 'DataAnaliseQueimadasSelecionadasTesting');
DadosTabelaTesting = removevars(DadosTabelaTesting, 'DataRiscoFogoObservadoTresDiasPraFrenteTesting');

DadosTabelaTraining = removevars(DadosTabelaTraining, 'CodigoAnaliseQueimadasSelecionadasTraining');
DadosTabelaTraining = removevars(DadosTabelaTraining, 'DataAnaliseQueimadasSelecionadasTraining');
DadosTabelaTraining = removevars(DadosTabelaTraining, 'DataRiscoFogoObservadoTresDiasPraFrenteTraining');

DadosTabelaCheckingGroup1 = removevars(DadosTabelaCheckingGroup1, 'CodigoAnaliseQueimadasSelecionadasTrainingGroup1');
DadosTabelaCheckingGroup1 = removevars(DadosTabelaCheckingGroup1, 'DataAnaliseQueimadasSelecionadasTrainingGroup1');
DadosTabelaCheckingGroup1 = removevars(DadosTabelaCheckingGroup1, 'DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup1');

DadosTabelaCheckingGroup2 = removevars(DadosTabelaCheckingGroup2, 'CodigoAnaliseQueimadasSelecionadasTrainingGroup2');
DadosTabelaCheckingGroup2 = removevars(DadosTabelaCheckingGroup2, 'DataAnaliseQueimadasSelecionadasTrainingGroup2');
DadosTabelaCheckingGroup2 = removevars(DadosTabelaCheckingGroup2, 'DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup2');

DadosTabelaCheckingGroup3 = removevars(DadosTabelaCheckingGroup3, 'CodigoAnaliseQueimadasSelecionadasTrainingGroup3');
DadosTabelaCheckingGroup3 = removevars(DadosTabelaCheckingGroup3, 'DataAnaliseQueimadasSelecionadasTrainingGroup3');
DadosTabelaCheckingGroup3 = removevars(DadosTabelaCheckingGroup3, 'DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup3');

DadosTabelaCheckingGroup4 = removevars(DadosTabelaCheckingGroup4, 'CodigoAnaliseQueimadasSelecionadasTrainingGroup4');
DadosTabelaCheckingGroup4 = removevars(DadosTabelaCheckingGroup4, 'DataAnaliseQueimadasSelecionadasTrainingGroup4');
DadosTabelaCheckingGroup4 = removevars(DadosTabelaCheckingGroup4, 'DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup4');

DadosTabelaCheckingGroup5 = removevars(DadosTabelaCheckingGroup5, 'CodigoAnaliseQueimadasSelecionadasTrainingGroup5');
DadosTabelaCheckingGroup5 = removevars(DadosTabelaCheckingGroup5, 'DataAnaliseQueimadasSelecionadasTrainingGroup5');
DadosTabelaCheckingGroup5 = removevars(DadosTabelaCheckingGroup5, 'DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup5');

DadosTabelaCheckingGroup1234 = removevars(DadosTabelaCheckingGroup1234, 'CodigoAnaliseQueimadasSelecionadasTrainingGroup1234');
DadosTabelaCheckingGroup1234 = removevars(DadosTabelaCheckingGroup1234, 'DataAnaliseQueimadasSelecionadasTrainingGroup1234');
DadosTabelaCheckingGroup1234 = removevars(DadosTabelaCheckingGroup1234, 'DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup1234');

DadosTabelaCheckingGroup1235 = removevars(DadosTabelaCheckingGroup1235, 'CodigoAnaliseQueimadasSelecionadasTrainingGroup1235');
DadosTabelaCheckingGroup1235 = removevars(DadosTabelaCheckingGroup1235, 'DataAnaliseQueimadasSelecionadasTrainingGroup1235');
DadosTabelaCheckingGroup1235 = removevars(DadosTabelaCheckingGroup1235, 'DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup1235');

DadosTabelaCheckingGroup1245 = removevars(DadosTabelaCheckingGroup1245, 'CodigoAnaliseQueimadasSelecionadasTrainingGroup1245');
DadosTabelaCheckingGroup1245 = removevars(DadosTabelaCheckingGroup1245, 'DataAnaliseQueimadasSelecionadasTrainingGroup1245');
DadosTabelaCheckingGroup1245 = removevars(DadosTabelaCheckingGroup1245, 'DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup1245');

DadosTabelaCheckingGroup1345 = removevars(DadosTabelaCheckingGroup1345, 'CodigoAnaliseQueimadasSelecionadasTrainingGroup1345');
DadosTabelaCheckingGroup1345 = removevars(DadosTabelaCheckingGroup1345, 'DataAnaliseQueimadasSelecionadasTrainingGroup1345');
DadosTabelaCheckingGroup1345 = removevars(DadosTabelaCheckingGroup1345, 'DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup1345');

DadosTabelaCheckingGroup2345 = removevars(DadosTabelaCheckingGroup2345, 'CodigoAnaliseQueimadasSelecionadasTrainingGroup2345');
DadosTabelaCheckingGroup2345 = removevars(DadosTabelaCheckingGroup2345, 'DataAnaliseQueimadasSelecionadasTrainingGroup2345');
DadosTabelaCheckingGroup2345 = removevars(DadosTabelaCheckingGroup2345, 'DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup2345');

%Transformando as Tabelas em variáveis locais para uso posterior com o AnfisEdit%
Testing = table2array(DadosTabelaTesting(:,:));
Training = table2array(DadosTabelaTraining(:,:));
CheckingGroup1 = table2array(DadosTabelaCheckingGroup1(:,:));
CheckingGroup2 = table2array(DadosTabelaCheckingGroup2(:,:));
CheckingGroup3 = table2array(DadosTabelaCheckingGroup3(:,:));
CheckingGroup4 = table2array(DadosTabelaCheckingGroup4(:,:));
CheckingGroup5 = table2array(DadosTabelaCheckingGroup5(:,:));
TrainingGroup1234 = table2array(DadosTabelaCheckingGroup1234(:,:));
TrainingGroup1235 = table2array(DadosTabelaCheckingGroup1235(:,:));
TrainingGroup1245 = table2array(DadosTabelaCheckingGroup1245(:,:));
TrainingGroup1345 = table2array(DadosTabelaCheckingGroup1345(:,:));
TrainingGroup2345 = table2array(DadosTabelaCheckingGroup2345(:,:));

%Removendo as tabelas e dados armazenados em tabelas alocadas na memória%
clear TabelaTesting;
clear TabelaTraining;
clear TabelaCheckingGroup1;
clear TabelaCheckingGroup2;
clear TabelaCheckingGroup3;
clear TabelaCheckingGroup4;
clear TabelaCheckingGroup5;
clear TabelaCheckingGroup1234;
clear TabelaCheckingGroup1235;
clear TabelaCheckingGroup1245;
clear TabelaCheckingGroup1345;
clear TabelaCheckingGroup2345;

clear DadosTabelaTesting;
clear DadosTabelaTraining;
clear DadosTabelaCheckingGroup1;
clear DadosTabelaCheckingGroup2;
clear DadosTabelaCheckingGroup3;
clear DadosTabelaCheckingGroup4;
clear DadosTabelaCheckingGroup5;
clear DadosTabelaCheckingGroup1234;
clear DadosTabelaCheckingGroup1235;
clear DadosTabelaCheckingGroup1245;
clear DadosTabelaCheckingGroup1345;
clear DadosTabelaCheckingGroup2345;

%Removendo a variável de conexão%
clear conexao;

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