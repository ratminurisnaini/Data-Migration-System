-- Database used is Microsoft SQL Server

USE myDatabase

CREATE TABLE [dbo].[ms_param] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [tgl_create] date  NULL,
  [user_create] varchar(50) NULL,
  [kode] varchar(50) NULL,
  [nama] varchar(100) NULL,
  [deskripsi] varchar(100) NULL,
  [group1] varchar(50) NULL,
  [group2] varchar(50) NULL,
  [group3] varchar(50) NULL,
  [nilai1] varchar(500) NULL,
  [nilai2] nvarchar(500) NULL,
  [nilai3] varchar(500) NULL
)