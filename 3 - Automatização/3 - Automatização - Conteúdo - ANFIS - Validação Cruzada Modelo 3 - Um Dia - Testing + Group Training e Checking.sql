-- Criando a Stored Procedure P_ValidacaoCruzadaModelo3UmDia --
Create Or Alter Procedure P_ValidacaoCruzadaModelo3UmDia
As
Begin

Set NoCount On

-- Realizando a Análise e Inserindo na Tabela AnaliseQueimadasSelecionadas --
-- Indicador 1 - Registro de Queimadas(INPE) para o Município de Sorocaba entre os anos de 2018 e 2020 --
Insert Into AnaliseQueimadasSelecionadas (DataAnaliseQueimadasSelecionadas, DiaSemChuva, PrecipitacaoUmDiaAnterior, DataRiscoFogoObservadoUmDiaPraFrente, RiscoFogoObservadoUmDiaPraFrente)
Select Q.DataHora As Data,
           Q.DiaSemChuva, 
           (Select ValorPrecipitacao From VolumePrecipitacao2018x2020 
		    Where DataPrecipitacao = DateAdd(Day,-1,Q.DataHora)) As PrecipitacaoUmDiaAntes,
		   DateAdd(Day,3,Q.DataHora) As DataRiscoFogoObservadoUmDiaPraFrente,
		   IsNull(R.RiscoFogoObservadoUmDiaPraFrente,0) As RiscoFogoObservadoUmDiaPraFrente
From Queimadas2018x2020Sorocaba Q Outer Apply (Select Top 1 IsNull(RiscoFogo,0) From Queimadas2018x2020Sorocaba
                                                                                       Where DataHora = DateAdd(Day,+1,Q.DataHora)) As R(RiscoFogoObservadoUmDiaPraFrente)
Order By Data Asc

-- Indicador 2 - Registro de Precipitação(ANA) para o Município de Sorocaba entre os anos de 2018 e 2020 --
Insert Into AnaliseQueimadasSelecionadas (DataAnaliseQueimadasSelecionadas, DiaSemChuva, PrecipitacaoUmDiaAnterior, DataRiscoFogoObservadoUmDiaPraFrente,RiscoFogoObservadoUmDiaPraFrente)
Select V.DataPrecipitacao As Data,
           (Select Abs(Count(CodigoVolumePrecipitacao)-1) From VolumePrecipitacao2018x2020
            Where DataPrecipitacao >= (Select Convert(Char(10),DateAdd(dd,-(Day(V.DataPrecipitacao)-1),V.DataPrecipitacao),23)
			                                               From VolumePrecipitacao2018x2020
			                                               Where DataPrecipitacao = V.DataPrecipitacao)
			And DataPrecipitacao <=V.DataPrecipitacao 
			And ValorPrecipitacao =0) As DiaSemChuva, 
		   (Select Sum(ValorPrecipitacao) From VolumePrecipitacao2018x2020
            Where DataPrecipitacao = DateAdd(Day,-1,V.DataPrecipitacao)) As PrecipitacaoUmDiaAntes,
		   DateAdd(Day,3,V.DataPrecipitacao) As DataRiscoFogoObservadoUmDiaPraFrente,
		   IsNull(R.RiscoFogoObservadoUmDiaPraFrente,0) As RiscoFogoObservadoUmDiaPraFrente
From VolumePrecipitacao2018x2020 V Outer Apply (Select Top 1 RiscoFogo From Queimadas2018x2020Sorocaba
                                                                                    Where DataHora = DateAdd(Day,+1,V.DataPrecipitacao)) As R(RiscoFogoObservadoUmDiaPraFrente)
Where V.ValorPrecipitacao > 0
Order By Data Asc

-- Indicador 3 - Registro de Precipitação(ANA) e Registro de Queimadas(INPE) para o Município de Sorocaba entre os anos de 2018 e 2020 --
Insert Into AnaliseQueimadasSelecionadas (DataAnaliseQueimadasSelecionadas, DiaSemChuva, PrecipitacaoUmDiaAnterior, DataRiscoFogoObservadoUmDiaPraFrente,RiscoFogoObservadoUmDiaPraFrente)
Select Distinct V.DataPrecipitacao As Data,
           Q.DiaSemChuva,
           (Select ValorPrecipitacao From VolumePrecipitacao2018x2020 
		    Where DataPrecipitacao = DateAdd(Day,-1,V.DataPrecipitacao)) As PrecipitacaoUmDiaAntes,
		   DateAdd(Day,3,V.DataPrecipitacao) As DataRiscoFogoObservadoUmDiaPraFrente,
		   IsNull(R.RiscoFogoObservadoUmDiaPraFrente,0) As RiscoFogoObservadoUmDiaPraFrente
