-- Criando a Stored Procedure P_ValidacaoCruzadaModelo5TresDias --
Create Or Alter Procedure P_ValidacaoCruzadaModelo5TresDias
As
Begin

Set NoCount On

-- Realizando a Análise e Inserindo na Tabela AnaliseQueimadasSelecionadas --
-- Indicador 1 - Registro de Queimadas(INPE) para o Município de Sorocaba entre os anos de 2018 e 2020 --
Insert Into AnaliseQueimadasSelecionadas (DataAnaliseQueimadasSelecionadas, DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, DataRiscoFogoObservadoTresDiasPraFrente, RiscoFogoObservadoTresDiasPraFrente)
Select Q.DataHora As Data,
           Q.DiaSemChuva, 
           (Select ValorPrecipitacao From VolumePrecipitacao2018x2020 
		    Where DataPrecipitacao = DateAdd(Day,-1,Q.DataHora)) As PrecipitacaoUmDiaAntes,
           (Select Sum(ValorPrecipitacao) From VolumePrecipitacao2018x2020 V
            Where V.DataPrecipitacao  >= DateAdd(Day,-3,Q.DataHora)
			And V.DataPrecipitacao <= DateAdd(Day,-1,Q.DataHora)) As PrecipitacaoAcumulada3DiasAnteriores,
		   DateAdd(Day,3,Q.DataHora) As DataRiscoFogoObservadoTresDiasPraFrente,
		   IsNull(R.RiscoFogoObservadoTresDiasPraFrente,0) As RiscoFogoObservadoTresDiasPraFrente
From Queimadas2018x2020Sorocaba Q Outer Apply (Select Top 1 IsNull(RiscoFogo,0) From Queimadas2018x2020Sorocaba
                                                                                       Where DataHora = DateAdd(Day,+3,Q.DataHora)) As R(RiscoFogoObservadoTresDiasPraFrente)
Order By Data Asc

-- Indicador 2 - Registro de Precipitação(ANA) para o Município de Sorocaba entre os anos de 2018 e 2020 --
Insert Into AnaliseQueimadasSelecionadas (DataAnaliseQueimadasSelecionadas, DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, DataRiscoFogoObservadoTresDiasPraFrente,RiscoFogoObservadoTresDiasPraFrente)
Select V.DataPrecipitacao As Data,
           (Select Abs(Count(CodigoVolumePrecipitacao)-1) From VolumePrecipitacao2018x2020
            Where DataPrecipitacao >= (Select Convert(Char(10),DateAdd(dd,-(Day(V.DataPrecipitacao)-1),V.DataPrecipitacao),23)
			                                               From VolumePrecipitacao2018x2020
			                                               Where DataPrecipitacao = V.DataPrecipitacao)
			And DataPrecipitacao <=V.DataPrecipitacao 
			And ValorPrecipitacao =0) As DiaSemChuva, 
		   (Select Sum(ValorPrecipitacao) From VolumePrecipitacao2018x2020
            Where DataPrecipitacao = DateAdd(Day,-1,V.DataPrecipitacao)) As PrecipitacaoUmDiaAntes,
		   (Select Sum(ValorPrecipitacao) From VolumePrecipitacao2018x2020
            Where DataPrecipitacao >= DateAdd(Day,-3,V.DataPrecipitacao)
			And DataPrecipitacao <= DateAdd(Day,-1,V.DataPrecipitacao)) As PrecipitacaoAcumulada3DiasAnteriores,
		   DateAdd(Day,3,V.DataPrecipitacao) As DataRiscoFogoObservadoTresDiasPraFrente,
		   IsNull(R.RiscoFogoObservadoTresDiasPraFrente,0) As RiscoFogoObservadoTresDiasPraFrente
From VolumePrecipitacao2018x2020 V Outer Apply (Select Top 1 RiscoFogo From Queimadas2018x2020Sorocaba
                                                                                    Where DataHora = DateAdd(Day,+3,V.DataPrecipitacao)) As R(RiscoFogoObservadoTresDiasPraFrente)
Where V.ValorPrecipitacao > 0
Order By Data Asc

