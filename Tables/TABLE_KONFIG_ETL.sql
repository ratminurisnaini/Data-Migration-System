-- Database used is Microsoft SQL Server

USE myDatabase

CREATE TABLE [dbo].[konfig_etl] (
  [id_etl] int NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [ip_source] varchar(100) NULL,
  [db_source] varchar(100) NULL,
  [user_source] varchar(100) NULL,
  [pass_source] varchar(100) NULL,
  [schema_source] varchar(100) NULL,
  [tablename_source] varchar(100) NULL,
  [ip_target] varchar(100) NULL,
  [db_target] varchar(100) NULL,
  [user_target] varchar(100) NULL,
  [pass_target] varchar(100) NULL,
  [schema_target] varchar(100) NULL,
  [tablename_target] varchar(100) NULL,
  [script] text NULL,
  [flag_delete] varchar(1) NULL,
  [condition_delete] text NULL,
  [start_date] datetime NULL,
  [end_date] datetime NULL,
  [status] int NOT NULL,
  [keterangan] text NULL,
  [flag_aktif] int NOT NULL,
  [tanggal] int NULL,
  [flag_generate_file] int NULL,
  [flag_email] int NULL,
  [flag_sftp] int NULL,
  [flag_db_source] int NULL
)