From VolumePrecipitacao2018x2020 V Inner Join Queimadas2018x2020Sorocaba Q
															    On V.DataPrecipitacao = Q.DataHora
															   Outer Apply (Select Top 1 RiscoFogo From Queimadas2018x2020Sorocaba
                                                                                     Where DataHora = DateAdd(Day,+1,V.DataPrecipitacao)) As R(RiscoFogoObservadoUmDiaPraFrente)Where V.ValorPrecipitacao >0
Order By Data Asc

-- Indicador 4 - Sem Registro de Precipitação(ANA) e Sem Registro de Queimadas(INPE) para o Município de Sorocaba entre os anos de 2018 e 2020 --
Insert Into AnaliseQueimadasSelecionadas (DataAnaliseQueimadasSelecionadas, DiaSemChuva, PrecipitacaoUmDiaAnterior, DataRiscoFogoObservadoUmDiaPraFrente,RiscoFogoObservadoUmDiaPraFrente)
Select C.DataDatasSemChuvaOuQueimadas,
           (Select Count(CodigoVolumePrecipitacao)+1 From VolumePrecipitacao2018x2020
            Where DataPrecipitacao >= (Select Convert(Char(10),DateAdd(dd,-(Day(V.DataPrecipitacao)-1),V.DataPrecipitacao),23)
			                                               From VolumePrecipitacao2018x2020
			                                               Where DataPrecipitacao = V.DataPrecipitacao)
			And DataPrecipitacao <=V.DataPrecipitacao 
			And ValorPrecipitacao =0) As DiaSemChuva, 
		   V.ValorPrecipitacao,
		   DateAdd(Day,3,V.DataPrecipitacao) As DataRiscoFogoObservadoUmDiaPraFrente,
		   IsNull(R.RiscoFogoObservadoUmDiaPraFrente,0) As RiscoFogoObservadoUmDiaPraFrente
From DatasSemChuvaOuQueimadas C Inner Join VolumePrecipitacao2018x2020 V
                                                                On V.DataPrecipitacao = DateAdd(Day,-1,C.DataDatasSemChuvaOuQueimadas)
															   Outer Apply (Select Top 1 RiscoFogo From Queimadas2018x2020Sorocaba
                                                                                     Where DataHora = DateAdd(Day,+1,V.DataPrecipitacao)) As R(RiscoFogoObservadoUmDiaPraFrente)
Order By C.DataDatasSemChuvaOuQueimadas

-- Normalizando os Dados --
;With CTENormalizacaoDeDados (Codigo, DiaSemChuva, PrecipitacaoUmDiaAnterior, RiscoFogoObservadoUmDiaPraFrente)
As
(
Select CodigoAnaliseQueimadasSelecionadas, 
           Round(CUME_DIST() Over(Order By DiaSemChuva),2) As DiaSemChuva,
           Round(CUME_DIST() Over(Order By PrecipitacaoUmDiaAnterior),2) As PrecipitacaoUmDiaAnterior,
		   Round(CUME_DIST() Over(Order By RiscoFogoObservadoUmDiaPraFrente),2) As RiscoFogoObservadoUmDiaPraFrente
From AnaliseQueimadasSelecionadas)
Update AnaliseQueimadasSelecionadas
Set DiaSemChuva = C.DiaSemChuva,
      PrecipitacaoUmDiaAnterior = C.PrecipitacaoUmDiaAnterior,
	  RiscoFogoObservadoUmDiaPraFrente = C.RiscoFogoObservadoUmDiaPraFrente
From AnaliseQueimadasSelecionadas A Inner Join CTENormalizacaoDeDados C
																  On A.CodigoAnaliseQueimadasSelecionadas = C.Codigo