-- Indicador 3 - Registro de Precipitação(ANA) e Registro de Queimadas(INPE) para o Município de Sorocaba entre os anos de 2018 e 2020 --
Insert Into AnaliseQueimadasSelecionadas (DataAnaliseQueimadasSelecionadas, DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, DataRiscoFogoObservadoTresDiasPraFrente,RiscoFogoObservadoTresDiasPraFrente)
Select Distinct V.DataPrecipitacao As Data,
           Q.DiaSemChuva,
           (Select ValorPrecipitacao From VolumePrecipitacao2018x2020 
		    Where DataPrecipitacao = DateAdd(Day,-1,V.DataPrecipitacao)) As PrecipitacaoUmDiaAntes,
           (Select Sum(ValorPrecipitacao) From VolumePrecipitacao2018x2020
            Where DataPrecipitacao  >= DateAdd(day,-3,V.DataPrecipitacao) 
		    And DataPrecipitacao <= DateAdd(Day,-1,V.DataPrecipitacao)) As PrecipitacaoAcumulada3DiasAnteriores,
		   DateAdd(Day,3,V.DataPrecipitacao) As DataRiscoFogoObservadoTresDiasPraFrente,
		   IsNull(R.RiscoFogoObservadoTresDiasPraFrente,0) As RiscoFogoObservadoTresDiasPraFrente
From VolumePrecipitacao2018x2020 V Inner Join Queimadas2018x2020Sorocaba Q
															    On V.DataPrecipitacao = Q.DataHora
															   Outer Apply (Select Top 1 RiscoFogo From Queimadas2018x2020Sorocaba
                                                                                     Where DataHora = DateAdd(Day,+3,V.DataPrecipitacao)) As R(RiscoFogoObservadoTresDiasPraFrente)Where V.ValorPrecipitacao >0
Order By Data Asc

-- Indicador 4 - Sem Registro de Precipitação(ANA) e Sem Registro de Queimadas(INPE) para o Município de Sorocaba entre os anos de 2018 e 2020 --
Insert Into AnaliseQueimadasSelecionadas (DataAnaliseQueimadasSelecionadas, DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, DataRiscoFogoObservadoTresDiasPraFrente,RiscoFogoObservadoTresDiasPraFrente)
Select C.DataDatasSemChuvaOuQueimadas,
           (Select Count(CodigoVolumePrecipitacao)+1 From VolumePrecipitacao2018x2020
            Where DataPrecipitacao >= (Select Convert(Char(10),DateAdd(dd,-(Day(V.DataPrecipitacao)-1),V.DataPrecipitacao),23)
			                                               From VolumePrecipitacao2018x2020
			                                               Where DataPrecipitacao = V.DataPrecipitacao)
			And DataPrecipitacao <=V.DataPrecipitacao 
			And ValorPrecipitacao =0) As DiaSemChuva, 
		   V.ValorPrecipitacao,
		   P.PrecipitacaoAculumada3DiaAnteriores,
		   DateAdd(Day,3,V.DataPrecipitacao) As DataRiscoFogoObservadoTresDiasPraFrente,
		   IsNull(R.RiscoFogoObservadoTresDiasPraFrente,0) As RiscoFogoObservadoTresDiasPraFrente
From DatasSemChuvaOuQueimadas C Inner Join VolumePrecipitacao2018x2020 V
                                                                On V.DataPrecipitacao = DateAdd(Day,-1,C.DataDatasSemChuvaOuQueimadas)
															   Outer Apply (Select Sum(ValorPrecipitacao) From VolumePrecipitacao2018x2020
                                                                                    Where DataPrecipitacao  >= DateAdd(day,-3,C.DataDatasSemChuvaOuQueimadas)
																   		   	        And DataPrecipitacao <= C.DataDatasSemChuvaOuQueimadas) As P(PrecipitacaoAculumada3DiaAnteriores)
															   Outer Apply (Select Top 1 RiscoFogo From Queimadas2018x2020Sorocaba
                                                                                     Where DataHora = DateAdd(Day,+3,V.DataPrecipitacao)) As R(RiscoFogoObservadoTresDiasPraFrente)
Order By C.DataDatasSemChuvaOuQueimadas

