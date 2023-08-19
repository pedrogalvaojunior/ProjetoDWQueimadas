-- Acessando o Banco de Dados --
Use ProjetoDWQueimadas
Go

-- Verificando a existência das tabelas --
If Exists (Select name From Sys.tables Where Name = 'AnaliseQueimadasSelecionadas' Or Name = 'AnaliseQueimadasSelecionadasTrainingGroup1' Or Name = 'AnaliseQueimadasSelecionadasTrainingGroup2345')
Begin
 Drop Table AnaliseQueimadasSelecionadas
 Drop Table AnaliseQueimadasSelecionadasTesting
 Drop Table AnaliseQueimadasSelecionadasTraining
 Drop Table AnaliseQueimadasSelecionadasTrainingGroup1
 Drop Table AnaliseQueimadasSelecionadasTrainingGroup2
 Drop Table AnaliseQueimadasSelecionadasTrainingGroup3
 Drop Table AnaliseQueimadasSelecionadasTrainingGroup4
 Drop Table AnaliseQueimadasSelecionadasTrainingGroup5
 Drop Table AnaliseQueimadasSelecionadasTrainingGroup2345
 Drop Table AnaliseQueimadasSelecionadasTrainingGroup1345
 Drop Table AnaliseQueimadasSelecionadasTrainingGroup1245
 Drop Table AnaliseQueimadasSelecionadasTrainingGroup1235
 Drop Table AnaliseQueimadasSelecionadasTrainingGroup1234
End

-- Criando a Tabela AnaliseQueimadasSelecionadas --
Create Table AnaliseQueimadasSelecionadas
(CodigoAnaliseQueimadasSelecionadas Int Identity(1,1) Primary Key Clustered,
 DataAnaliseQueimadasSelecionadas Date,
 DiaSemChuva Float Not Null,
 PrecipitacaoUmDiaAnterior Float,
 DataRiscoFogoObservadoTresDiasPraFrente Date,
 RiscoFogoObservadoTresDiasPraFrente Float)
Go

-- Criando a Tabela AnaliseQueimadasSelecionadasTesting --
Create Table AnaliseQueimadasSelecionadasTesting
(CodigoAnaliseQueimadasSelecionadasTesting Int Primary Key Clustered,
 DataAnaliseQueimadasSelecionadasTesting Date,
 DiaSemChuvaTesting Float Not Null,
 PrecipitacaoUmDiaAnteriorTesting Float,
 DataRiscoFogoObservadoTresDiasPraFrenteTesting Date,
 RiscoFogoObservadoTresDiasPraFrenteTesting Float)
Go

-- Criando a Tabela AnaliseQueimadasSelecionadasTraining --
Create Table AnaliseQueimadasSelecionadasTraining
(CodigoAnaliseQueimadasSelecionadasTraining Int Primary Key Clustered,
 DataAnaliseQueimadasSelecionadasTraining Date,
 DiaSemChuvaTraining Float Not Null,
 PrecipitacaoUmDiaAnteriorTraining Float,
 DataRiscoFogoObservadoTresDiasPraFrenteTraining Date,
 RiscoFogoObservadoTresDiasPraFrenteTraining Float)
Go

-- Criando a Tabela AnaliseQueimadasSelecionadasTraining --
Create Table AnaliseQueimadasSelecionadasTrainingGroup1
(CodigoAnaliseQueimadasSelecionadasTrainingGroup1 Int Primary Key Clustered,
 DataAnaliseQueimadasSelecionadasTrainingGroup1 Date,
 DiaSemChuvaTrainingGroup1 Float Not Null,
 PrecipitacaoUmDiaAnteriorTrainingGroup1 Float,
 DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup1 Date,
 RiscoFogoObservadoTresDiasPraFrenteTrainingGroup1 Float)
Go

-- Criando a Tabela AnaliseQueimadasSelecionadasTraining --
Create Table AnaliseQueimadasSelecionadasTrainingGroup2
(CodigoAnaliseQueimadasSelecionadasTrainingGroup2 Int Primary Key Clustered,
 DataAnaliseQueimadasSelecionadasTrainingGroup2 Date,
 DiaSemChuvaTrainingGroup2 Float Not Null,
 PrecipitacaoUmDiaAnteriorTrainingGroup2 Float,
 DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup2 Date,
 RiscoFogoObservadoTresDiasPraFrenteTrainingGroup2 Float)
Go

-- Criando a Tabela AnaliseQueimadasSelecionadasTraining --
Create Table AnaliseQueimadasSelecionadasTrainingGroup3
(CodigoAnaliseQueimadasSelecionadasTrainingGroup3 Int Primary Key Clustered,
 DataAnaliseQueimadasSelecionadasTrainingGroup3 Date,
 DiaSemChuvaTrainingGroup3 Float Not Null,
 PrecipitacaoUmDiaAnteriorTrainingGroup3 Float,
 DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup3 Date,
 RiscoFogoObservadoTresDiasPraFrenteTrainingGroup3 Float)
Go

-- Criando a Tabela AnaliseQueimadasSelecionadasTraining --
Create Table AnaliseQueimadasSelecionadasTrainingGroup4
(CodigoAnaliseQueimadasSelecionadasTrainingGroup4 Int Primary Key Clustered,
 DataAnaliseQueimadasSelecionadasTrainingGroup4 Date,
 DiaSemChuvaTrainingGroup4 Float Not Null,
 PrecipitacaoUmDiaAnteriorTrainingGroup4 Float,
 DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup4 Date,
 RiscoFogoObservadoTresDiasPraFrenteTrainingGroup4 Float)