-- Selecionando 30% dos registros existentes na Tabela AnaliseQueimadasSelecionadas para serem inseridos na Tabela AnaliseQueimadasSelecionadasTesting --
Insert Into AnaliseQueimadasSelecionadasTesting(CodigoAnaliseQueimadasSelecionadasTesting, DataAnaliseQueimadasSelecionadasTesting,
                                                                                   DiaSemChuvaTesting, PrecipitacaoUmDiaAnteriorTesting,
																				   DataRiscoFogoObservadoUmDiaPraFrenteTesting ,RiscoFogoObservadoUmDiaPraFrenteTesting)
Select Top 30 Percent CodigoAnaliseQueimadasSelecionadas, DataAnaliseQueimadasSelecionadas, DiaSemChuva, PrecipitacaoUmDiaAnterior, 
                                    DataRiscoFogoObservadoUmDiaPraFrente, RiscoFogoObservadoUmDiaPraFrente								
From AnaliseQueimadasSelecionadas
Order By NewId()


-- Armazenando o restantes dos registros existentes na Tabela AnaliseQueimadasSelecionadas para serem inseridos na Tabela AnaliseQueimadasSelecionadasTraining --
Insert Into AnaliseQueimadasSelecionadasTraining(CodigoAnaliseQueimadasSelecionadasTraining, DataAnaliseQueimadasSelecionadasTraining,
                                                                                    DiaSemChuvaTraining, PrecipitacaoUmDiaAnteriorTraining,
																				    DataRiscoFogoObservadoUmDiaPraFrenteTraining, RiscoFogoObservadoUmDiaPraFrenteTraining)
Select  CodigoAnaliseQueimadasSelecionadas, DataAnaliseQueimadasSelecionadas, DiaSemChuva, PrecipitacaoUmDiaAnterior, 
            DataRiscoFogoObservadoUmDiaPraFrente ,RiscoFogoObservadoUmDiaPraFrente
From AnaliseQueimadasSelecionadas
Where CodigoAnaliseQueimadasSelecionadas Not In (Select CodigoAnaliseQueimadasSelecionadasTesting From AnaliseQueimadasSelecionadasTesting)
Order By NewId()

-- Realizando a Separação dos dados para cada Group de Training -- Group1 --
Insert Into AnaliseQueimadasSelecionadasTrainingGroup1(CodigoAnaliseQueimadasSelecionadasTrainingGroup1, DataAnaliseQueimadasSelecionadasTrainingGroup1,
                                                                                               DiaSemChuvaTrainingGroup1, PrecipitacaoUmDiaAnteriorTrainingGroup1, 
																							   DataRiscoFogoObservadoUmDiaPraFrenteTrainingGroup1, 
								                                                               RiscoFogoObservadoUmDiaPraFrenteTrainingGroup1)
Select Top (Select Count(CodigoAnaliseQueimadasSelecionadasTraining)/5 From AnaliseQueimadasSelecionadasTraining) 
                   CodigoAnaliseQueimadasSelecionadasTraining, DataAnaliseQueimadasSelecionadasTraining, DiaSemChuvaTraining, PrecipitacaoUmDiaAnteriorTraining, 
		           DataRiscoFogoObservadoUmDiaPraFrenteTraining, RiscoFogoObservadoUmDiaPraFrenteTraining
From AnaliseQueimadasSelecionadasTraining
Order By NewId()

-- Realizando a Separação dos dados para cada Group de Training -- Group2 --
Insert Into AnaliseQueimadasSelecionadasTrainingGroup2(CodigoAnaliseQueimadasSelecionadasTrainingGroup2, DataAnaliseQueimadasSelecionadasTrainingGroup2,
                                                                                               DiaSemChuvaTrainingGroup2, PrecipitacaoUmDiaAnteriorTrainingGroup2,
																				               DataRiscoFogoObservadoUmDiaPraFrenteTrainingGroup2, 
																							   RiscoFogoObservadoUmDiaPraFrenteTrainingGroup2)
Select Top (Select Count(CodigoAnaliseQueimadasSelecionadasTraining)/5 From AnaliseQueimadasSelecionadasTraining) 
                  CodigoAnaliseQueimadasSelecionadasTraining, DataAnaliseQueimadasSelecionadasTraining, DiaSemChuvaTraining, PrecipitacaoUmDiaAnteriorTraining, 
                  DataRiscoFogoObservadoUmDiaPraFrenteTraining, RiscoFogoObservadoUmDiaPraFrenteTraining
