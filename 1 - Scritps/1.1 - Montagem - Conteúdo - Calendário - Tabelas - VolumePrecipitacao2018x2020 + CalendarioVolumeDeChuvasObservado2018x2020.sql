-- Criando a Tabela VolumePrecipitacao2018x2020 --
Create Table VolumePrecipitacao2018x2020
(CodigoVolumePrecipitacao Int Primary Key Identity(1,1),
 DataPrecipitacao Date,
 ValorPrecipitacao Float,
 TotalDiasComChuva Float,
 ValorDaMaxima Float,
 Ano SmallInt,
 Mes TinyInt,
 DiaMaxima TinyInt,
 Acumulado3Dias Float,
 Acumulado5Dias Float,
 Acumulado10Dias Float,
 Acumulado15Dias Float,
 Acumulado20Dias Float,
 Acumulado25Dias Float,
 Acumula30Dias Float,
 TotalAcumuladoNoMes Float)
Go

-- Realizar a importação do Calendário de Chuvas --

-- Adicionando as colunas Ano e Mes na Tabela CalendarioVolumeDeChuvasObservado2018x2020 --
Alter Table CalendarioVolumeDeChuvasObservado2018x2020
 Add Ano As (Year(Data)),
        Mes As (Month(Data))
Go

-- Adicionando as Colunas referente aos valores acumulados dos dias com chuva na Tabela CalendarioVolumeDeChuvasObservado2018x2020 --
Alter Table CalendarioVolumeDeChuvasObservado2018x2020
Add  Acumulado3 As (Dia01+Dia02+Dia03),
        Acumulado5 As (Dia01+Dia02+Dia03+Dia04+Dia05), 
		Acumulado10 As (Dia01+Dia02+Dia03+Dia04+Dia05+Dia06+Dia07+Dia08+Dia09+Dia10), 
		Acumulado15 As (Dia01+Dia02+Dia03+Dia04+Dia05+Dia06+Dia07+Dia08+Dia09+Dia10+Dia11+Dia12+Dia13+Dia14+Dia15), 
		Acumulado20 As (Dia01+Dia02+Dia03+Dia04+Dia05+Dia06+Dia07+Dia08+Dia09+Dia10+Dia11+Dia12+Dia13+Dia14+Dia15+Dia16+Dia17+Dia18+Dia19+Dia20),
		Acumulado25 As (Dia01+Dia02+Dia03+Dia04+Dia05+Dia06+Dia07+Dia08+Dia09+Dia10+Dia11+Dia12+Dia13+Dia14+Dia15+Dia16+Dia17+Dia18+Dia19+Dia20+Dia21+Dia22+Dia23+Dia24+Dia25),
		Acumulado30 As (Dia01+Dia02+Dia03+Dia04+Dia05+Dia06+Dia07+Dia08+Dia09+Dia10+Dia11+Dia12+Dia13+Dia14+Dia15+Dia16+Dia17+Dia18+Dia19+Dia20+Dia21+Dia22+Dia23+Dia24+Dia25+Dia26+Dia27+Dia28+Dia29+Dia30),
		TotalAcumuladoNoMes As (Dia01+Dia02+Dia03+Dia04+Dia05+Dia06+Dia07+Dia08+Dia09+Dia10+Dia11+Dia12+Dia13+Dia14+Dia15+Dia16+Dia17+Dia18+Dia19+Dia20+Dia21+Dia22+Dia23+Dia24+Dia25+Dia26+Dia27+Dia28+Dia29+Dia30+Dia31)
Go
