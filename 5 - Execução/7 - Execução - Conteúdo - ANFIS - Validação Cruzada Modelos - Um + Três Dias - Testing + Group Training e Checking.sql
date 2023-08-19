-- Acessando o Banco de Dados --
Use ProjetoDWQueimadas
Go

-- Gerando um delay de 2 segundos --
Waitfor Delay '00:00:02'
Go

-- Executando a Stored Procedure P_PrepararAmbienteModelos1Dia --
Exec P_PrepararAmbienteModelos1Dia
Go

-- Executando o Processamento da ValidaoCruzada - Modelos - Um Dia de Predição --
Exec P_ValidacaoCruzadaModelo1UmDia
Go

-- Executando a Stored Procedure P_PrepararAmbienteModelos1Dia --
Exec P_PrepararAmbienteModelos1Dia
Go

Exec P_ValidacaoCruzadaModelo2UmDia
Go

-- Executando a Stored Procedure P_PrepararAmbienteModelos1Dia --
Exec P_PrepararAmbienteModelos1Dia
Go

Exec P_ValidacaoCruzadaModelo3UmDia
Go

-- Gerando um delay de 2 segundos --
Waitfor Delay '00:00:02'
Go

-- Executando a Stored Procedure P_PrepararAmbienteModelos1Dia --
Exec P_PrepararAmbienteModelos3Dias
Go

-- Executando o Processamento da ValidaoCruzada - Modelos - Três Dias de Predição --
Exec P_ValidacaoCruzadaModelo4TresDias
Go

-- Executando a Stored Procedure P_PrepararAmbienteModelos1Dia --
Exec P_PrepararAmbienteModelos3Dias
Go

Exec P_ValidacaoCruzadaModelo5TresDias
Go

-- Executando a Stored Procedure P_PrepararAmbienteModelos1Dia --
Exec P_PrepararAmbienteModelos3Dias
Go

Exec P_ValidacaoCruzadaModelo6TresDias
Go