From AnaliseQueimadasSelecionadasTraining
Where CodigoAnaliseQueimadasSelecionadasTraining Not In (Select CodigoAnaliseQueimadasSelecionadasTrainingGroup1 From AnaliseQueimadasSelecionadasTrainingGroup1)
Order By NewId()

-- Realizando a Separação dos dados para cada Group de Training -- Group3 --
Insert Into AnaliseQueimadasSelecionadasTrainingGroup3(CodigoAnaliseQueimadasSelecionadasTrainingGroup3, DataAnaliseQueimadasSelecionadasTrainingGroup3,
                                                                                               DiaSemChuvaTrainingGroup3, PrecipitacaoUmDiaAnteriorTrainingGroup3,
																				               DataRiscoFogoObservadoUmDiaPraFrenteTrainingGroup3, 
																							   RiscoFogoObservadoUmDiaPraFrenteTrainingGroup3)
Select Top (Select Count(CodigoAnaliseQueimadasSelecionadasTraining)/5 From AnaliseQueimadasSelecionadasTraining) 
                  CodigoAnaliseQueimadasSelecionadasTraining, DataAnaliseQueimadasSelecionadasTraining, DiaSemChuvaTraining, PrecipitacaoUmDiaAnteriorTraining, 
                  DataRiscoFogoObservadoUmDiaPraFrenteTraining, RiscoFogoObservadoUmDiaPraFrenteTraining
From AnaliseQueimadasSelecionadasTraining
Where CodigoAnaliseQueimadasSelecionadasTraining Not In (Select CodigoAnaliseQueimadasSelecionadasTrainingGroup1 From AnaliseQueimadasSelecionadasTrainingGroup1)
And  CodigoAnaliseQueimadasSelecionadasTraining Not In (Select CodigoAnaliseQueimadasSelecionadasTrainingGroup2 From AnaliseQueimadasSelecionadasTrainingGroup2)
Order By NewId()

-- Realizando a Separação dos dados para cada Group de Training -- Group4 --
Insert Into AnaliseQueimadasSelecionadasTrainingGroup4(CodigoAnaliseQueimadasSelecionadasTrainingGroup4, DataAnaliseQueimadasSelecionadasTrainingGroup4,
                                                                                                DiaSemChuvaTrainingGroup4, PrecipitacaoUmDiaAnteriorTrainingGroup4,
																				                DataRiscoFogoObservadoUmDiaPraFrenteTrainingGroup4, 
																								RiscoFogoObservadoUmDiaPraFrenteTrainingGroup4)
Select Top (Select Count(CodigoAnaliseQueimadasSelecionadasTraining)/5 From AnaliseQueimadasSelecionadasTraining) 
                   CodigoAnaliseQueimadasSelecionadasTraining, DataAnaliseQueimadasSelecionadasTraining, DiaSemChuvaTraining, PrecipitacaoUmDiaAnteriorTraining, 
                   DataRiscoFogoObservadoUmDiaPraFrenteTraining, RiscoFogoObservadoUmDiaPraFrenteTraining
From AnaliseQueimadasSelecionadasTraining
Where CodigoAnaliseQueimadasSelecionadasTraining Not In (Select CodigoAnaliseQueimadasSelecionadasTrainingGroup1 From AnaliseQueimadasSelecionadasTrainingGroup1)
And  CodigoAnaliseQueimadasSelecionadasTraining Not In (Select CodigoAnaliseQueimadasSelecionadasTrainingGroup2 From AnaliseQueimadasSelecionadasTrainingGroup2)
And  CodigoAnaliseQueimadasSelecionadasTraining Not In (Select CodigoAnaliseQueimadasSelecionadasTrainingGroup3 From AnaliseQueimadasSelecionadasTrainingGroup3)
Order By NewId()

-- Realizando a Separação dos dados para cada Group de Training -- Group5 --
Insert Into AnaliseQueimadasSelecionadasTrainingGroup5(CodigoAnaliseQueimadasSelecionadasTrainingGroup5, DataAnaliseQueimadasSelecionadasTrainingGroup5,
                                                                                               DiaSemChuvaTrainingGroup5, PrecipitacaoUmDiaAnteriorTrainingGroup5,
																				               DataRiscoFogoObservadoUmDiaPraFrenteTrainingGroup5, 
																							   RiscoFogoObservadoUmDiaPraFrenteTrainingGroup5)