Go

-- Criando a Tabela AnaliseQueimadasSelecionadasTraining --
Create Table AnaliseQueimadasSelecionadasTrainingGroup5
(CodigoAnaliseQueimadasSelecionadasTrainingGroup5 Int Primary Key Clustered,
 DataAnaliseQueimadasSelecionadasTrainingGroup5 Date,
 DiaSemChuvaTrainingGroup5 Float Not Null,
 PrecipitacaoUmDiaAnteriorTrainingGroup5 Float,
 DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup5 Date,
 RiscoFogoObservadoTresDiasPraFrenteTrainingGroup5 Float)
Go

-- Criando a Tabela AnaliseQueimadasSelecionadasTraining2345 -- CheckingTrainingGroup1 --
Create Table AnaliseQueimadasSelecionadasTrainingGroup2345
(CodigoAnaliseQueimadasSelecionadasTrainingGroup2345 Int Primary Key Clustered,
 DataAnaliseQueimadasSelecionadasTrainingGroup2345 Date,
 DiaSemChuvaTrainingGroup2345 Float Not Null,
 PrecipitacaoUmDiaAnteriorTrainingGroup2345 Float,
 DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup2345 Date,
 RiscoFogoObservadoTresDiasPraFrenteTrainingGroup2345 Float)
Go

-- Criando a Tabela AnaliseQueimadasSelecionadasTraining1345 -- -- CheckingTrainingGroup2 --
Create Table AnaliseQueimadasSelecionadasTrainingGroup1345
(CodigoAnaliseQueimadasSelecionadasTrainingGroup1345 Int Primary Key Clustered,
 DataAnaliseQueimadasSelecionadasTrainingGroup1345 Date,
 DiaSemChuvaTrainingGroup1345 Float Not Null,
 PrecipitacaoUmDiaAnteriorTrainingGroup1345 Float,
 DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup1345 Date,
 RiscoFogoObservadoTresDiasPraFrenteTrainingGroup1345 Float)
Go

-- Criando a Tabela AnaliseQueimadasSelecionadasTraining1245 -- -- CheckingTrainingGroup3 --
Create Table AnaliseQueimadasSelecionadasTrainingGroup1245
(CodigoAnaliseQueimadasSelecionadasTrainingGroup1245 Int Primary Key Clustered,
 DataAnaliseQueimadasSelecionadasTrainingGroup1245 Date,
 DiaSemChuvaTrainingGroup1245 Float Not Null,
 PrecipitacaoUmDiaAnteriorTrainingGroup1245 Float,
 DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup1245 Date,
 RiscoFogoObservadoTresDiasPraFrenteTrainingGroup1245 Float)
Go

-- Criando a Tabela AnaliseQueimadasSelecionadasTraining1235 -- -- CheckingTrainingGroup4 --
Create Table AnaliseQueimadasSelecionadasTrainingGroup1235
(CodigoAnaliseQueimadasSelecionadasTrainingGroup1235 Int Primary Key Clustered,
 DataAnaliseQueimadasSelecionadasTrainingGroup1235 Date,
 DiaSemChuvaTrainingGroup1235 Float Not Null,
 PrecipitacaoUmDiaAnteriorTrainingGroup1235 Float,
 DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup1235 Date,
 RiscoFogoObservadoTresDiasPraFrenteTrainingGroup1235 Float)
Go

-- Criando a Tabela AnaliseQueimadasSelecionadasTraining1234 -- -- CheckingTrainingGroup5 --
Create Table AnaliseQueimadasSelecionadasTrainingGroup1234
(CodigoAnaliseQueimadasSelecionadasTrainingGroup1234 Int Primary Key Clustered,
 DataAnaliseQueimadasSelecionadasTrainingGroup1234 Date,
 DiaSemChuvaTrainingGroup1234 Float Not Null,
 PrecipitacaoUmDiaAnteriorTrainingGroup1234 Float,
 DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup1234 Date,
 RiscoFogoObservadoTresDiasPraFrenteTrainingGroup1234 Float)
Go

-- Limpando as Tabelas --
If ((Select Count(CodigoAnaliseQueimadasSelecionadas) From AnaliseQueimadasSelecionadas) = 1 Or (Select Count(CodigoAnaliseQueimadasSelecionadasTesting) From AnaliseQueimadasSelecionadasTesting) = 1)
Begin
 Truncate Table AnaliseQueimadasSelecionadas
 Truncate Table AnaliseQueimadasSelecionadasTesting
 Truncate Table AnaliseQueimadasSelecionadasTraining
 Truncate Table AnaliseQueimadasSelecionadasTrainingGroup1
 Truncate Table AnaliseQueimadasSelecionadasTrainingGroup2
 Truncate Table AnaliseQueimadasSelecionadasTrainingGroup3
 Truncate Table AnaliseQueimadasSelecionadasTrainingGroup4
 Truncate Table AnaliseQueimadasSelecionadasTrainingGroup5
 Truncate Table AnaliseQueimadasSelecionadasTrainingGroup2345
 Truncate Table AnaliseQueimadasSelecionadasTrainingGroup1345
 Truncate Table AnaliseQueimadasSelecionadasTrainingGroup1245
 Truncate Table AnaliseQueimadasSelecionadasTrainingGroup1235
 Truncate Table AnaliseQueimadasSelecionadasTrainingGroup1234
End
Go

