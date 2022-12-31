USE [PingPongers]
GO

INSERT INTO [dbo].[GrupoAcesso]
        ([Codigo]
       ,[DataInclusao])
     SELECT
		'SUPER'
        ,GETDATE()
	WHERE NOT EXISTS
        (SELECT 1 FROM [dbo].[GrupoAcesso] WHERE Codigo = 'SUPER')
GO

INSERT INTO [dbo].[GrupoAcesso]
        ([Codigo]
       ,[DataInclusao])
     SELECT
		'FUNCIONARIO'
        ,GETDATE()
	WHERE NOT EXISTS
        (SELECT 1 FROM [dbo].[GrupoAcesso] WHERE Codigo = 'FUNCIONARIO')
GO

INSERT INTO [dbo].[GrupoAcesso]
        ([Codigo]
       ,[DataInclusao])
     SELECT
		'ALUNO'
        ,GETDATE()
	WHERE NOT EXISTS
        (SELECT 1 FROM [dbo].[GrupoAcesso] WHERE Codigo = 'ALUNO')
GO