Select Top (Select Count(CodigoAnaliseQueimadasSelecionadasTraining)/5 From AnaliseQueimadasSelecionadasTraining) 
                  CodigoAnaliseQueimadasSelecionadasTraining, DataAnaliseQueimadasSelecionadasTraining, DiaSemChuvaTraining, PrecipitacaoUmDiaAnteriorTraining, 
                  DataRiscoFogoObservadoUmDiaPraFrenteTraining, RiscoFogoObservadoUmDiaPraFrenteTraining
From AnaliseQueimadasSelecionadasTraining
Where CodigoAnaliseQueimadasSelecionadasTraining Not In (Select CodigoAnaliseQueimadasSelecionadasTrainingGroup1 From AnaliseQueimadasSelecionadasTrainingGroup1)
And  CodigoAnaliseQueimadasSelecionadasTraining Not In (Select CodigoAnaliseQueimadasSelecionadasTrainingGroup2 From AnaliseQueimadasSelecionadasTrainingGroup2)
And  CodigoAnaliseQueimadasSelecionadasTraining Not In (Select CodigoAnaliseQueimadasSelecionadasTrainingGroup3 From AnaliseQueimadasSelecionadasTrainingGroup3)
And  CodigoAnaliseQueimadasSelecionadasTraining Not In (Select CodigoAnaliseQueimadasSelecionadasTrainingGroup4 From AnaliseQueimadasSelecionadasTrainingGroup4)
Order By NewId()

-- Carregando os dados no arquivo de Testing --
-- AnaliseQueimadasSelecionadasTesting - DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, Chuva, Queimada --
Declare @BCPComando Varchar(500)
Set @BCPComando='bcp "Select DiaSemChuvaTesting, PrecipitacaoUmDiaAnteriorTesting, RiscoFogoObservadoUmDiaPraFrenteTesting From ProjetoDWQueimadas..AnaliseQueimadasSelecionadasTesting" queryout "P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo3-Conteudo-ANFIS-ValidacaoCruzada-Testing.txt" -c -UTF8 -T -SWIN10PRO\WIN10PROSQL2019'
Exec master..xp_cmdshell @BCPComando, No_Output
Print 'Arquivo: Modelo3-Conteudo-ANFIS-ValidacaoCruzada-Testing.txt criado.'

-- Carregando os dados no arquivo de CheckingGroup1 -- Tabela TrainingGroup1 --
-- AnaliseQueimadasSelecionadasTraining - DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, Chuva, Queimada, RiscoFogoObservadoUmDiaPraFrente --
Set @BCPComando='bcp "Select DiaSemChuvaTrainingGroup1, PrecipitacaoUmDiaAnteriorTrainingGroup1, RiscoFogoObservadoUmDiaPraFrenteTrainingGroup1 From ProjetoDWQueimadas..AnaliseQueimadasSelecionadasTrainingGroup1" queryout "P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo3-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup1.txt" -c -UTF8 -T -SWIN10PRO\WIN10PROSQL2019'
Exec master..xp_cmdshell @BCPComando, No_Output
Print 'Arquivo: Modelo3-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup1.txt criado.'

-- Montando e Inserindo o conteúdo para o TrainingGroup2345 -- Checking TrainingGroup1 --
Insert Into AnaliseQueimadasSelecionadasTrainingGroup2345 
Select * From AnaliseQueimadasSelecionadasTrainingGroup2
Union All
Select * From AnaliseQueimadasSelecionadasTrainingGroup3
Union All
Select * From AnaliseQueimadasSelecionadasTrainingGroup4
Union All
Select * From AnaliseQueimadasSelecionadasTrainingGroup5

-- Carregando os dados no arquivo de TrainingGroup2345 --
-- AnaliseQueimadasSelecionadasTraining - DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, Chuva, Queimada, RiscoFogoObservadoUmDiaPraFrente --
Set @BCPComando='bcp "Select DiaSemChuvaTrainingGroup2345, PrecipitacaoUmDiaAnteriorTrainingGroup2345, RiscoFogoObservadoUmDiaPraFrenteTrainingGroup2345 From ProjetoDWQueimadas..AnaliseQueimadasSelecionadasTrainingGroup2345" queryout "P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo3-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup2345.txt" -c -UTF8 -T -SWIN10PRO\WIN10PROSQL2019'
Exec master..xp_cmdshell @BCPComando, No_Output
Print 'Arquivo: Modelo3-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup2345.txt criado.'

