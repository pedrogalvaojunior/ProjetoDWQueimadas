%Limpando a Command Window
clc

%Limpando o Workspace
clear

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

%Carregando do AnfisEdit
anfisedit