-- Realizando a Análise e Inserindo na Tabela AnaliseQueimadasSelecionadas --
-- Indicador 1 - Registro de Queimadas(INPE) para o Município de Sorocaba entre os anos de 2018 e 2020 --
Insert Into AnaliseQueimadasSelecionadas (DataAnaliseQueimadasSelecionadas, DiaSemChuva, PrecipitacaoUmDiaAnterior, DataRiscoFogoObservadoTresDiasPraFrente, RiscoFogoObservadoTresDiasPraFrente)
Select Q.DataHora As Data,
           Q.DiaSemChuva, 
           (Select ValorPrecipitacao From VolumePrecipitacao2018x2020 
		    Where DataPrecipitacao = DateAdd(Day,-1,Q.DataHora)) As PrecipitacaoUmDiaAntes,
		   DateAdd(Day,3,Q.DataHora) As DataRiscoFogoObservadoTresDiasPraFrente,
		   IsNull(R.RiscoFogoObservadoTresDiasPraFrente,0) As RiscoFogoObservadoTresDiasPraFrente
From Queimadas2018x2020Sorocaba Q Outer Apply (Select Top 1 IsNull(RiscoFogo,0) From Queimadas2018x2020Sorocaba
                                                                                       Where DataHora = DateAdd(Day,+3,Q.DataHora)) As R(RiscoFogoObservadoTresDiasPraFrente)
Order By Data Asc
Go

-- Indicador 2 - Registro de Precipitação(ANA) para o Município de Sorocaba entre os anos de 2018 e 2020 --
Insert Into AnaliseQueimadasSelecionadas (DataAnaliseQueimadasSelecionadas, DiaSemChuva, PrecipitacaoUmDiaAnterior, DataRiscoFogoObservadoTresDiasPraFrente,RiscoFogoObservadoTresDiasPraFrente)
Select V.DataPrecipitacao As Data,
           (Select Abs(Count(CodigoVolumePrecipitacao)-1) From VolumePrecipitacao2018x2020
            Where DataPrecipitacao >= (Select Convert(Char(10),DateAdd(dd,-(Day(V.DataPrecipitacao)-1),V.DataPrecipitacao),23)
			                                               From VolumePrecipitacao2018x2020
			                                               Where DataPrecipitacao = V.DataPrecipitacao)
			And DataPrecipitacao <=V.DataPrecipitacao 
			And ValorPrecipitacao =0) As DiaSemChuva, 
		   (Select Sum(ValorPrecipitacao) From VolumePrecipitacao2018x2020
            Where DataPrecipitacao = DateAdd(Day,-1,V.DataPrecipitacao)) As PrecipitacaoUmDiaAntes,
		   DateAdd(Day,3,V.DataPrecipitacao) As DataRiscoFogoObservadoTresDiasPraFrente,
		   IsNull(R.RiscoFogoObservadoTresDiasPraFrente,0) As RiscoFogoObservadoTresDiasPraFrente
From VolumePrecipitacao2018x2020 V Outer Apply (Select Top 1 RiscoFogo From Queimadas2018x2020Sorocaba
                                                                                    Where DataHora = DateAdd(Day,+3,V.DataPrecipitacao)) As R(RiscoFogoObservadoTresDiasPraFrente)
Where V.ValorPrecipitacao > 0
Order By Data Asc
Go

-- Indicador 3 - Registro de Precipitação(ANA) e Registro de Queimadas(INPE) para o Município de Sorocaba entre os anos de 2018 e 2020 --
Insert Into AnaliseQueimadasSelecionadas (DataAnaliseQueimadasSelecionadas, DiaSemChuva, PrecipitacaoUmDiaAnterior, DataRiscoFogoObservadoTresDiasPraFrente,RiscoFogoObservadoTresDiasPraFrente)
Select Distinct V.DataPrecipitacao As Data,
           Q.DiaSemChuva,
           (Select ValorPrecipitacao From VolumePrecipitacao2018x2020 
		    Where DataPrecipitacao = DateAdd(Day,-1,V.DataPrecipitacao)) As PrecipitacaoUmDiaAntes,
		   DateAdd(Day,3,V.DataPrecipitacao) As DataRiscoFogoObservadoTresDiasPraFrente,
		   IsNull(R.RiscoFogoObservadoTresDiasPraFrente,0) As RiscoFogoObservadoTresDiasPraFrente
From VolumePrecipitacao2018x2020 V Inner Join Queimadas2018x2020Sorocaba Q
															    On V.DataPrecipitacao = Q.DataHora
															   Outer Apply (Select Top 1 RiscoFogo From Queimadas2018x2020Sorocaba
                                                                                     Where DataHora = DateAdd(Day,+3,V.DataPrecipitacao)) As R(RiscoFogoObservadoTresDiasPraFrente)Where V.ValorPrecipitacao >0
Order By Data Asc
Go

