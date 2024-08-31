-- Database used is Microsoft SQL Server

USE myDatabase

CREATE TABLE [dbo].[log_etl] (
  [id] int NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [id_etl] int NOT NULL,
  [start_date] datetime NULL,
  [end_date] datetime NULL,
  [status] int NOT NULL,
  [keterangan] text NULL
)