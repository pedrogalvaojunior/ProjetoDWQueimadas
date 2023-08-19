-- Acessando --
Use ProjetoDWQueimadas
Go

-- Criando a Tabela --
CREATE TABLE dbo.Queimadas2018x2020Sorocaba(
	CodigoQueimada int IDENTITY(1,1) NOT NULL,
	DataHora date NOT NULL,
	Satelite varchar(10) NOT NULL,
	Pais char(6) NOT NULL,
	Estado varchar(20) NOT NULL,
	Municipio varchar(40) NOT NULL,
	Bioma varchar(15) NOT NULL,
	DiaSemChuva int NOT NULL,
	Precipitacao float NOT NULL,
	RiscoFogo float NOT NULL,
	Latitude decimal(10, 5) NOT NULL,
	Longitude decimal(10, 5) NOT NULL,
	AreaIndu varchar(50) NULL,
	FRP varchar(50) NULL,
	LongitudeAproximada  AS (round(Longitude,(2))),
	LatitudeAproximada  AS (round(Latitude,(2))),
 CONSTRAINT PK_CodigoQueimada_Queimadas2018x2020Sorocaba PRIMARY KEY CLUSTERED 
(
	CodigoQueimada ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [ProjetoDWQueimadas-Secundary-Data]
) ON [ProjetoDWQueimadas-Secundary-Data]
Go

-- Inserindo --
Insert Into Queimadas2018x2020Sorocaba (DataHora, Satelite, Pais, Estado, Municipio, Bioma, DiaSemChuva, Precipitacao, RiscoFogo, Latitude, Longitude, AreaIndu, FRP)
Select DataHora, Satelite, Pais, Estado, Municipio, Bioma, DiaSemChuva, Precipitacao, RiscoFogo, Latitude, Longitude, AreaIndu, FRP
From Queimadas1999x2021
Where Municipio='SOROCABA'
And DataHora Between '2018-01-01' And '2020-12-31'
Go
