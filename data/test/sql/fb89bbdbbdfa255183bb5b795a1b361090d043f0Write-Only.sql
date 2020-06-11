﻿USE [master]
GO
/****** Object:  Database [Write-Only]    Script Date: 31.10.2013 22:01:10 ******/
CREATE DATABASE [Write-Only]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Write-Only', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Write-Only.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Write-Only_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Write-Only_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Write-Only] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Write-Only].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Write-Only] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Write-Only] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Write-Only] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Write-Only] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Write-Only] SET ARITHABORT OFF 
GO
ALTER DATABASE [Write-Only] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Write-Only] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Write-Only] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Write-Only] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Write-Only] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Write-Only] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Write-Only] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Write-Only] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Write-Only] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Write-Only] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Write-Only] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Write-Only] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Write-Only] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Write-Only] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Write-Only] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Write-Only] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Write-Only] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Write-Only] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Write-Only] SET RECOVERY FULL 
GO
ALTER DATABASE [Write-Only] SET  MULTI_USER 
GO
ALTER DATABASE [Write-Only] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Write-Only] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Write-Only] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Write-Only] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Write-Only', N'ON'
GO
USE [Write-Only]
GO
/****** Object:  StoredProcedure [dbo].[Rebind]    Script Date: 31.10.2013 22:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Rebind]
	@Value bigint
AS
BEGIN
	INSERT INTO Store VALUES (@Value)
END

GO
/****** Object:  StoredProcedure [dbo].[Submit]    Script Date: 31.10.2013 22:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Submit]
	@Value bigint
AS
BEGIN
	INSERT INTO Store VALUES (@Value)
END

GO
/****** Object:  Table [dbo].[Store]    Script Date: 31.10.2013 22:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[Key] [int] IDENTITY(1,1) NOT NULL,
	[Value] [bigint] NOT NULL,
 CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [Write-Only] SET  READ_WRITE 
GO