-- Carregando os dados no arquivo de CheckingGroup2 -- Tabela TrainingGroup2 --
-- AnaliseQueimadasSelecionadasTraining - DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, Chuva, Queimada, RiscoFogoObservadoUmDiaPraFrente --
Set @BCPComando='bcp "Select DiaSemChuvaTrainingGroup2, PrecipitacaoUmDiaAnteriorTrainingGroup2, RiscoFogoObservadoUmDiaPraFrenteTrainingGroup2 From ProjetoDWQueimadas..AnaliseQueimadasSelecionadasTrainingGroup2" queryout "P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo3-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup2.txt" -c -UTF8 -T -SWIN10PRO\WIN10PROSQL2019'
Exec master..xp_cmdshell @BCPComando, No_Output
Print 'Arquivo: Modelo3-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup2.txt criado.'

-- Montando e Inserindo o conteúdo para o TrainingGroup1345 -- Checking TrainingGroup2 --
Insert Into AnaliseQueimadasSelecionadasTrainingGroup1345
Select * From AnaliseQueimadasSelecionadasTrainingGroup1
Union All
Select * From AnaliseQueimadasSelecionadasTrainingGroup3
Union All
Select * From AnaliseQueimadasSelecionadasTrainingGroup4
Union All
Select * From AnaliseQueimadasSelecionadasTrainingGroup5

-- Carregando os dados no arquivo de TrainingGroup1345 --
-- AnaliseQueimadasSelecionadasTraining - DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, Chuva, Queimada, RiscoFogoObservadoUmDiaPraFrente --
Set @BCPComando='bcp "Select DiaSemChuvaTrainingGroup1345, PrecipitacaoUmDiaAnteriorTrainingGroup1345, RiscoFogoObservadoUmDiaPraFrenteTrainingGroup1345 From ProjetoDWQueimadas..AnaliseQueimadasSelecionadasTrainingGroup1345" queryout "P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo3-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup1345.txt" -c -UTF8 -T -SWIN10PRO\WIN10PROSQL2019'
Exec master..xp_cmdshell @BCPComando, No_Output
Print 'Arquivo: Modelo3-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup1345.txt criado.'

-- Carregando os dados no arquivo de CheckingGroup3 -- Tabela TrainingGroup3 --
-- AnaliseQueimadasSelecionadasTraining - DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, Chuva, Queimada, RiscoFogoObservadoUmDiaPraFrente --
Set @BCPComando='bcp "Select DiaSemChuvaTrainingGroup3, PrecipitacaoUmDiaAnteriorTrainingGroup3, RiscoFogoObservadoUmDiaPraFrenteTrainingGroup3 From ProjetoDWQueimadas..AnaliseQueimadasSelecionadasTrainingGroup3" queryout "P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo3-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup3.txt" -c -UTF8 -T -SWIN10PRO\WIN10PROSQL2019'
Exec master..xp_cmdshell @BCPComando, No_Output
Print 'Arquivo: Modelo3-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup3.txt criado.'

-- Montando e Inserindo o conteúdo para o TrainingGroup1245 -- Checking TrainingGroup3 --
Insert Into AnaliseQueimadasSelecionadasTrainingGroup1245
Select * From AnaliseQueimadasSelecionadasTrainingGroup1
Union All
Select * From AnaliseQueimadasSelecionadasTrainingGroup2
Union All
Select * From AnaliseQueimadasSelecionadasTrainingGroup4
Union All
Select * From AnaliseQueimadasSelecionadasTrainingGroup5

-- Carregando os dados no arquivo de TrainingGroup1245 --
-- AnaliseQueimadasSelecionadasTraining - DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, Chuva, Queimada, RiscoFogoObservadoUmDiaPraFrente --
Set @BCPComando='bcp "Select DiaSemChuvaTrainingGroup1245, PrecipitacaoUmDiaAnteriorTrainingGroup1245, RiscoFogoObservadoUmDiaPraFrenteTrainingGroup1245 From ProjetoDWQueimadas..AnaliseQueimadasSelecionadasTrainingGroup1245" queryout "P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo3-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup1245.txt" -c -UTF8 -T -SWIN10PRO\WIN10PROSQL2019'
Exec master..xp_cmdshell @BCPComando, No_Output
Print 'Arquivo: Modelo3-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup1245.txt criado.'