-- Indicador 4 - Sem Registro de Precipitação(ANA) e Sem Registro de Queimadas(INPE) para o Município de Sorocaba entre os anos de 2018 e 2020 --
Insert Into AnaliseQueimadasSelecionadas (DataAnaliseQueimadasSelecionadas, DiaSemChuva, PrecipitacaoUmDiaAnterior, DataRiscoFogoObservadoTresDiasPraFrente,RiscoFogoObservadoTresDiasPraFrente)
Select C.DataDatasSemChuvaOuQueimadas,
           (Select Count(CodigoVolumePrecipitacao)+1 From VolumePrecipitacao2018x2020
            Where DataPrecipitacao >= (Select Convert(Char(10),DateAdd(dd,-(Day(V.DataPrecipitacao)-1),V.DataPrecipitacao),23)
			                                               From VolumePrecipitacao2018x2020
			                                               Where DataPrecipitacao = V.DataPrecipitacao)
			And DataPrecipitacao <=V.DataPrecipitacao 
			And ValorPrecipitacao =0) As DiaSemChuva, 
		   V.ValorPrecipitacao,
		   DateAdd(Day,3,V.DataPrecipitacao) As DataRiscoFogoObservadoTresDiasPraFrente,
		   IsNull(R.RiscoFogoObservadoTresDiasPraFrente,0) As RiscoFogoObservadoTresDiasPraFrente
From DatasSemChuvaOuQueimadas C Inner Join VolumePrecipitacao2018x2020 V
                                                                On V.DataPrecipitacao = DateAdd(Day,-1,C.DataDatasSemChuvaOuQueimadas)
															   Outer Apply (Select Top 1 RiscoFogo From Queimadas2018x2020Sorocaba
                                                                                     Where DataHora = DateAdd(Day,+3,V.DataPrecipitacao)) As R(RiscoFogoObservadoTresDiasPraFrente)
Order By C.DataDatasSemChuvaOuQueimadas
Go

-- Normalizando os Dados --
;With CTENormalizacaoDeDados (Codigo, DiaSemChuva, PrecipitacaoUmDiaAnterior, RiscoFogoObservadoTresDiasPraFrente)
As
(
Select CodigoAnaliseQueimadasSelecionadas, 
           Round(CUME_DIST() Over(Order By DiaSemChuva),2) As DiaSemChuva,
           Round(CUME_DIST() Over(Order By PrecipitacaoUmDiaAnterior),2) As PrecipitacaoUmDiaAnterior,
		   Round(CUME_DIST() Over(Order By RiscoFogoObservadoTresDiasPraFrente),2) As RiscoFogoObservadoTresDiasPraFrente
From AnaliseQueimadasSelecionadas)
Update AnaliseQueimadasSelecionadas
Set DiaSemChuva = C.DiaSemChuva,
      PrecipitacaoUmDiaAnterior = C.PrecipitacaoUmDiaAnterior,
	  RiscoFogoObservadoTresDiasPraFrente = C.RiscoFogoObservadoTresDiasPraFrente
From AnaliseQueimadasSelecionadas A Inner Join CTENormalizacaoDeDados C
																  On A.CodigoAnaliseQueimadasSelecionadas = C.Codigo
Go

-- Consultando os dados inseridos na Tabela AnaliseQueimadasSelecionadas --
Select CodigoAnaliseQueimadasSelecionadas, DataAnaliseQueimadasSelecionadas, DiaSemChuva, PrecipitacaoUmDiaAnterior, 
           DataRiscoFogoObservadoTresDiasPraFrente, RiscoFogoObservadoTresDiasPraFrente
From AnaliseQueimadasSelecionadas
Go

-- Selecionando 30% dos registros existentes na Tabela AnaliseQueimadasSelecionadas para serem inseridos na Tabela AnaliseQueimadasSelecionadasTesting --
Insert Into AnaliseQueimadasSelecionadasTesting(CodigoAnaliseQueimadasSelecionadasTesting, DataAnaliseQueimadasSelecionadasTesting,
                                                                                   DiaSemChuvaTesting, PrecipitacaoUmDiaAnteriorTesting,
																				   DataRiscoFogoObservadoTresDiasPraFrenteTesting ,RiscoFogoObservadoTresDiasPraFrenteTesting)
Select Top 30 Percent CodigoAnaliseQueimadasSelecionadas, DataAnaliseQueimadasSelecionadas, DiaSemChuva, PrecipitacaoUmDiaAnterior, 
                                    DataRiscoFogoObservadoTresDiasPraFrente, RiscoFogoObservadoTresDiasPraFrente								
From AnaliseQueimadasSelecionadas
Order By NewId()
Go

-- Consultando os dados inseridos na Tabela AnaliseQueimadasSelecionadasTesting --
Select CodigoAnaliseQueimadasSelecionadasTesting, DataAnaliseQueimadasSelecionadasTesting, DiaSemChuvaTesting, PrecipitacaoUmDiaAnteriorTesting, 
           DataRiscoFogoObservadoTresDiasPraFrenteTesting,
		   RiscoFogoObservadoTresDiasPraFrenteTesting
From AnaliseQueimadasSelecionadasTesting
Go

-- Armazenando o restantes dos registros existentes na Tabela AnaliseQueimadasSelecionadas para serem inseridos na Tabela AnaliseQueimadasSelecionadasTraining --
Insert Into AnaliseQueimadasSelecionadasTraining(CodigoAnaliseQueimadasSelecionadasTraining, DataAnaliseQueimadasSelecionadasTraining,
                                                                                    DiaSemChuvaTraining, PrecipitacaoUmDiaAnteriorTraining,
																				    DataRiscoFogoObservadoTresDiasPraFrenteTraining, RiscoFogoObservadoTresDiasPraFrenteTraining)
Select  CodigoAnaliseQueimadasSelecionadas, DataAnaliseQueimadasSelecionadas, DiaSemChuva, PrecipitacaoUmDiaAnterior, 
            DataRiscoFogoObservadoTresDiasPraFrente ,RiscoFogoObservadoTresDiasPraFrente