-- Normalizando os Dados --
;With CTENormalizacaoDeDados (Codigo, DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, RiscoFogoObservadoTresDiasPraFrente)
As
(
Select CodigoAnaliseQueimadasSelecionadas, 
           Round(CUME_DIST() Over(Order By DiaSemChuva),2) As DiaSemChuva,
           Round(CUME_DIST() Over(Order By PrecipitacaoUmDiaAnterior),2) As PrecipitacaoUmDiaAnterior,
           Round(CUME_DIST() Over(Order By AcumuladoPrecipitacaoTresDiasAnteriores),2) As AcumuladoPrecipitacaoTresDiasAnteriores,
		   Round(CUME_DIST() Over(Order By RiscoFogoObservadoTresDiasPraFrente),2) As RiscoFogoObservadoTresDiasPraFrente
From AnaliseQueimadasSelecionadas)
Update AnaliseQueimadasSelecionadas
Set DiaSemChuva = C.DiaSemChuva,
      PrecipitacaoUmDiaAnterior = C.PrecipitacaoUmDiaAnterior,
	  AcumuladoPrecipitacaoTresDiasAnteriores =  C.AcumuladoPrecipitacaoTresDiasAnteriores,
	  RiscoFogoObservadoTresDiasPraFrente = C.RiscoFogoObservadoTresDiasPraFrente
From AnaliseQueimadasSelecionadas A Inner Join CTENormalizacaoDeDados C
																  On A.CodigoAnaliseQueimadasSelecionadas = C.Codigo

-- Selecionando 30% dos registros existentes na Tabela AnaliseQueimadasSelecionadas para serem inseridos na Tabela AnaliseQueimadasSelecionadasTesting --
Insert Into AnaliseQueimadasSelecionadasTesting(CodigoAnaliseQueimadasSelecionadasTesting, DataAnaliseQueimadasSelecionadasTesting,
                                                                                   DiaSemChuvaTesting, PrecipitacaoUmDiaAnteriorTesting, AcumuladoPrecipitacaoTresDiasAnterioresTesting,
																				   DataRiscoFogoObservadoTresDiasPraFrenteTesting ,RiscoFogoObservadoTresDiasPraFrenteTesting)
Select Top 30 Percent CodigoAnaliseQueimadasSelecionadas, DataAnaliseQueimadasSelecionadas, DiaSemChuva, PrecipitacaoUmDiaAnterior, 
                                    AcumuladoPrecipitacaoTresDiasAnteriores, DataRiscoFogoObservadoTresDiasPraFrente, RiscoFogoObservadoTresDiasPraFrente								
From AnaliseQueimadasSelecionadas
Order By NewId()

-- Armazenando o restantes dos registros existentes na Tabela AnaliseQueimadasSelecionadas para serem inseridos na Tabela AnaliseQueimadasSelecionadasTraining --
Insert Into AnaliseQueimadasSelecionadasTraining(CodigoAnaliseQueimadasSelecionadasTraining, DataAnaliseQueimadasSelecionadasTraining,
                                                                                    DiaSemChuvaTraining, PrecipitacaoUmDiaAnteriorTraining, AcumuladoPrecipitacaoTresDiasAnterioresTraining,
																				    DataRiscoFogoObservadoTresDiasPraFrenteTraining, RiscoFogoObservadoTresDiasPraFrenteTraining)
Select  CodigoAnaliseQueimadasSelecionadas, DataAnaliseQueimadasSelecionadas, DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, 
            DataRiscoFogoObservadoTresDiasPraFrente ,RiscoFogoObservadoTresDiasPraFrente
From AnaliseQueimadasSelecionadas
Where CodigoAnaliseQueimadasSelecionadas Not In (Select CodigoAnaliseQueimadasSelecionadasTesting From AnaliseQueimadasSelecionadasTesting)
Order By NewId()

-- Realizando a Separação dos dados para cada Group de Training -- Group1 --
Insert Into AnaliseQueimadasSelecionadasTrainingGroup1(CodigoAnaliseQueimadasSelecionadasTrainingGroup1, DataAnaliseQueimadasSelecionadasTrainingGroup1,
                                                                                               DiaSemChuvaTrainingGroup1, PrecipitacaoUmDiaAnteriorTrainingGroup1, AcumuladoPrecipitacaoTresDiasAnterioresTrainingGroup1, 
																							   DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup1, 
								                                                               RiscoFogoObservadoTresDiasPraFrenteTrainingGroup1)
