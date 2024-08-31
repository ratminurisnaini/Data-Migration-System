# Data-Migration-System
This ETL system is designed using Pentaho to perform multiple tasks sequentially in one execution. The main task is to transfer data tables between servers (SQL Server-to-SQL Server or MySQL-to-SQL Server). In each task, the system can perform other subtasks besides data transfer.

Subtasks that the system can perform in each task:
-	Data transfer (SQL Server-to-SQL Server or MySQL-to-SQL Server)
-	Generating a file (in xls, xlsx, csv, or txt formats)
-	Sending the generated file to an email
-	Sending the generated file to SFTP
-	Scheduling the process to be executed daily or monthly
-	Showing the process status (and logging if errors occurred)

## ETL System Simple Flowchart
![Flowchart](https://github.com/user-attachments/assets/1f9677fd-ba7d-47db-9648-ae39ca4942b3)

The ETL system consists of 3 jobs and 12 transformations. And three tables are used in this ETL system, namely konfig_etl, log_etl, and ms_param. They are located in the ‘Tables’ folder. The database used to store these three tables is the SQL Server database.

## Tables
### 1. konfig_etl
Used to store the configuration of data transfer like the source connection, the target connection, the script to retrieve the source data, and other commands to perform other subtasks mentioned above.

**Table preview**

<img width="833" alt="konfig_etl (1)" src="https://github.com/user-attachments/assets/4f205ce6-30ed-4b2f-b1c4-ad09cf4bbdae"> **. . .**

<img width="832" alt="konfig_etl (2)" src="https://github.com/user-attachments/assets/0c8cd92f-efa4-482a-81f7-3e6015c99963"> **. . .**

<img width="650" alt="konfig_etl (3)" src="https://github.com/user-attachments/assets/bdfef060-3542-4388-9f1b-c27b492e890f"><br>

**Field descriptions**
| No | Field | Data Type | Description |
| --- | --- | --- | --- |
| 1 |	id_etl |	int |	Unique id number of konfig_etl table |
| 2 |	ip_source |	varchar |	Source database IP |
| 3 |	db_source |	varchar |	Source database name |
| 4 |	user_source |	varchar |	Source database username |
| 5 |	pass_source |	varchar |	Encrypted source database password (if exists) |
| 6 |	schema_source |	varchar |	Schema name in the source database (if exists) |
| 7 |	tablename_source |	varchar |	Table name in the source database |
| 8 |	ip_target |	varchar |	Target database IP |
| 9 |	db_target |	varchar |	Target database name |
| 10 |	user_target |	varchar |	Target database username |
| 11 |	pass_target |	varchar |	Encrypted target database password (if exists) |
| 12 |	schema_target |	varchar |	Schema name in the target database (if exists) |
| 13 |	tablename_target |	varchar	| Table name in the source database |
| 14 |	script |	text |	Script to retrieve the source data (it can be queries or a stored procedure) |
| 15 |	flag_delete |	varchar | <p>Flag for target data deletion<br>Values: Y &#124; N<br>Y: Perform deletion<br>N: Do not perform deletion</p> |
| 16 |	condition_delete |	text |	<p>This field is filled with a deletion query if flag_delete is ‘Y’. For example:<br>*delete from tableA where date < ‘2024-08-31’*</p> |
| 17 |	start_date |	datetime |	The time when the execution of the current ETL id is started |
| 18 |	end_date |	datetime |	The time when the execution of the current ETL id is completed |
| 19 |	status |	int | <p>ETL execution status<br>Values: 0 &#124; 1 &#124; 2<br>0: Indicates that the current ETL ID has not been executed yet<br>1: Indicates a successful execution of the current ETL ID process<br>2: Indicates a failed execution of the current ETL ID process</p> |
| 20 |	keterangan |	text |	ETL execution status description |
| 21	| flag_aktif |	int | <p>Flag to activate or deactivate the current ETL id<br>Values: 0 &#124; 1<br>0: Deactivate current ETL id<br>1: Activate current ETL id</p> |
| 22 |	tanggal |	int | <p>Flag for scheduling the execution<br>Values: *null* &#124; (1-31)<br>*null*: the current ETL id will be executed daily<br>(1-31): indicates the date number so the current ETL id will be executed monthly on the date specified in the tanggal field</p> |
| 23 |	flag_generate_file |	int | <p>Flag for generating file<br>Values: *null* &#124; ms_param id<br>*null*: don’t generate a file<br>ms_param id: generate a file with file configuration in ms_param table with specified id in the flag_generate_file field</p> |
| 24 |	flag_email |	int | <p>Flag for sending the generated file to email<br>Values: *null* &#124; ms_param id<br>*null*: don’t sending the generated file to email<br>ms_param id: sending the generated file with email configuration in ms_param table with specified id in the flag_email field</p> |
| 25 |	flag_sftp |	int | <p>Flag for sending the generated file to SFTP<br>Values: *null* &#124; ms_param id<br>*null*: don’t sending the generated file to SFTP<br>ms_param id: sending the generated file with SFTP configuration in ms_param table with specified id in the flag_SFTP field</p> |
| 26 |	flag_db_source |	int | <p>Flag for data transfer process<br>Values: 0 &#124; 1 <br>0: the transfer will be performed from SQL Server database to SQL Server database<br>1: the transfer will be performed from MySQL database to SQL Server database</p> |

### 2. log_etl Table
Used to store logs from the process of konfig_etl table.

**Table preview**

<img width="532" alt="log_etl" src="https://github.com/user-attachments/assets/83877711-5a25-4f27-b5d4-1606c512601a"><br>

**Field descriptions**
| No | Field | Data Type | Description |
| --- | --- | --- | --- |
| 1 |	id |	int |	Unique id number of log_etl table |
| 2 |	id_etl |	int |	ETL id in konfig_etl table |
| 3 |	start_date |	datetime |	The time when the execution of current ETL id is started |
| 4 |	end_date |	datetime |	The time when the execution of current ETL id is completed |
| 5 |	status |	int | ETL execution status |
| 6 |	keterangan |	text |	ETL execution status description |

### 3. ms_param Table
Used to store the configuration parameters for generating a file, sending the generated file to email, and sending the generated file to SFTP.

**Table preview**

<img width="750" alt="ms_param (1)" src="https://github.com/user-attachments/assets/8ad2dec2-64d4-48f1-9b6d-348416079cd1"> **. . .**

<img width="743" alt="ms_param (2)" src="https://github.com/user-attachments/assets/56c16199-0a14-40f3-b989-3c2b134c27f8"><br>

**Field descriptions**
| No | Field | Data Type | Description |
| --- | --- | --- | --- |
| 1 |	id |	int |	Unique id number of ms_param table |
| 2 |	tgl_create |	date |	The date when the current id is created |
| 3 |	user_create |	varchar |	The username when the current id is created |
| 4 |	kode |	varchar |	The code name |
| 5 |	nama |	varchar |	The name of the process |
| 6 |	deskripsi |	varchar |	Description of the process (optional) |
| 7 |	group1 |	varchar |	Consists of a maximum of two parameter names separated by a semicolon |
| 8 |	group2 |	varchar |	Consists of a maximum of two parameter names separated by a semicolon |
| 9 |	group3 |	varchar |	Consists of a maximum of two parameter names separated by a semicolon |
| 10 |	nilai1 |	varchar |	Consists of the values in group1 field separated by semicolon |
| 11 |	nilai2 |	nvarchar |	Consists of the values in group2 field separated by semicolon |
| 12 |	nilai3 |	varchar |	Consists of the values in group3 field separated by semicolon |

Note:
The encrypted password is encrypted by the fnEncrypt function and then will be decrypted by the fnDecrypt function in the ETL system. These two functions aren't included in this repository so you have to create your own fnEncrypt and fnDecrypt functions before executing the ETL system.