From AnaliseQueimadasSelecionadas
Where CodigoAnaliseQueimadasSelecionadas Not In (Select CodigoAnaliseQueimadasSelecionadasTesting From AnaliseQueimadasSelecionadasTesting)
Order By NewId()
Go

-- Consultando os dados inseridos na Tabela AnaliseQueimadasSelecionadasTraining --
Select CodigoAnaliseQueimadasSelecionadasTraining, DataAnaliseQueimadasSelecionadasTraining, DiaSemChuvaTraining, 
           PrecipitacaoUmDiaAnteriorTraining,
		   DataRiscoFogoObservadoTresDiasPraFrenteTraining, RiscoFogoObservadoTresDiasPraFrenteTraining
From AnaliseQueimadasSelecionadasTraining
Go

-- Realizando a Separação dos dados para cada Group de Training -- Group1 --
Insert Into AnaliseQueimadasSelecionadasTrainingGroup1(CodigoAnaliseQueimadasSelecionadasTrainingGroup1, DataAnaliseQueimadasSelecionadasTrainingGroup1,
                                                                                               DiaSemChuvaTrainingGroup1, PrecipitacaoUmDiaAnteriorTrainingGroup1, 
																							   DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup1, 
								                                                               RiscoFogoObservadoTresDiasPraFrenteTrainingGroup1)
Select Top (Select Count(CodigoAnaliseQueimadasSelecionadasTraining)/5 From AnaliseQueimadasSelecionadasTraining) 
                   CodigoAnaliseQueimadasSelecionadasTraining, DataAnaliseQueimadasSelecionadasTraining, DiaSemChuvaTraining, PrecipitacaoUmDiaAnteriorTraining, 
		           DataRiscoFogoObservadoTresDiasPraFrenteTraining, RiscoFogoObservadoTresDiasPraFrenteTraining
From AnaliseQueimadasSelecionadasTraining
Order By NewId()
Go

-- Realizando a Separação dos dados para cada Group de Training -- Group2 --
Insert Into AnaliseQueimadasSelecionadasTrainingGroup2(CodigoAnaliseQueimadasSelecionadasTrainingGroup2, DataAnaliseQueimadasSelecionadasTrainingGroup2,
                                                                                               DiaSemChuvaTrainingGroup2, PrecipitacaoUmDiaAnteriorTrainingGroup2,
																				               DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup2, 
																							   RiscoFogoObservadoTresDiasPraFrenteTrainingGroup2)
Select Top (Select Count(CodigoAnaliseQueimadasSelecionadasTraining)/5 From AnaliseQueimadasSelecionadasTraining) 
                  CodigoAnaliseQueimadasSelecionadasTraining, DataAnaliseQueimadasSelecionadasTraining, DiaSemChuvaTraining, PrecipitacaoUmDiaAnteriorTraining, 
                  DataRiscoFogoObservadoTresDiasPraFrenteTraining, RiscoFogoObservadoTresDiasPraFrenteTraining
From AnaliseQueimadasSelecionadasTraining
Where CodigoAnaliseQueimadasSelecionadasTraining Not In (Select CodigoAnaliseQueimadasSelecionadasTrainingGroup1 From AnaliseQueimadasSelecionadasTrainingGroup1)
Order By NewId()
Go

-- Realizando a Separação dos dados para cada Group de Training -- Group3 --
Insert Into AnaliseQueimadasSelecionadasTrainingGroup3(CodigoAnaliseQueimadasSelecionadasTrainingGroup3, DataAnaliseQueimadasSelecionadasTrainingGroup3,
                                                                                               DiaSemChuvaTrainingGroup3, PrecipitacaoUmDiaAnteriorTrainingGroup3,
																				               DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup3, 
																							   RiscoFogoObservadoTresDiasPraFrenteTrainingGroup3)
Select Top (Select Count(CodigoAnaliseQueimadasSelecionadasTraining)/5 From AnaliseQueimadasSelecionadasTraining) 
                  CodigoAnaliseQueimadasSelecionadasTraining, DataAnaliseQueimadasSelecionadasTraining, DiaSemChuvaTraining, PrecipitacaoUmDiaAnteriorTraining, 
                  DataRiscoFogoObservadoTresDiasPraFrenteTraining, RiscoFogoObservadoTresDiasPraFrenteTraining
From AnaliseQueimadasSelecionadasTraining
Where CodigoAnaliseQueimadasSelecionadasTraining Not In (Select CodigoAnaliseQueimadasSelecionadasTrainingGroup1 From AnaliseQueimadasSelecionadasTrainingGroup1)
And  CodigoAnaliseQueimadasSelecionadasTraining Not In (Select CodigoAnaliseQueimadasSelecionadasTrainingGroup2 From AnaliseQueimadasSelecionadasTrainingGroup2)
Order By NewId()
Go

-- Realizando a Separação dos dados para cada Group de Training -- Group4 --
Insert Into AnaliseQueimadasSelecionadasTrainingGroup4(CodigoAnaliseQueimadasSelecionadasTrainingGroup4, DataAnaliseQueimadasSelecionadasTrainingGroup4,
                                                                                                DiaSemChuvaTrainingGroup4, PrecipitacaoUmDiaAnteriorTrainingGroup4,
																				                DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup4, 
																								RiscoFogoObservadoTresDiasPraFrenteTrainingGroup4)
