/*Caleb MacQueen 11/2/18 Wrote initial script*/
USE master
GO

IF DB_ID('wwiigames') IS NOT NULL --Makes sure that you are allowed to create the database
DROP DATABASE wwiigames
GO

Create database wwiigames;
GO
Use wwiigames;
GO

--Create comment table:
CREATE TABLE comment(
commentID int not null primary key identity,
fullName varchar(60) not null,
emailAddress varchar(120) not null,
commentTxt varchar(500) not null
)

GO

create proc InsertComment
@fullName varchar(60),
@emailAddress varchar(120),
@commentTxt varchar(500)
as
INSERT INTO comment
     VALUES
           (@fullName,
			@emailAddress,
			@commentTxt)
GO
execute InsertComment "Mickey Mouse", "mickey@mouse.com", "Insert using SP from SSMS";

select * from comment;
go

--Create comment table:
CREATE TABLE list(
ID int not null primary key identity,
firstName varchar(60) not null,
emailAddress varchar(120) not null
)

GO

create proc InsertList
@firstName varchar(60),
@emailAddress varchar(120)
as
INSERT INTO List
     VALUES
           (@firstName,
			@emailAddress)
GO
execute InsertList "Mickey", "mickey@mouse.com";

select * from List;

CREATE LOGIN wwiiApp WITH PASSWORD='Pa$$w0rd', DEFAULT_DATABASE=wwiigames
go
use wwiigames
go
CREATE USER wwiiApp FOR LOGIN wwiiApp WITH DEFAULT_SCHEMA=[dbo]
GO
grant execute on InsertComment to wwiiApp
go
grant execute on InsertList to wwiiApp
go
