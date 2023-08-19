-- Acessando o Banco de Dados --
Use ProjetoDWQueimadas
Go

-- Criando a Tabela Calendario --
Create Table Calendario
(CodigoCalendario Int Primary Key Identity(1,1),
 Data DateTime)
Go

-- Inserindo as Datas na Tabela Calendario --
Insert Into Calendario (Data)
Select Distinct Format(DataHora,'yyyy/MM/dd') As Data From Queimadas1999x2021
Where DataHora Between '2018-01-01' And '2020-12-31'
Go

-- Criando a Tabela DatasSemChuvaOuQueimadas --
Create Table DatasSemChuvaOuQueimadas
(CodigoDatasSemChuvaOuQueimadas Int Identity(1,1) Primary Key Clustered,
 DataDatasSemChuvaOuQueimadas Date)
Go

-- Indicador 1 - Registro de Queimadas(INPE) para o Município de Sorocaba entre os anos de 2018 e 2020 --
Select Distinct Convert(Date, DataHora) As Data, DiaSemChuva, Precipitacao As PrecipitacaoINPE, RiscoFogo 
From Queimadas1999x2021
Where Municipio = 'Sorocaba'
And DataHora Between '2018-01-01' And '2020-12-31'
Order By Data
Go

-- Indicador 2 - Registro de Precipitação(ANA) para o Município de Sorocaba entre os anos de 2018 e 2020 --
Select DataPrecipitacao, 0 As DiaSemChuva, ValorPrecipitacao, 0 As Risco 
From VolumePrecipitacao2018x2020
Where DataPrecipitacao Between '2018-01-01' And '2020-12-31'
And ValorPrecipitacao >0
Order By DataPrecipitacao
Go

-- Indicador 3 - Registro de Precipitação(ANA) e Registro de Queimadas(INPE) para o Município de Sorocaba entre os anos de 2018 e 2020 --
Select Distinct V.DataPrecipitacao, 0 As DiaSemChuva, V.ValorPrecipitacao, 0 As Risco, 
           Convert(Date,Q.DataHora) As DataINPE, Q.DiaSemChuva As DiaSemChuvaINPE, Q.Precipitacao As ValorPrecipitacaoINPE, Q.RiscoFogo As RiscoFogoINPE
From VolumePrecipitacao2018x2020 V Inner Join Queimadas1999x2021 Q
															    On V.DataPrecipitacao = Convert(Date, Q.DataHora)
																And Q.Municipio='Sorocaba'
																And Q.DataHora Between '2018-01-01' And '2020-12-31'
Where V.DataPrecipitacao Between '2018-01-01' And '2020-12-31'
And V.ValorPrecipitacao >0
Order By V.DataPrecipitacao
Go

-- Indicador 4 - Sem Registro de Precipitação(ANA) e Sem Registro de Queimadas(INPE) para o Município de Sorocaba entre os anos de 2018 e 2020 --
;With CTERegistroQueimadasXChuvas
As
(
-- Indicador 1 - Registro de Queimadas(INPE) para o Município de Sorocaba entre os anos de 2018 e 2020 --
Select Distinct Convert(Date, DataHora) As Data From Queimadas1999x2021
Where Municipio = 'Sorocaba'
And DataHora Between '2018-01-01' And '2020-12-31'

Union 

-- Indicador 2 - Registro de Precipitação(ANA) para o Município de Sorocaba entre os anos de 2018 e 2020 --
Select DataPrecipitacao From VolumePrecipitacao2018x2020
Where DataPrecipitacao Between '2018-01-01' And '2020-12-31'
And ValorPrecipitacao >0

Union

-- Indicador 3 - Registro de Precipitação(ANA) e Registro de Queimadas(INPE) para o Município de Sorocaba entre os anos de 2018 e 2020 --
Select Distinct V.DataPrecipitacao
From VolumePrecipitacao2018x2020 V Inner Join Queimadas1999x2021 Q
															    On V.DataPrecipitacao = Convert(Date, Q.DataHora)
																And Q.Municipio='Sorocaba'
																And Q.DataHora Between '2018-01-01' And '2020-12-31'
Where V.DataPrecipitacao Between '2018-01-01' And '2020-12-31'
And V.ValorPrecipitacao >0
)
-- Armazenando as Datas que não apresentam Chuva ou Queimadas na Tabela DatasSemChuvaOuQueimadas --
Insert Into DatasSemChuvaOuQueimadas (DataDatasSemChuvaOuQueimadas)
Select Data From Calendario
Where Data Not In (Select Data From CTERegistroQueimadasXChuvas)
Order By Data
Go