Select Top (Select Count(CodigoAnaliseQueimadasSelecionadasTraining)/5 From AnaliseQueimadasSelecionadasTraining) 
                   CodigoAnaliseQueimadasSelecionadasTraining, DataAnaliseQueimadasSelecionadasTraining, DiaSemChuvaTraining, PrecipitacaoUmDiaAnteriorTraining, 
                   DataRiscoFogoObservadoTresDiasPraFrenteTraining, RiscoFogoObservadoTresDiasPraFrenteTraining
From AnaliseQueimadasSelecionadasTraining
Where CodigoAnaliseQueimadasSelecionadasTraining Not In (Select CodigoAnaliseQueimadasSelecionadasTrainingGroup1 From AnaliseQueimadasSelecionadasTrainingGroup1)
And  CodigoAnaliseQueimadasSelecionadasTraining Not In (Select CodigoAnaliseQueimadasSelecionadasTrainingGroup2 From AnaliseQueimadasSelecionadasTrainingGroup2)
And  CodigoAnaliseQueimadasSelecionadasTraining Not In (Select CodigoAnaliseQueimadasSelecionadasTrainingGroup3 From AnaliseQueimadasSelecionadasTrainingGroup3)
Order By NewId()
Go

-- Realizando a Separação dos dados para cada Group de Training -- Group5 --
Insert Into AnaliseQueimadasSelecionadasTrainingGroup5(CodigoAnaliseQueimadasSelecionadasTrainingGroup5, DataAnaliseQueimadasSelecionadasTrainingGroup5,
                                                                                               DiaSemChuvaTrainingGroup5, PrecipitacaoUmDiaAnteriorTrainingGroup5,
																				               DataRiscoFogoObservadoTresDiasPraFrenteTrainingGroup5, 
																							   RiscoFogoObservadoTresDiasPraFrenteTrainingGroup5)
Select Top (Select Count(CodigoAnaliseQueimadasSelecionadasTraining)/5 From AnaliseQueimadasSelecionadasTraining) 
                  CodigoAnaliseQueimadasSelecionadasTraining, DataAnaliseQueimadasSelecionadasTraining, DiaSemChuvaTraining, PrecipitacaoUmDiaAnteriorTraining, 
                  DataRiscoFogoObservadoTresDiasPraFrenteTraining, RiscoFogoObservadoTresDiasPraFrenteTraining
From AnaliseQueimadasSelecionadasTraining
Where CodigoAnaliseQueimadasSelecionadasTraining Not In (Select CodigoAnaliseQueimadasSelecionadasTrainingGroup1 From AnaliseQueimadasSelecionadasTrainingGroup1)
And  CodigoAnaliseQueimadasSelecionadasTraining Not In (Select CodigoAnaliseQueimadasSelecionadasTrainingGroup2 From AnaliseQueimadasSelecionadasTrainingGroup2)
And  CodigoAnaliseQueimadasSelecionadasTraining Not In (Select CodigoAnaliseQueimadasSelecionadasTrainingGroup3 From AnaliseQueimadasSelecionadasTrainingGroup3)
And  CodigoAnaliseQueimadasSelecionadasTraining Not In (Select CodigoAnaliseQueimadasSelecionadasTrainingGroup4 From AnaliseQueimadasSelecionadasTrainingGroup4)
Order By NewId()
Go

-- Consultando os dados inseridos nos Training Groups --
Select * From AnaliseQueimadasSelecionadasTrainingGroup1
Select * From AnaliseQueimadasSelecionadasTrainingGroup2
Select * From AnaliseQueimadasSelecionadasTrainingGroup3
Select * From AnaliseQueimadasSelecionadasTrainingGroup4
Select * From AnaliseQueimadasSelecionadasTrainingGroup5
Go

-- Carregando os dados no arquivo de Testing --
-- AnaliseQueimadasSelecionadasTesting - DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, Chuva, Queimada --
Declare @BCPComando Varchar(500)
Set @BCPComando='bcp "Select DiaSemChuvaTesting, PrecipitacaoUmDiaAnteriorTesting, RiscoFogoObservadoTresDiasPraFrenteTesting From ProjetoDWQueimadas..AnaliseQueimadasSelecionadasTesting" queryout "P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo6-Conteudo-ANFIS-ValidacaoCruzada-Testing.txt" -c -UTF8 -T -SWIN10PRO\WIN10PROSQL2019'
Exec master..xp_cmdshell @BCPComando, No_Output
Print 'Arquivo: Modelo6-Conteudo-ANFIS-ValidacaoCruzada-Testing.txt criado.'
Go

-- Carregando os dados no arquivo de CheckingGroup1 -- Tabela TrainingGroup1 --
-- AnaliseQueimadasSelecionadasTraining - DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, Chuva, Queimada, RiscoFogoObservadoTresDiasPraFrente --
Declare @BCPComando Varchar(500)
Set @BCPComando='bcp "Select DiaSemChuvaTrainingGroup1, PrecipitacaoUmDiaAnteriorTrainingGroup1, RiscoFogoObservadoTresDiasPraFrenteTrainingGroup1 From ProjetoDWQueimadas..AnaliseQueimadasSelecionadasTrainingGroup1" queryout "P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo6-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup1.txt" -c -UTF8 -T -SWIN10PRO\WIN10PROSQL2019'
Exec master..xp_cmdshell @BCPComando, No_Output
Print 'Arquivo: Modelo6-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup1.txt criado.'
Go