Select Top (Select Count(CodigoAnaliseQueimadasSelecionadasTraining)/5 From AnaliseQueimadasSelecionadasTraining) 
                   CodigoAnaliseQueimadasSelecionadasTraining, DataAnaliseQueimadasSelecionadasTraining, DiaSemChuvaTraining, PrecipitacaoUmDiaAnteriorTraining, 
		           AcumuladoPrecipitacaoTresDiasAnterioresTraining, DataRiscoFogoObservadoTresDiasPraFrenteTraining, RiscoFogoObservadoTresDiasPraFrenteTraining
From AnaliseQueimadasSelecionadasTraining
Order By NewId()

-- Realizando a Separação dos dados para cada Group de Training -- Group2 --
Insert Into AnaliseQueimadasSelecionadasTrainingGroup2(CodigoAnaliseQueimadasSelecionadasTrainingGroup2, DataAnaliseQueimadasSelecionadasTrainingGroup2,
                                                                                               DiaSemChuvaTrainingGroup2, PrecipitacaoUmDiaAnteriorTrainingGroup2, AcumuladoPrecipitacaoTresDiasAnterioresTrainingGroup2,
																				               DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup2, 
																							   RiscoFogoObservadoTresDiasPraFrenteTrainingGroup2)
Select Top (Select Count(CodigoAnaliseQueimadasSelecionadasTraining)/5 From AnaliseQueimadasSelecionadasTraining) 
                  CodigoAnaliseQueimadasSelecionadasTraining, DataAnaliseQueimadasSelecionadasTraining, DiaSemChuvaTraining, PrecipitacaoUmDiaAnteriorTraining, 
                  AcumuladoPrecipitacaoTresDiasAnterioresTraining, DataRiscoFogoObservadoTresDiasPraFrenteTraining, RiscoFogoObservadoTresDiasPraFrenteTraining
From AnaliseQueimadasSelecionadasTraining
Where CodigoAnaliseQueimadasSelecionadasTraining Not In (Select CodigoAnaliseQueimadasSelecionadasTrainingGroup1 From AnaliseQueimadasSelecionadasTrainingGroup1)
Order By NewId()

-- Realizando a Separação dos dados para cada Group de Training -- Group3 --
Insert Into AnaliseQueimadasSelecionadasTrainingGroup3(CodigoAnaliseQueimadasSelecionadasTrainingGroup3, DataAnaliseQueimadasSelecionadasTrainingGroup3,
                                                                                               DiaSemChuvaTrainingGroup3, PrecipitacaoUmDiaAnteriorTrainingGroup3, AcumuladoPrecipitacaoTresDiasAnterioresTrainingGroup3,
																				               DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup3, 
																							   RiscoFogoObservadoTresDiasPraFrenteTrainingGroup3)
Select Top (Select Count(CodigoAnaliseQueimadasSelecionadasTraining)/5 From AnaliseQueimadasSelecionadasTraining) 
                  CodigoAnaliseQueimadasSelecionadasTraining, DataAnaliseQueimadasSelecionadasTraining, DiaSemChuvaTraining, PrecipitacaoUmDiaAnteriorTraining, 
                  AcumuladoPrecipitacaoTresDiasAnterioresTraining, DataRiscoFogoObservadoTresDiasPraFrenteTraining, RiscoFogoObservadoTresDiasPraFrenteTraining
From AnaliseQueimadasSelecionadasTraining
Where CodigoAnaliseQueimadasSelecionadasTraining Not In (Select CodigoAnaliseQueimadasSelecionadasTrainingGroup1 From AnaliseQueimadasSelecionadasTrainingGroup1)
And  CodigoAnaliseQueimadasSelecionadasTraining Not In (Select CodigoAnaliseQueimadasSelecionadasTrainingGroup2 From AnaliseQueimadasSelecionadasTrainingGroup2)
Order By NewId()

-- Realizando a Separação dos dados para cada Group de Training -- Group4 --
Insert Into AnaliseQueimadasSelecionadasTrainingGroup4(CodigoAnaliseQueimadasSelecionadasTrainingGroup4, DataAnaliseQueimadasSelecionadasTrainingGroup4,
                                                                                                DiaSemChuvaTrainingGroup4, PrecipitacaoUmDiaAnteriorTrainingGroup4, AcumuladoPrecipitacaoTresDiasAnterioresTrainingGroup4,
																				                DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup4, 
																								RiscoFogoObservadoTresDiasPraFrenteTrainingGroup4)
