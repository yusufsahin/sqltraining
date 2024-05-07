USE [master]
GO

/****** Object:  Database [DbUlke]    Script Date: 7.05.2024 21:34:21 ******/
CREATE DATABASE [DbUlke]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DbUlke', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DbUlke.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DbUlke_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DbUlke_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DbUlke].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [DbUlke] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [DbUlke] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [DbUlke] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [DbUlke] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [DbUlke] SET ARITHABORT OFF 
GO

ALTER DATABASE [DbUlke] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [DbUlke] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [DbUlke] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [DbUlke] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [DbUlke] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [DbUlke] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [DbUlke] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [DbUlke] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [DbUlke] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [DbUlke] SET  DISABLE_BROKER 
GO

ALTER DATABASE [DbUlke] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [DbUlke] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [DbUlke] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [DbUlke] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [DbUlke] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [DbUlke] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [DbUlke] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [DbUlke] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [DbUlke] SET  MULTI_USER 
GO

ALTER DATABASE [DbUlke] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [DbUlke] SET DB_CHAINING OFF 
GO

ALTER DATABASE [DbUlke] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [DbUlke] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [DbUlke] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [DbUlke] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [DbUlke] SET QUERY_STORE = ON
GO

ALTER DATABASE [DbUlke] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO

ALTER DATABASE [DbUlke] SET  READ_WRITE 
GO