-- Montando e Inserindo o conteúdo para o TrainingGroup2345 -- Checking TrainingGroup1 --
Insert Into AnaliseQueimadasSelecionadasTrainingGroup2345 
Select * From AnaliseQueimadasSelecionadasTrainingGroup2
Union All
Select * From AnaliseQueimadasSelecionadasTrainingGroup3
Union All
Select * From AnaliseQueimadasSelecionadasTrainingGroup4
Union All
Select * From AnaliseQueimadasSelecionadasTrainingGroup5
Go

-- Carregando os dados no arquivo de TrainingGroup2345 --
-- AnaliseQueimadasSelecionadasTraining - DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, Chuva, Queimada, RiscoFogoObservadoTresDiasPraFrente --
Declare @BCPComando Varchar(500)
Set @BCPComando='bcp "Select DiaSemChuvaTrainingGroup2345, PrecipitacaoUmDiaAnteriorTrainingGroup2345, RiscoFogoObservadoTresDiasPraFrenteTrainingGroup2345 From ProjetoDWQueimadas..AnaliseQueimadasSelecionadasTrainingGroup2345" queryout "P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo6-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup2345.txt" -c -UTF8 -T -SWIN10PRO\WIN10PROSQL2019'
Exec master..xp_cmdshell @BCPComando, No_Output
Print 'Arquivo: Modelo6-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup2345.txt criado.'
Go

-- Carregando os dados no arquivo de CheckingGroup2 -- Tabela TrainingGroup2 --
-- AnaliseQueimadasSelecionadasTraining - DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, Chuva, Queimada, RiscoFogoObservadoTresDiasPraFrente --
Declare @BCPComando Varchar(500)
Set @BCPComando='bcp "Select DiaSemChuvaTrainingGroup2, PrecipitacaoUmDiaAnteriorTrainingGroup2, RiscoFogoObservadoTresDiasPraFrenteTrainingGroup2 From ProjetoDWQueimadas..AnaliseQueimadasSelecionadasTrainingGroup2" queryout "P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo6-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup2.txt" -c -UTF8 -T -SWIN10PRO\WIN10PROSQL2019'
Exec master..xp_cmdshell @BCPComando, No_Output
Print 'Arquivo: Modelo6-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup2.txt criado.'
Go

-- Montando e Inserindo o conteúdo para o TrainingGroup1345 -- Checking TrainingGroup2 --
Insert Into AnaliseQueimadasSelecionadasTrainingGroup1345
Select * From AnaliseQueimadasSelecionadasTrainingGroup1
Union All
Select * From AnaliseQueimadasSelecionadasTrainingGroup3
Union All
Select * From AnaliseQueimadasSelecionadasTrainingGroup4
Union All
Select * From AnaliseQueimadasSelecionadasTrainingGroup5
Go

-- Carregando os dados no arquivo de TrainingGroup1345 --
-- AnaliseQueimadasSelecionadasTraining - DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, Chuva, Queimada, RiscoFogoObservadoTresDiasPraFrente --
Declare @BCPComando Varchar(500)
Set @BCPComando='bcp "Select DiaSemChuvaTrainingGroup1345, PrecipitacaoUmDiaAnteriorTrainingGroup1345, RiscoFogoObservadoTresDiasPraFrenteTrainingGroup1345 From ProjetoDWQueimadas..AnaliseQueimadasSelecionadasTrainingGroup1345" queryout "P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo6-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup1345.txt" -c -UTF8 -T -SWIN10PRO\WIN10PROSQL2019'
Exec master..xp_cmdshell @BCPComando, No_Output
Print 'Arquivo: Modelo6-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup1345.txt criado.'
Go

-- Carregando os dados no arquivo de CheckingGroup3 -- Tabela TrainingGroup3 --
-- AnaliseQueimadasSelecionadasTraining - DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, Chuva, Queimada, RiscoFogoObservadoTresDiasPraFrente --
Declare @BCPComando Varchar(500)
Set @BCPComando='bcp "Select DiaSemChuvaTrainingGroup3, PrecipitacaoUmDiaAnteriorTrainingGroup3, RiscoFogoObservadoTresDiasPraFrenteTrainingGroup3 From ProjetoDWQueimadas..AnaliseQueimadasSelecionadasTrainingGroup3" queryout "P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo6-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup3.txt" -c -UTF8 -T -SWIN10PRO\WIN10PROSQL2019'
Exec master..xp_cmdshell @BCPComando, No_Output
Print 'Arquivo: Modelo6-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup3.txt criado.'
Go

-- Montando e Inserindo o conteúdo para o TrainingGroup1245 -- Checking TrainingGroup3 --
Insert Into AnaliseQueimadasSelecionadasTrainingGroup1245
Select * From AnaliseQueimadasSelecionadasTrainingGroup1
Union All
Select * From AnaliseQueimadasSelecionadasTrainingGroup2
Union All
Select * From AnaliseQueimadasSelecionadasTrainingGroup4
Union All
Select * From AnaliseQueimadasSelecionadasTrainingGroup5
Go

-- Carregando os dados no arquivo de TrainingGroup1245 --
-- AnaliseQueimadasSelecionadasTraining - DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, Chuva, Queimada, RiscoFogoObservadoTresDiasPraFrente --
Declare @BCPComando Varchar(500)
Set @BCPComando='bcp "Select DiaSemChuvaTrainingGroup1245, PrecipitacaoUmDiaAnteriorTrainingGroup1245, RiscoFogoObservadoTresDiasPraFrenteTrainingGroup1245 From ProjetoDWQueimadas..AnaliseQueimadasSelecionadasTrainingGroup1245" queryout "P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo6-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup1245.txt" -c -UTF8 -T -SWIN10PRO\WIN10PROSQL2019'
Exec master..xp_cmdshell @BCPComando, No_Output
Print 'Arquivo: Modelo6-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup1245.txt criado.'
Go

