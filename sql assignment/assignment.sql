USE [master]
GO
/****** Object:  Database [MangementSystem]    Script Date: 04/01/2023 11:15:27 ******/
CREATE DATABASE [MangementSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MangementSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\MangementSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MangementSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\MangementSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MangementSystem] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MangementSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MangementSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MangementSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MangementSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MangementSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MangementSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [MangementSystem] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MangementSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MangementSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MangementSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MangementSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MangementSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MangementSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MangementSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MangementSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MangementSystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MangementSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MangementSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MangementSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MangementSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MangementSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MangementSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MangementSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MangementSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MangementSystem] SET  MULTI_USER 
GO
ALTER DATABASE [MangementSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MangementSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MangementSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MangementSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MangementSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MangementSystem] SET QUERY_STORE = OFF
GO
USE [MangementSystem]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [MangementSystem]
GO
/****** Object:  Table [dbo].[department]    Script Date: 04/01/2023 11:15:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[department](
	[department_id] [int] IDENTITY(1,1) NOT NULL,
	[department_name] [varchar](100) NOT NULL,
	[location_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 04/01/2023 11:15:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[employee_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[phone_number] [varchar](30) NOT NULL,
	[hire_date] [date] NOT NULL,
	[job_id] [varchar](30) NOT NULL,
	[salary] [int] NOT NULL,
	[manager_id] [int] NULL,
	[department_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[job_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD FOREIGN KEY([department_id])
REFERENCES [dbo].[department] ([department_id])
GO
/****** Object:  StoredProcedure [dbo].[crud]    Script Date: 04/01/2023 11:15:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[crud]
	@department_id int =0,
	@department_name varchar(100)=null,
	@location_id int=0,
	@Choice varchar(100)
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if @Choice='insert'
	begin
	insert into department(department_name,location_id) values (@department_name,@location_id)
	end

	if @Choice='update'
	begin
	update department set
	department_name=@department_name,location_id=@location_id where department_id=@department_id
	end
	if @Choice='delete'
	begin
	delete from department where department_id=@department_id
	end

END
GO
/****** Object:  StoredProcedure [dbo].[uspOnTherTableEmployee]    Script Date: 04/01/2023 11:15:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspOnTherTableEmployee]
	-- Add the parameters for the stored procedure here
	@employee_id int =0,
	@first_name varchar(50)=null,
	@last_name varchar(50)=null,
	@email varchar(50)=null,
	@phone_number varchar(30)=null,
	@hire_date date=null,
	@job_id varchar(30)=null,
	@salary int=0,
	@manager_id int =0,
	@department_id int=0,
    @Choice varchar(100)
	
AS
BEGIN
	
	SET NOCOUNT ON;

	if @Choice='insert'
	begin
	insert into Employees(first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
	values (@first_name,@last_name,@email,@phone_number,@hire_date,@job_id,@salary,@manager_id,@department_id)
	end

	if @Choice='update'
	begin
	update Employees set
	first_name=@first_name,last_name=@last_name,email=@email,phone_number=@phone_number,hire_date=@hire_date,job_id=@job_id,salary=@salary,manager_id=@manager_id,department_id=@department_id
	where department_id=@department_id
	end
	if @Choice='delete'
	begin
	delete from Employees where employee_id=@employee_id
	end
END
GO
USE [master]
GO
ALTER DATABASE [MangementSystem] SET  READ_WRITE 
GO