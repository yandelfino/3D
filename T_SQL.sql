-- SQL SERVER

-- Lista completa de comandos no CCMD
 sqlcmd -?

-- Conectar-se com o servidor do banco
 sqlcmd -S CSCBRAC039012\SQLEXPRESS -E
 sqlcmd -S sqladmin\instance_name -E
 select @@version
 
-- Executa o comando previamente descrito
 GO
 GO 10
 
-- Instrui para qual banco os comandos na sequencia serão destinados
 USE nome_DB
 
-- Comando que exibe informações relevantes sobre o banco de dados[
 sp_helpDb Nome_DB
 
-- Movimentando Bancos msdb, tempbd e model
 Execute a ALTER DATABASE ... MODIFY FILE
 
-- Movimentando Banco Master
 Caderno
 
-- Log de erros do servidor
 sp_readerrorlog
 
-- 

 
 Comandos iniciais database   (
	 
	-- Cria um database
	  CREATE DATABASE Nome_Banco;
	  ON
	 (NAME = Vendas_dat,
	  FILENAME = 'C:\Users\Yan Delfino\Documents\Sequel\Vendas.mdf',
	  SIZE=6MB,
	  MAXSIZE = 00MB,
	  FILEGROWTH = 10%)
	 GO
	 
	 
	-- Cria um database e especifica seus arquivos e filegroups 
		 CREATE DATABASE bd_ComNdf
		 ON PRIMARY
		 (NAME=N'Nome_logico', FILENAME=N'C:\SQLuse\Nome_Fisico0.MDF', SIZE=50,MAXSIZE=UNLIMITED, FILEGROWTH=10MB),
		 FILEGROUP [Nome_filegroup]  --FileGroup dos arquivos que serão inseridos
		 (NAME=N'Nome_logico1', FILENAME=N'C:\SQLuse\Nome_Fisico1.NDF', SIZE=50,MAXSIZE=UNLIMITED, FILEGROWTH=10MB), --Arquivos criados para o database	
		 (NAME=N'Nome_logico2', FILENAME=N'C:\SQLuse\Nome_Fisico2.NDF', SIZE=50,MAXSIZE=UNLIMITED, FILEGROWTH=10MB)
		 LOG ON
		 (NAME=N'Nome_logicoLog', FILENAME=N'C:\SQLuse\Nome_FisicoLog.LDF', SIZE=30,MAXSIZE=UNLIMITED, FILEGROWTH=10%)
		GO

	-- Chama o database que será utilizado
	 USE Nome_Banco
	 
	-- Deleta o Banco
	 DROP DATABASE Nome_Banco
	 GO 
	 	 
)
	 
 Alguns comandos usando PWSH   (
	 
	-- ([PWSH] Visualizar processos
	 Get-Process SQL*	

 )
 
 Comandos de Alteração de banco (
 
	--Alterando Opções de comportamento do banco
	ALTER DATABASE Nome_DB
	SET READ ONLY
	
	--Alterando a compatibilidade com bancos anteriores 
	ALTER DATABASE Nome_DB
	SET COMPATIBILITY_LEVEL = 100;
	
	--Adicionando espaço a um banco (Adicionando um novo arquivo)
	ALTER DATABASE Nome_bd ADD FILE
	
	--Adicionando espaço a um banco (Expandindo a capacidade do banco)
	ALTER DATABASE Nome_bd MAXSIZE
	
	--Excluindo arquivos de banco
	DBCC SHRINKFILE... EMPTYFILE
		
 )
 
  Comandos para controle do banco de dados (
  
	-- Setando o estado do banco 
	 ALTER DATABASE Nome_Banco SET OFFLINE
	 GO
	 
	 ALTER DATABASE Nome_Banco SET ONLINE
	 GO
	 
	-- Eliminas os usuarios pendurados no banco
	 WITH ROLLBACK IMMEDIATE
	 GO
	 
  
  )
   
 Comandos de Alteração de Tabela (	 
	 
	-- Adiciona uma linha na tabela
	 ALTER TABLE tbl_Livro ADD Id_Autor SMALLINT NOT NULL,
	 
	-- Remove uma linha na tabela 
	 ALTER TABLE tbl_name DROP COLUMN nome_coluna
	 
	-- Adicionar PK na coluna
	 ALTER TABLE tbl_name ADD PRIMARY KEY (Id_daTabela)
	 
	-- Alterar as propriedades de uma coluna 
	 ALTER TABLE tbl_Autores ALTER COLUMN Id_Autores IDENTITY 
	 
	-- Alterando os dados da tabela  
	 UPDATE Nome_Tbl SET nome_coluna = novo_Valor 
	 WHERE Resultado_Anterior;
	
	-- Alterando os dados da tabela 2
  	 UPDATE DEPARTAMENTO
	 SET NOME = "HELBERT CARVALHO",SALARIO = 1000
	 WHERE CODIGO = 1
	 
	-- Alterando os dados da tabela com SELECT
	 UPDATE EMPREGADOS
	 SET SALARIO = salario * 1.1
	 WHERE SALARIO = (SELECT MIN(salario) FROM EMPREGADOS)
	 
	 -- Deleta os dados da tabela
	 DELETE FROM Nome_tbl WHERE nome_coluna =  condição
	 
	-- Criando uma tabela com um schema alternativo
	 CREATE DATABASE Nome_Schema.Nome_Database

	)
 
 Criar Tabela                    (
 
    -- Criar tabela simples
	 CREATE TABLE Produtos
	 (Id Int PRIMARY KEY,
	 Nome VARCHAR(20),
	 Preco DECIMAL);
	 
 )
 
 Inserir valores em uma tabela   (

    -- Inserir valor na tabela 
	 INSERT INTO Nome_Tabela (Coluna1, Coluna2)
	 VALUES (Valor1, Valor2);	
	 
	 INSERT INTO Nome_Tabela (id, Produto, Preço)
	 VALUES (1, 'Telefone', 22.10);
 
 )
 
 Cominicação entre tabelas       (
 
    -- Chave estrangeira
	 CONSTRAINTS fk_Nome_Dela FOREIGN KEY(Coluna_Recebe)
	 REFERENCES tbl_Que_temATabela(Coluna_Recebe)
	 
	 CONSTRAINT fk_Id_Autor FOREIGN KEY(ID_Autor) REFERENCES tbl_Autores
	   
 )
 
 Controle de Schemas (
 
	-- Criando um Schemas
	 CREATE SCHEMA Nome_Schema
	 GO
	 
	-- Alterando o schema de uma tabela
	 ALTER SCHEMA Novo_Schema
	 TRANSFER Schema_Antigo.Tabela
	 GO
	 
 )
 
 Comandos de busca (SELECT)      (
 
    -- Select simples
	 SELECT * FROM Nome_Tabela
	 
	-- Select especifico
	 SELECT Nome_coluna1, Nome_Coluna2 FROM tbl_Livro
	 
	-- Select especifico, com exibição diferenciada 
	 SELECT Nome_coluna1, Nome_Coluna2 FROM tbl_Livro]
	 
    -- Criando uma View de uma tabela 
	  CREATE VIEW vw_View AS SELECT Nome, Preco_Livro FROM tbl_Livro WHERE Preco_Livro > 15.00;
	  
	-- Select para visualização das propriedades de um database (Pode ser alterado)
     SELECT DB_NAME () AS BANCO, 
			NAME AS ARQUIVO,               --Puxa o parametro que deseja e como quer que ele seja chamado na tabela
			FILE_ID AS ID_ARQUIVO,
			PHYSICAL_NAME AS NOME_ARQUIVO,
			(SIZE * 8.0/1024) AS TAMANHO,
			(((SIZE * 8.0/1024)) - (FILEPROPERTY(NAME,'SpaceUsed') * 8.0/1024)) AS LIVRE
			FROM SYS.DATABASE_FILES 
	
	-- Exibe status de um database de maneira pré definida
	 DBCC SHOWFILESTATS
      
 )
 
  Comandos de Transação (
   
	-- Transação adiciona um valor na tabela de maneira atomica (Funcina 100% ou Falha 100%)
	 BEGIN TRAN INSERT INTO Coluna VALUES (X)
	
	-- Encerra a transação 
	 COMMIT TRAN
	
	-- Desfaz a ultima transação aberta
 	 ROLLBACK
 
  
  )
 
  Backup de databases (
	
	-- Backup Full
	 BACKUP DATABASE AdventureWorks2012
	 TO DISK = N'C:\SQLuse\Backup\BKP_ADVWKS.bak'
	 GO
	 
	-- Backup Log
	 BACKUP LOG AdventureWorks2012 
	 TO DISK = N'C:\SQLuse\Backup\BKP_LOG.trn'
	 GO

	 
	-- Alterando tipo de restore (full)
	 ALTER DATABASE AdventureWorks2012
 	 SET RECOVERY FULL WITH NO_WAIT
	 GO
	 
	-- Alterando tipo de restore (Simple)
	 ALTER DATABASE db_Migra SET RECOVERY SIMPLE 
	 WITH NO_WAIT
	 GO

	-- Set single user no banco de dados
	 ALTER DATABASE Nome_Banco
	 SET SINGLE_USER WITH ROLLBACK IMMEDIATE
	 GO
	 
	-- Restaurando um backup simple
	 RESTORE DATABASE NOME_NOVA
	 FROM DISK = N'C:\SQLuse\Backup\BKP_Livrim.bak'
	 WITH MOVE N'tbl_Livro' TO N'C:\SQLuse\Backup\Lacopia\N_arq.mdf',
	 MOVE 
	 
	-- Restaurando um backup full
	 RESTORE DATABASE db_Livrim
	 FROM DISK = N'C:\SQLuse\Backup\BKP_Biblioteca.bak'
	 WITH FILE = 1,		
	 MOVE N'db_Biblioteca' TO N'C:\SQLuse\db_Livrim.MDF',
	 MOVE N'db_Biblioteca_log' TO N'C:\SQLuse\db_LivrimLog.LDF',
 	 NORECOVERY
 	 GO
	
	-- Restaurando backup de Log
	 RESTORE LOG db_Livrim
	 FROM DISK = N'C:\SQLuse\Backup\LOG_Biblioteca.trn',
	 WITH FILE = 1,
	 NORECOVERY
	 GO
	 
	-- Alterando o estado da database 
	 RESTORE DATABASE db_Livrim
	 WITH RECOVERY 
	 GO
	 
	-- Verificar Status do restore
	 SELECT * FROM MSDB..RESTOREHISTORY

	 
	-- Conferindo status na base msdb
	 SELECT A.NAME AS NOME,
	 A.STATE_DESC AS STATUS,
	 C.PHYSICAL_DEVICE_NAME AS LOCALIZACAO_BACKUP,
	 B.BACKUP_SIZE/1024/1024 AS TAMANHO_MB,
	 B.BACKUP_FINISH_DATE AS DATA_FINALIZACAO,
	 B.IS_DAMAGED AS DANIFICADO,
	 A.RECOVERY_MODEL_DESC AS MODO_RECUPERAÇÃO, 
	 A.IS_AUTO_CLOSE_ON AS AUTO_CLOSE, 
	 A.IS_AUTO_SHRINK_ON AS AUTO_SHRINK,
	 A.IS_AUTO_CREATE_STATS_ON AS ESTATISTICAS_AUTOMATICAS,
	 A.IS_AUTO_UPDATE_STATS_ON AS UPDATE_ESTAT_AUTO,
	 B.SERVER_NAME AS INSTANCIA_SQL,
	 B.TYPE AS TIPO
	 FROM SYS.DATABASES A
	 JOIN MSDB.DBO.BACKUPSET B
	 ON A.NAME = B.DATABASE_NAME
	 JOIN MSDB.DBO.BACKUPMEDIAFAMILY C
	 ON B.MEDIA_SET_ID = C.MEDIA_SET_ID
	 WHERE A.NAME ='AdventureWorks2012'
	 
	-- Conferindo a condição do banco (on/off)
	 SELECT NAME, STATE_DESC FROM sys.databases
	 WHERE NAME IN('db_Biblioteca','db_Livrim')
	 GO	
	   
  
  )
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
-- Conectar ao servidor especificado
 -S server_name

-- Conecta ao banco de dados especifico
 -d databas_name
 
-- Login com login especifico
 -U login
 
-- Autenticação do login
 -P password
 
-- Usa conexão autenticada com o windows
 -E
 
-- Abre conexão com admin dedicada
 -A
 
-- Executa codigo T-SQL no arquivo especificado
 -i input_file
 
-- Salva a saida do arquivo
 -o output_file
 