-- Carregando os dados no arquivo de CheckingGroup4 -- Tabela TrainingGroup4 --
-- AnaliseQueimadasSelecionadasTraining - DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, Chuva, Queimada, RiscoFogoObservadoUmDiaPraFrente --
Set @BCPComando='bcp "Select DiaSemChuvaTrainingGroup4, PrecipitacaoUmDiaAnteriorTrainingGroup4, RiscoFogoObservadoUmDiaPraFrenteTrainingGroup4 From ProjetoDWQueimadas..AnaliseQueimadasSelecionadasTrainingGroup4" queryout "P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo3-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup4.txt" -c -UTF8 -T -SWIN10PRO\WIN10PROSQL2019'
Exec master..xp_cmdshell @BCPComando, No_Output
Print 'Arquivo: Modelo3-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup4.txt criado.'

-- Montando e Inserindo o conteúdo para o TrainingGroup1235 -- Checking TrainingGroup4 --
Insert Into AnaliseQueimadasSelecionadasTrainingGroup1235 
Select * From AnaliseQueimadasSelecionadasTrainingGroup1
Union All
Select * From AnaliseQueimadasSelecionadasTrainingGroup2
Union All
Select * From AnaliseQueimadasSelecionadasTrainingGroup3
Union All
Select *From AnaliseQueimadasSelecionadasTrainingGroup5

-- Carregando os dados no arquivo de TrainingGroup1235 --
-- AnaliseQueimadasSelecionadasTraining - DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, Chuva, Queimada, RiscoFogoObservadoUmDiaPraFrente --
Set @BCPComando='bcp "Select DiaSemChuvaTrainingGroup1235, PrecipitacaoUmDiaAnteriorTrainingGroup1235, RiscoFogoObservadoUmDiaPraFrenteTrainingGroup1235 From ProjetoDWQueimadas..AnaliseQueimadasSelecionadasTrainingGroup1235" queryout "P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo3-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup1235.txt" -c -UTF8 -T -SWIN10PRO\WIN10PROSQL2019'
Exec master..xp_cmdshell @BCPComando, No_Output
Print 'Arquivo: Modelo3-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup1235.txt criado.'

-- Carregando os dados no arquivo de CheckingGroup5 -- Tabela TrainingGroup5 --
-- AnaliseQueimadasSelecionadasTraining - DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, Chuva, Queimada, RiscoFogoObservadoUmDiaPraFrente --
Set @BCPComando='bcp "Select DiaSemChuvaTrainingGroup5, PrecipitacaoUmDiaAnteriorTrainingGroup5, RiscoFogoObservadoUmDiaPraFrenteTrainingGroup5 From ProjetoDWQueimadas..AnaliseQueimadasSelecionadasTrainingGroup5" queryout "P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo3-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup5.txt" -c -UTF8 -T -SWIN10PRO\WIN10PROSQL2019'
Exec master..xp_cmdshell @BCPComando, No_Output
Print 'Arquivo: Modelo3-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup5.txt criado.'

-- Montando e Inserindo o conteúdo para o TrainingGroup1234 -- Checking TrainingGroup5 --
Insert Into AnaliseQueimadasSelecionadasTrainingGroup1234
Select * From AnaliseQueimadasSelecionadasTrainingGroup1
Union All
Select * From AnaliseQueimadasSelecionadasTrainingGroup2
Union All
Select * From AnaliseQueimadasSelecionadasTrainingGroup3
Union All
Select * From AnaliseQueimadasSelecionadasTrainingGroup4

-- Carregando os dados no arquivo de TrainingGroup1234 --
-- AnaliseQueimadasSelecionadasTraining - DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, Chuva, Queimada, RiscoFogoObservadoUmDiaPraFrente --
Set @BCPComando='bcp "Select DiaSemChuvaTrainingGroup1234, PrecipitacaoUmDiaAnteriorTrainingGroup1234, RiscoFogoObservadoUmDiaPraFrenteTrainingGroup1234 From ProjetoDWQueimadas..AnaliseQueimadasSelecionadasTrainingGroup1234" queryout "P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo3-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup1234.txt" -c -UTF8 -T -SWIN10PRO\WIN10PROSQL2019'
Exec master..xp_cmdshell @BCPComando, No_Output
Print 'Arquivo: Modelo3-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup1234.txt criado.'
End
Go