-- Carregando os dados no arquivo de CheckingGroup4 -- Tabela TrainingGroup4 --
-- AnaliseQueimadasSelecionadasTraining - DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, Chuva, Queimada, RiscoFogoObservadoTresDiasPraFrente --
Declare @BCPComando Varchar(500)
Set @BCPComando='bcp "Select DiaSemChuvaTrainingGroup4, PrecipitacaoUmDiaAnteriorTrainingGroup4, RiscoFogoObservadoTresDiasPraFrenteTrainingGroup4 From ProjetoDWQueimadas..AnaliseQueimadasSelecionadasTrainingGroup4" queryout "P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo6-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup4.txt" -c -UTF8 -T -SWIN10PRO\WIN10PROSQL2019'
Exec master..xp_cmdshell @BCPComando, No_Output
Print 'Arquivo: Modelo6-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup4.txt criado.'
Go

-- Montando e Inserindo o conteúdo para o TrainingGroup1235 -- Checking TrainingGroup4 --
Insert Into AnaliseQueimadasSelecionadasTrainingGroup1235 
Select * From AnaliseQueimadasSelecionadasTrainingGroup1
Union All
Select * From AnaliseQueimadasSelecionadasTrainingGroup2
Union All
Select * From AnaliseQueimadasSelecionadasTrainingGroup3
Union All
Select *From AnaliseQueimadasSelecionadasTrainingGroup5
Go

-- Carregando os dados no arquivo de TrainingGroup1235 --
-- AnaliseQueimadasSelecionadasTraining - DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, Chuva, Queimada, RiscoFogoObservadoTresDiasPraFrente --
Declare @BCPComando Varchar(500)
Set @BCPComando='bcp "Select DiaSemChuvaTrainingGroup1235, PrecipitacaoUmDiaAnteriorTrainingGroup1235, RiscoFogoObservadoTresDiasPraFrenteTrainingGroup1235 From ProjetoDWQueimadas..AnaliseQueimadasSelecionadasTrainingGroup1235" queryout "P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo6-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup1235.txt" -c -UTF8 -T -SWIN10PRO\WIN10PROSQL2019'
Exec master..xp_cmdshell @BCPComando, No_Output
Print 'Arquivo: Modelo6-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup1235.txt criado.'
Go

-- Carregando os dados no arquivo de CheckingGroup5 -- Tabela TrainingGroup5 --
-- AnaliseQueimadasSelecionadasTraining - DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, Chuva, Queimada, RiscoFogoObservadoTresDiasPraFrente --
Declare @BCPComando Varchar(500)
Set @BCPComando='bcp "Select DiaSemChuvaTrainingGroup5, PrecipitacaoUmDiaAnteriorTrainingGroup5, RiscoFogoObservadoTresDiasPraFrenteTrainingGroup5 From ProjetoDWQueimadas..AnaliseQueimadasSelecionadasTrainingGroup5" queryout "P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo6-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup5.txt" -c -UTF8 -T -SWIN10PRO\WIN10PROSQL2019'
Exec master..xp_cmdshell @BCPComando, No_Output
Print 'Arquivo: Modelo6-Conteudo-ANFIS-ValidacaoCruzada-CheckingGroup5.txt criado.'
Go

-- Montando e Inserindo o conteúdo para o TrainingGroup1234 -- Checking TrainingGroup5 --
Insert Into AnaliseQueimadasSelecionadasTrainingGroup1234
Select * From AnaliseQueimadasSelecionadasTrainingGroup1
Union All
Select * From AnaliseQueimadasSelecionadasTrainingGroup2
Union All
Select * From AnaliseQueimadasSelecionadasTrainingGroup3
Union All
Select * From AnaliseQueimadasSelecionadasTrainingGroup4
Go

-- Carregando os dados no arquivo de TrainingGroup1234 --
-- AnaliseQueimadasSelecionadasTraining - DiaSemChuva, PrecipitacaoUmDiaAnterior, AcumuladoPrecipitacaoTresDiasAnteriores, Chuva, Queimada, RiscoFogoObservadoTresDiasPraFrente --
Declare @BCPComando Varchar(500)
Set @BCPComando='bcp "Select DiaSemChuvaTrainingGroup1234, PrecipitacaoUmDiaAnteriorTrainingGroup1234, RiscoFogoObservadoTresDiasPraFrenteTrainingGroup1234 From ProjetoDWQueimadas..AnaliseQueimadasSelecionadasTrainingGroup1234" queryout "P:\Projeto - ICRQB\4 - Dados\Modelos\Modelo6-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup1234.txt" -c -UTF8 -T -SWIN10PRO\WIN10PROSQL2019'
Exec master..xp_cmdshell @BCPComando, No_Output
Print 'Arquivo: Modelo6-Conteudo-ANFIS-ValidacaoCruzada-TrainingGroup1234.txt criado.'
Go

-- Consultando os dados inseridos nos Training Groups --
Select * From AnaliseQueimadasSelecionadasTrainingGroup2345
Select * From AnaliseQueimadasSelecionadasTrainingGroup1345
Select * From AnaliseQueimadasSelecionadasTrainingGroup1245
Select * From AnaliseQueimadasSelecionadasTrainingGroup1235
Select * From AnaliseQueimadasSelecionadasTrainingGroup1234
Go