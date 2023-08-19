-- Acessando o Banco de Dados --
Use ProjetoDWQueimadas
Go

-- Indicador 1 - Registro de Queimadas(INPE) para o Município de Sorocaba entre os anos de 2018 e 2020 --
Select Q.DiaSemChuva, IsNull(Lag(Q.Precipitacao,1) Over (Partition By Q.Municipio Order By Q.DataHora),0) As PrecipitacaoUmDiaAntes,
           (Select Sum(ValorPrecipitacao) From VolumePrecipitacao2018x2020 V
            Where V.DataPrecipitacao  >= DateAdd(day,-3,Q.DataHora) 
			And V.DataPrecipitacao <= Q.DataHora) As PrecipitacaoAcumulada3DiasAnteriores,
           0 As Chuva,
		   1 As Queimada
From Queimadas1999x2020 Q
Where Municipio = 'Sorocaba'
And DataHora Between '2018-01-01' And '2020-12-31'
Order By DataHora Desc
Go

-- Indicador 2 - Registro de Precipitação(ANA) para o Município de Sorocaba entre os anos de 2018 e 2020 --
Select 0 As DiaSemChuva, IsNull(Lag(ValorPrecipitacao,1) Over (Order By DataPrecipitacao),0) As PrecipitacaoUmDiaAntes,
		   P.AcumuladoPrecipitacao3DiasAnteriores,
           1 As Chuva,
		   0 As Queimada
From VolumePrecipitacao2018x2020 V Cross Apply (Select Sum(ValorPrecipitacao) From VolumePrecipitacao2018x2020
                                                                                     Where DataPrecipitacao >= DateAdd(Day,-3,V.DataPrecipitacao)
																					 And DataPrecipitacao <= V.DataPrecipitacao
																					 ) As P(AcumuladoPrecipitacao3DiasAnteriores)
Where DataPrecipitacao Between '2018-01-01' And '2018-01-30'
And ValorPrecipitacao >0
Order By DataPrecipitacao Asc
Go

-- Indicador 3 - Registro de Precipitação(ANA) e Registro de Queimadas(INPE) para o Município de Sorocaba entre os anos de 2018 e 2020 --
Select Q.DiaSemChuva, V.ValorPrecipitacao, IsNull(Lag(Q.Precipitacao,1) Over (Partition By Q.Municipio Order By Q.DataHora),0) As PrecipitacaoUmDiaAntes,
           (Select Sum(ValorPrecipitacao) From VolumePrecipitacao2018x2020
            Where DataPrecipitacao  >= DateAdd(day,-3,V.DataPrecipitacao) 
			And DataPrecipitacao <= V.DataPrecipitacao) As PrecipitacaoAcumulada3DiasAnteriores,
           1 As Chuva,
		   1 As Queimada
From VolumePrecipitacao2018x2020 V Inner Join Queimadas1999x2020 Q
															    On V.DataPrecipitacao = Convert(Date, Q.DataHora)
																And Q.Municipio='Sorocaba'
															    And Q.DataHora Between '2018-01-01' And '2020-12-31'
Where V.DataPrecipitacao Between '2018-01-01' And '2020-12-31'
And V.ValorPrecipitacao >0
Order By Q.DataHora Asc
Go

-- Indicador 4 - Sem Registro de Precipitação(ANA) e Sem Registro de Queimadas(INPE) para o Município de Sorocaba entre os anos de 2018 e 2020 --
Select 0 As DiaSemChuva, 
		   V.ValorPrecipitacao,
		   P.PrecipitacaoAculumada3DiaAnteriores,
           0 As Chuva,
		   0 As Queimada
From DatasSemChuvaOuQueimadas C Inner Join VolumePrecipitacao2018x2020 V
                                                                                   On V.DataPrecipitacao = DateAdd(Day,-1,C.DataDatasSemChuvaOuQueimadas)
																				  Cross Apply (Select Sum(ValorPrecipitacao) From VolumePrecipitacao2018x2020
                                                                                                       Where DataPrecipitacao  >= DateAdd(day,-3,C.DataDatasSemChuvaOuQueimadas)
																									   	And DataPrecipitacao <= C.DataDatasSemChuvaOuQueimadas) As P(PrecipitacaoAculumada3DiaAnteriores)
 Order By C.DataDatasSemChuvaOuQueimadas
Go