Select Top (Select Count(CodigoAnaliseQueimadasSelecionadasTraining)/5 From AnaliseQueimadasSelecionadasTraining) 
                   CodigoAnaliseQueimadasSelecionadasTraining, DataAnaliseQueimadasSelecionadasTraining, DiaSemChuvaTraining, PrecipitacaoUmDiaAnteriorTraining, 
                   AcumuladoPrecipitacaoTresDiasAnterioresTraining, DataRiscoFogoObservadoTresDiasPraFrenteTraining, RiscoFogoObservadoTresDiasPraFrenteTraining
From AnaliseQueimadasSelecionadasTraining
Where CodigoAnaliseQueimadasSelecionadasTraining Not In (Select CodigoAnaliseQueimadasSelecionadasTrainingGroup1 From AnaliseQueimadasSelecionadasTrainingGroup1)
And  CodigoAnaliseQueimadasSelecionadasTraining Not In (Select CodigoAnaliseQueimadasSelecionadasTrainingGroup2 From AnaliseQueimadasSelecionadasTrainingGroup2)
And  CodigoAnaliseQueimadasSelecionadasTraining Not In (Select CodigoAnaliseQueimadasSelecionadasTrainingGroup3 From AnaliseQueimadasSelecionadasTrainingGroup3)
Order By NewId()

-- Realizando a Separação dos dados para cada Group de Training -- Group5 --
Insert Into AnaliseQueimadasSelecionadasTrainingGroup5(CodigoAnaliseQueimadasSelecionadasTrainingGroup5, DataAnaliseQueimadasSelecionadasTrainingGroup5,
                                                                                               DiaSemChuvaTrainingGroup5, PrecipitacaoUmDiaAnteriorTrainingGroup5, AcumuladoPrecipitacaoTresDiasAnterioresTrainingGroup5,
																				               DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup5, 
																							   RiscoFogoObservadoTresDiasPraFrenteTrainingGroup5)
Select Top (Select Count(CodigoAnaliseQueimadasSelecionadasTraining)/5 From AnaliseQueimadasSelecionadasTraining) 
                  CodigoAnaliseQueimadasSelecionadasTraining, DataAnaliseQueimadasSelecionadasTraining, DiaSemChuvaTraining, PrecipitacaoUmDiaAnteriorTraining, 
                  AcumuladoPrecipitacaoTresDiasAnterioresTraining, DataRiscoFogoObservadoTresDiasPraFrenteTraining, RiscoFogoObservadoTresDiasPraFrenteTraining
From AnaliseQueimadasSelecionadasTraining
Where CodigoAnaliseQueimadasSelecionadasTraining Not In (Select CodigoAnaliseQueimadasSelecionadasTrainingGroup1 From AnaliseQueimadasSelecionadasTrainingGroup1)
And  CodigoAnaliseQueimadasSelecionadasTraining Not In (Select CodigoAnaliseQueimadasSelecionadasTrainingGroup2 From AnaliseQueimadasSelecionadasTrainingGroup2)
And  CodigoAnaliseQueimadasSelecionadasTraining Not In (Select CodigoAnaliseQueimadasSelecionadasTrainingGroup3 From AnaliseQueimadasSelecionadasTrainingGroup3)
And  CodigoAnaliseQueimadasSelecionadasTraining Not In (Select CodigoAnaliseQueimadasSelecionadasTrainingGroup4 From AnaliseQueimadasSelecionadasTrainingGroup4)
Order By NewId()

-- Carregando os dados no arquivo de Testing --
-- AnaliseQueimadasSelecionadasTesting - DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, Chuva, Queimada --
Declare @BCPComando Varchar(500)
Set @BCPComando='bcp "Select DiaSemChuvaTesting, PrecipitacaoUmDiaAnteriorTesting, AcumuladoPrecipitacaoTresDiasAnterioresTesting, RiscoFogoObservadoTresDiasPraFrenteTesting From ProjetoDWQueimadas..AnaliseQueimadasSelecionadasTesting" queryout "P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo5-Conteudo-ANFIS-ValidacaoCruzada-Testing.txt" -c -UTF8 -T -SWIN10PRO\WIN10PROSQL2019'
Exec master..xp_cmdshell @BCPComando, No_Output
Print 'Arquivo: Modelo5-Conteudo-ANFIS-ValidacaoCruzada-Testing.txt criado.'

