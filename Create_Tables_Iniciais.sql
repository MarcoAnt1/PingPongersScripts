USE PingPongers
GO

IF EXISTS(SELECT * FROM sys.tables WHERE SCHEMA_NAME(schema_id) LIKE 'dbo' AND name like 'GrupoAcesso')  
   DROP TABLE [dbo].[GrupoAcesso];  
GO

CREATE TABLE GrupoAcesso (
	Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Codigo VARCHAR(255) NOT NULL,
	DataInclusao DATETIME NOT NULL,
	DataAlteracao DATETIME
);
GO

IF EXISTS(SELECT * FROM sys.tables WHERE SCHEMA_NAME(schema_id) LIKE 'dbo' AND name like 'Usuario')  
   DROP TABLE [dbo].[Usuario];  
GO

CREATE TABLE Usuario (
	Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Codigo VARCHAR(255) NOT NULL,
	Nome VARCHAR(255) NOT NULL,
	Idade INT,
	DataInclusao DATETIME NOT NULL,
	DataAlteracao DATETIME,
	IdGrupoAcesso INT NOT NULL,
	CONSTRAINT FK_GrupoAcesso FOREIGN KEY (IdGrupoAcesso) REFERENCES GrupoAcesso(Id)
);
GO

IF EXISTS(SELECT * FROM sys.tables WHERE SCHEMA_NAME(schema_id) LIKE 'dbo' AND name like 'AgendamentoAula')  
   DROP TABLE [dbo].[AgendamentoAula];  
GO

CREATE TABLE AgendamentoAula (
	Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Status VARCHAR(255) NOT NULL,
	Nota VARCHAR(1024),
	DataAgendamento DATETIME NOt NULL,
	DataInclusao DATETIME NOT NULL,
	DataAlteracao DATETIME,
	IdUsuario INT NOT NULL,
	CONSTRAINT FK_Usuario FOREIGN KEY (IdUsuario) REFERENCES Usuario(Id)
);