-- Carregando os dados no arquivo de CheckingGroup1 -- Tabela TrainingGroup1 --
-- AnaliseQueimadasSelecionadasTraining - DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, Chuva, Queimada, RiscoFogoObservadoTresDiasPraFrente --
Set @BCPComando='bcp "Select DiaSemChuvaTrainingGroup1, PrecipitacaoUmDiaAnteriorTrainingGroup1, AcumuladoPrecipitacaoTresDiasAnterioresTrainingGroup1, RiscoFogoObservadoTresDiasPraFrenteTrainingGroup1 From ProjetoDWQueimadas..AnaliseQueimadasSelecionadasTrainingGroup1" queryout "P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo5-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup1.txt" -c -UTF8 -T -SWIN10PRO\WIN10PROSQL2019'
Exec master..xp_cmdshell @BCPComando, No_Output
Print 'Arquivo: Modelo5-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup1.txt criado.'

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
-- AnaliseQueimadasSelecionadasTraining - DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, Chuva, Queimada, RiscoFogoObservadoTresDiasPraFrente --
Set @BCPComando='bcp "Select DiaSemChuvaTrainingGroup2345, PrecipitacaoUmDiaAnteriorTrainingGroup2345, AcumuladoPrecipitacaoTresDiasAnterioresTrainingGroup2345, RiscoFogoObservadoTresDiasPraFrenteTrainingGroup2345 From ProjetoDWQueimadas..AnaliseQueimadasSelecionadasTrainingGroup2345" queryout "P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo5-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup2345.txt" -c -UTF8 -T -SWIN10PRO\WIN10PROSQL2019'
Exec master..xp_cmdshell @BCPComando, No_Output
Print 'Arquivo: Modelo5-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup2345.txt criado.'

-- Carregando os dados no arquivo de CheckingGroup2 -- Tabela TrainingGroup2 --
-- AnaliseQueimadasSelecionadasTraining - DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, Chuva, Queimada, RiscoFogoObservadoTresDiasPraFrente --
Set @BCPComando='bcp "Select DiaSemChuvaTrainingGroup2, PrecipitacaoUmDiaAnteriorTrainingGroup2, AcumuladoPrecipitacaoTresDiasAnterioresTrainingGroup2, RiscoFogoObservadoTresDiasPraFrenteTrainingGroup2 From ProjetoDWQueimadas..AnaliseQueimadasSelecionadasTrainingGroup2" queryout "P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo5-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup2.txt" -c -UTF8 -T -SWIN10PRO\WIN10PROSQL2019'
Exec master..xp_cmdshell @BCPComando, No_Output
Print 'Arquivo: Modelo5-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup2.txt criado.'

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
-- AnaliseQueimadasSelecionadasTraining - DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, Chuva, Queimada, RiscoFogoObservadoTresDiasPraFrente --
Set @BCPComando='bcp "Select DiaSemChuvaTrainingGroup1345, PrecipitacaoUmDiaAnteriorTrainingGroup1345, AcumuladoPrecipitacaoTresDiasAnterioresTrainingGroup1345, RiscoFogoObservadoTresDiasPraFrenteTrainingGroup1345 From ProjetoDWQueimadas..AnaliseQueimadasSelecionadasTrainingGroup1345" queryout "P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo5-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup1345.txt" -c -UTF8 -T -SWIN10PRO\WIN10PROSQL2019'
Exec master..xp_cmdshell @BCPComando, No_Output
Print 'Arquivo: Modelo5-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup1345.txt criado.'

-- Carregando os dados no arquivo de CheckingGroup3 -- Tabela TrainingGroup3 --
-- AnaliseQueimadasSelecionadasTraining - DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, Chuva, Queimada, RiscoFogoObservadoTresDiasPraFrente --
Set @BCPComando='bcp "Select DiaSemChuvaTrainingGroup3, PrecipitacaoUmDiaAnteriorTrainingGroup3, AcumuladoPrecipitacaoTresDiasAnterioresTrainingGroup3, RiscoFogoObservadoTresDiasPraFrenteTrainingGroup3 From ProjetoDWQueimadas..AnaliseQueimadasSelecionadasTrainingGroup3" queryout "P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo5-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup3.txt" -c -UTF8 -T -SWIN10PRO\WIN10PROSQL2019'
Exec master..xp_cmdshell @BCPComando, No_Output
Print 'Arquivo: Modelo5-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup3.txt criado.'

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
-- AnaliseQueimadasSelecionadasTraining - DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, Chuva, Queimada, RiscoFogoObservadoTresDiasPraFrente --
Set @BCPComando='bcp "Select DiaSemChuvaTrainingGroup1245, PrecipitacaoUmDiaAnteriorTrainingGroup1245, AcumuladoPrecipitacaoTresDiasAnterioresTrainingGroup1245, RiscoFogoObservadoTresDiasPraFrenteTrainingGroup1245 From ProjetoDWQueimadas..AnaliseQueimadasSelecionadasTrainingGroup1245" queryout "P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo5-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup1245.txt" -c -UTF8 -T -SWIN10PRO\WIN10PROSQL2019'
Exec master..xp_cmdshell @BCPComando, No_Output
Print 'Arquivo: Modelo5-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup1245.txt criado.'

-- Carregando os dados no arquivo de CheckingGroup4 -- Tabela TrainingGroup4 --
-- AnaliseQueimadasSelecionadasTraining - DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, Chuva, Queimada, RiscoFogoObservadoTresDiasPraFrente --
Set @BCPComando='bcp "Select DiaSemChuvaTrainingGroup4, PrecipitacaoUmDiaAnteriorTrainingGroup4, AcumuladoPrecipitacaoTresDiasAnterioresTrainingGroup4, RiscoFogoObservadoTresDiasPraFrenteTrainingGroup4 From ProjetoDWQueimadas..AnaliseQueimadasSelecionadasTrainingGroup4" queryout "P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo5-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup4.txt" -c -UTF8 -T -SWIN10PRO\WIN10PROSQL2019'
Exec master..xp_cmdshell @BCPComando, No_Output
Print 'Arquivo: Modelo5-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup4.txt criado.'

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
-- AnaliseQueimadasSelecionadasTraining - DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, Chuva, Queimada, RiscoFogoObservadoTresDiasPraFrente --
Set @BCPComando='bcp "Select DiaSemChuvaTrainingGroup1235, PrecipitacaoUmDiaAnteriorTrainingGroup1235, AcumuladoPrecipitacaoTresDiasAnterioresTrainingGroup1235, RiscoFogoObservadoTresDiasPraFrenteTrainingGroup1235 From ProjetoDWQueimadas..AnaliseQueimadasSelecionadasTrainingGroup1235" queryout "P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo5-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup1235.txt" -c -UTF8 -T -SWIN10PRO\WIN10PROSQL2019'
Exec master..xp_cmdshell @BCPComando, No_Output
Print 'Arquivo: Modelo5-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup1235.txt criado.'

-- Carregando os dados no arquivo de CheckingGroup5 -- Tabela TrainingGroup5 --
-- AnaliseQueimadasSelecionadasTraining - DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, Chuva, Queimada, RiscoFogoObservadoTresDiasPraFrente --
Set @BCPComando='bcp "Select DiaSemChuvaTrainingGroup5, PrecipitacaoUmDiaAnteriorTrainingGroup5, AcumuladoPrecipitacaoTresDiasAnterioresTrainingGroup5, RiscoFogoObservadoTresDiasPraFrenteTrainingGroup5 From ProjetoDWQueimadas..AnaliseQueimadasSelecionadasTrainingGroup5" queryout "P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo5-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup5.txt" -c -UTF8 -T -SWIN10PRO\WIN10PROSQL2019'
Exec master..xp_cmdshell @BCPComando, No_Output
Print 'Arquivo: Modelo5-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup5.txt criado.'

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
-- AnaliseQueimadasSelecionadasTraining - DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, Chuva, Queimada, RiscoFogoObservadoTresDiasPraFrente --
Set @BCPComando='bcp "Select DiaSemChuvaTrainingGroup1234, PrecipitacaoUmDiaAnteriorTrainingGroup1234, AcumuladoPrecipitacaoTresDiasAnterioresTrainingGroup1234, RiscoFogoObservadoTresDiasPraFrenteTrainingGroup1234 From ProjetoDWQueimadas..AnaliseQueimadasSelecionadasTrainingGroup1234" queryout "P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo5-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup1234.txt" -c -UTF8 -T -SWIN10PRO\WIN10PROSQL2019'
Exec master..xp_cmdshell @BCPComando, No_Output
Print 'Arquivo: Modelo5-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup1234.txt criado.'
End
Go