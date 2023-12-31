USE [master]
GO
/****** Object:  Database [fuda_bus_ticket_booking]    Script Date: 06/07/2023 10:07:53 CH ******/
CREATE DATABASE [fuda_bus_ticket_booking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'fuda_bus_ticket_booking', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\fuda_bus_ticket_booking.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'fuda_bus_ticket_booking_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\fuda_bus_ticket_booking_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [fuda_bus_ticket_booking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET ARITHABORT OFF 
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET  DISABLE_BROKER 
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET RECOVERY FULL 
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET  MULTI_USER 
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'fuda_bus_ticket_booking', N'ON'
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET QUERY_STORE = ON
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [fuda_bus_ticket_booking]
GO
/****** Object:  UserDefinedFunction [dbo].[calculating_revenue_by_month]    Script Date: 06/07/2023 10:07:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[calculating_revenue_by_month] (@month int, @year int)
	RETURNS INT
		AS
			BEGIN
				DECLARE @amount INT
				SELECT @amount = SUM(td.td_ticket_price) 
					FROM dbo.booking b INNER JOIN dbo.trip_seat_detail ts on b.ts_id =ts.ts_id
							INNER JOIN trip_detail td ON td.td_id= ts.td_id
						WHERE MONTH(b.paid_date) =@month AND YEAR(b.paid_date)= @year AND b.b_status ='paid'
				RETURN @amount
			END
GO
/****** Object:  UserDefinedFunction [dbo].[get_number_of_booked_ticket]    Script Date: 06/07/2023 10:07:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[get_number_of_booked_ticket](@td_id char(9))
RETURNS INT
		AS
			BEGIN
				DECLARE @number INT
				SELECT @number = COUNT(ts_id) 
					FROM dbo.trip_seat_detail
						WHERE se_status=0 AND td_id=@td_id
				RETURN @number
			END
GO
/****** Object:  Table [dbo].[booking]    Script Date: 06/07/2023 10:07:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[booking](
	[b_id] [int] IDENTITY(1,1) NOT NULL,
	[c_phone] [char](10) NOT NULL,
	[ts_id] [char](11) NOT NULL,
	[b_status] [varchar](20) NOT NULL,
	[b_date] [date] NOT NULL,
	[b_time] [time](7) NOT NULL,
	[code] [varchar](20) NULL,
	[paid_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[b_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 06/07/2023 10:07:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[c_phone] [char](10) NOT NULL,
	[c_email] [varchar](50) NULL,
	[c_first_name] [nvarchar](25) NOT NULL,
	[c_last_name] [nvarchar](25) NOT NULL,
	[c_birth_date] [date] NOT NULL,
	[c_password] [varchar](50) NOT NULL,
	[c_created_date] [date] NOT NULL,
	[c_url_img] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[c_phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee_account]    Script Date: 06/07/2023 10:07:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee_account](
	[ea_username] [varchar](50) NOT NULL,
	[ea_password] [varchar](50) NOT NULL,
	[status] [varchar](20) NOT NULL,
	[r_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ea_username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notification]    Script Date: 06/07/2023 10:07:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notification](
	[no_id] [int] NOT NULL,
	[no_title] [varchar](200) NOT NULL,
	[no_content] [ntext] NOT NULL,
	[created_date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[no_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 06/07/2023 10:07:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[r_id] [int] NOT NULL,
	[r_name] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[r_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[route]    Script Date: 06/07/2023 10:07:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[route](
	[tr_id] [char](6) NOT NULL,
	[st_id] [int] NOT NULL,
 CONSTRAINT [PK_ROUTE] PRIMARY KEY CLUSTERED 
(
	[tr_id] ASC,
	[st_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seat]    Script Date: 06/07/2023 10:07:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seat](
	[se_id] [int] IDENTITY(1,1) NOT NULL,
	[se_name] [char](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[se_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[station]    Script Date: 06/07/2023 10:07:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[station](
	[st_id] [int] IDENTITY(1,1) NOT NULL,
	[st_name] [varchar](50) NULL,
	[st_url] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[st_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trip_detail]    Script Date: 06/07/2023 10:07:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trip_detail](
	[td_id] [char](9) NOT NULL,
	[tr_id] [char](6) NOT NULL,
	[td_depature_time] [time](7) NOT NULL,
	[td_date] [date] NOT NULL,
	[td_ticket_price] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[td_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trip_of_bus]    Script Date: 06/07/2023 10:07:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trip_of_bus](
	[tr_id] [char](6) NOT NULL,
	[tr_starting_point] [int] NOT NULL,
	[tr_destination] [int] NOT NULL,
	[tr_total_seat] [int] NOT NULL,
	[tr_during] [int] NOT NULL,
	[tr_bus_code] [char](9) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trip_seat_detail]    Script Date: 06/07/2023 10:07:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trip_seat_detail](
	[ts_id] [char](11) NOT NULL,
	[td_id] [char](9) NOT NULL,
	[se_id] [int] NOT NULL,
	[se_status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ts_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[booking] ON 

INSERT [dbo].[booking] ([b_id], [c_phone], [ts_id], [b_status], [b_date], [b_time], [code], [paid_date]) VALUES (1, N'0935396334', N'DNNA0100101', N'Canceled', CAST(N'2023-06-27' AS Date), CAST(N'22:56:44' AS Time), N'53489477', CAST(N'2023-06-27' AS Date))
INSERT [dbo].[booking] ([b_id], [c_phone], [ts_id], [b_status], [b_date], [b_time], [code], [paid_date]) VALUES (2, N'0935396334', N'DNNAV100101', N'Canceled', CAST(N'2023-06-27' AS Date), CAST(N'23:40:07' AS Time), N'90920779', CAST(N'2023-06-27' AS Date))
INSERT [dbo].[booking] ([b_id], [c_phone], [ts_id], [b_status], [b_date], [b_time], [code], [paid_date]) VALUES (3, N'0935396334', N'DNNA0100113', N'canceled', CAST(N'2023-06-28' AS Date), CAST(N'14:50:34' AS Time), NULL, CAST(N'2023-07-01' AS Date))
INSERT [dbo].[booking] ([b_id], [c_phone], [ts_id], [b_status], [b_date], [b_time], [code], [paid_date]) VALUES (4, N'0935396334', N'DNNA0100116', N'refunding', CAST(N'2023-06-28' AS Date), CAST(N'14:50:34' AS Time), NULL, CAST(N'2023-07-01' AS Date))
INSERT [dbo].[booking] ([b_id], [c_phone], [ts_id], [b_status], [b_date], [b_time], [code], [paid_date]) VALUES (5, N'0935396334', N'DNNA0100102', N'refunding', CAST(N'2023-06-29' AS Date), CAST(N'00:37:31' AS Time), NULL, CAST(N'2023-07-01' AS Date))
INSERT [dbo].[booking] ([b_id], [c_phone], [ts_id], [b_status], [b_date], [b_time], [code], [paid_date]) VALUES (8, N'0935396334', N'DNNAV100101', N'paid', CAST(N'2023-06-29' AS Date), CAST(N'18:06:32' AS Time), NULL, CAST(N'2023-07-01' AS Date))
INSERT [dbo].[booking] ([b_id], [c_phone], [ts_id], [b_status], [b_date], [b_time], [code], [paid_date]) VALUES (9, N'0935396334', N'DNNA0100101', N'paid', CAST(N'2023-07-01' AS Date), CAST(N'12:59:55' AS Time), NULL, CAST(N'2023-07-01' AS Date))
INSERT [dbo].[booking] ([b_id], [c_phone], [ts_id], [b_status], [b_date], [b_time], [code], [paid_date]) VALUES (10, N'0935396334', N'DNNA0100102', N'order', CAST(N'2023-07-01' AS Date), CAST(N'12:59:55' AS Time), NULL, NULL)
INSERT [dbo].[booking] ([b_id], [c_phone], [ts_id], [b_status], [b_date], [b_time], [code], [paid_date]) VALUES (11, N'0935396334', N'DNNA0100104', N'order', CAST(N'2023-07-01' AS Date), CAST(N'12:59:55' AS Time), NULL, NULL)
INSERT [dbo].[booking] ([b_id], [c_phone], [ts_id], [b_status], [b_date], [b_time], [code], [paid_date]) VALUES (12, N'0935396334', N'DNSG0100101', N'order', CAST(N'2023-07-01' AS Date), CAST(N'13:03:27' AS Time), NULL, NULL)
INSERT [dbo].[booking] ([b_id], [c_phone], [ts_id], [b_status], [b_date], [b_time], [code], [paid_date]) VALUES (13, N'0935396334', N'DNSG0100102', N'order', CAST(N'2023-07-01' AS Date), CAST(N'13:03:27' AS Time), NULL, NULL)
INSERT [dbo].[booking] ([b_id], [c_phone], [ts_id], [b_status], [b_date], [b_time], [code], [paid_date]) VALUES (14, N'0935396334', N'DNSG0100103', N'order', CAST(N'2023-07-01' AS Date), CAST(N'13:03:27' AS Time), NULL, NULL)
INSERT [dbo].[booking] ([b_id], [c_phone], [ts_id], [b_status], [b_date], [b_time], [code], [paid_date]) VALUES (15, N'0123123456', N'DNNA0100103', N'order', CAST(N'2023-07-01' AS Date), CAST(N'14:05:49' AS Time), NULL, NULL)
INSERT [dbo].[booking] ([b_id], [c_phone], [ts_id], [b_status], [b_date], [b_time], [code], [paid_date]) VALUES (16, N'0987654321', N'DNNA0100105', N'order', CAST(N'2023-07-01' AS Date), CAST(N'14:10:02' AS Time), NULL, NULL)
INSERT [dbo].[booking] ([b_id], [c_phone], [ts_id], [b_status], [b_date], [b_time], [code], [paid_date]) VALUES (17, N'0123123123', N'DNNA0100106', N'order', CAST(N'2023-07-01' AS Date), CAST(N'14:10:54' AS Time), NULL, NULL)
SET IDENTITY_INSERT [dbo].[booking] OFF
GO
INSERT [dbo].[customer] ([c_phone], [c_email], [c_first_name], [c_last_name], [c_birth_date], [c_password], [c_created_date], [c_url_img]) VALUES (N'0123123123', N'huyltqde160585@fpt.edu.vn', N'Luong', N'Ngu', CAST(N'2002-03-11' AS Date), N'4297f44b13955235245b2497399d7a93', CAST(N'2023-06-22' AS Date), N'img/customer/img-profile-none-bg.png')
INSERT [dbo].[customer] ([c_phone], [c_email], [c_first_name], [c_last_name], [c_birth_date], [c_password], [c_created_date], [c_url_img]) VALUES (N'0123123128', N'asdasdsad@gasdsad', N'asd', N'zxc', CAST(N'2023-06-03' AS Date), N'24fe20559960b202b9ac1d8dcf575cc5', CAST(N'2023-06-23' AS Date), N'img/customer/img-profile-none-bg.png')
INSERT [dbo].[customer] ([c_phone], [c_email], [c_first_name], [c_last_name], [c_birth_date], [c_password], [c_created_date], [c_url_img]) VALUES (N'0123123456', N'dungdung23092002@gmail.com', N'Dũng ', N'Soái Ca', CAST(N'2002-09-23' AS Date), N'4297f44b13955235245b2497399d7a93', CAST(N'2023-06-20' AS Date), N'img/customer/01231234560935396334img_avatar.png')
INSERT [dbo].[customer] ([c_phone], [c_email], [c_first_name], [c_last_name], [c_birth_date], [c_password], [c_created_date], [c_url_img]) VALUES (N'0935396334', N'letranquochuy1305@gmail.com', N'Lương', N'Soái Ca', CAST(N'1999-12-05' AS Date), N'4297f44b13955235245b2497399d7a93', CAST(N'2023-06-05' AS Date), N'img/customer/09353963340935396334LuongTV.png')
INSERT [dbo].[customer] ([c_phone], [c_email], [c_first_name], [c_last_name], [c_birth_date], [c_password], [c_created_date], [c_url_img]) VALUES (N'0987654321', N'huytronglee@gmail.com', N'Lê', N'Huy', CAST(N'2000-11-11' AS Date), N'1d740864fc25bb8f16c0bf20e81c789', CAST(N'2023-06-23' AS Date), N'img/customer/img-profile-none-bg.png')
INSERT [dbo].[customer] ([c_phone], [c_email], [c_first_name], [c_last_name], [c_birth_date], [c_password], [c_created_date], [c_url_img]) VALUES (N'1231231231', N'asdasd@asdasd', N'Lê ', N'Huy', CAST(N'2023-03-02' AS Date), N'8daacaee0bd515a7f1a87e805e865338', CAST(N'2023-06-23' AS Date), N'img/customer/img-profile-none-bg.png')
INSERT [dbo].[customer] ([c_phone], [c_email], [c_first_name], [c_last_name], [c_birth_date], [c_password], [c_created_date], [c_url_img]) VALUES (N'1231231234', N'luyen@gmail.com', N'asd', N'asd', CAST(N'2023-06-02' AS Date), N'f90f0914383b225b85f3905447a29985', CAST(N'2023-06-23' AS Date), N'img/customer/img-profile-none-bg.png')
INSERT [dbo].[customer] ([c_phone], [c_email], [c_first_name], [c_last_name], [c_birth_date], [c_password], [c_created_date], [c_url_img]) VALUES (N'1231231235', N'asdz@gma', N'asd', N'asd', CAST(N'2022-09-08' AS Date), N'a645a6e466923ca6ba8b5dadaa994d19', CAST(N'2023-06-23' AS Date), N'img/customer/img-profile-none-bg.png')
GO
INSERT [dbo].[employee_account] ([ea_username], [ea_password], [status], [r_id]) VALUES (N'admin', N'4297f44b13955235245b2497399d7a93', N'enable', 1)
INSERT [dbo].[employee_account] ([ea_username], [ea_password], [status], [r_id]) VALUES (N'employee', N'4297f44b13955235245b2497399d7a93', N'enable', 2)
INSERT [dbo].[employee_account] ([ea_username], [ea_password], [status], [r_id]) VALUES (N'employee2', N'202cb962ac59075b964b07152d234b70', N'enable', 2)
GO
INSERT [dbo].[role] ([r_id], [r_name]) VALUES (2, N'admin')
INSERT [dbo].[role] ([r_id], [r_name]) VALUES (1, N'employee')
GO
SET IDENTITY_INSERT [dbo].[seat] ON 

INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (1, N'A1')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (2, N'A2')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (3, N'A3')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (4, N'A4')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (5, N'A5')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (6, N'A6')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (7, N'B1')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (8, N'B2')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (9, N'B3')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (10, N'B4')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (11, N'B5')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (12, N'B6')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (13, N'C1')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (14, N'C2')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (15, N'C3')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (16, N'C4')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (17, N'C5')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (18, N'C6')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (19, N'D1')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (20, N'D2')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (21, N'D3')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (22, N'D4')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (23, N'D5')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (24, N'D6')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (25, N'E1')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (26, N'E2')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (27, N'E3')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (28, N'E4')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (29, N'E5')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (30, N'E6')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (31, N'F1')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (32, N'F2')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (33, N'F3')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (34, N'F4')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (35, N'F5')
INSERT [dbo].[seat] ([se_id], [se_name]) VALUES (36, N'F6')
SET IDENTITY_INSERT [dbo].[seat] OFF
GO
SET IDENTITY_INSERT [dbo].[station] ON 

INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (1, N'An Giang', N'10.519279261654901, 105.12313922467567')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (2, N'Ba Ria - Vung Tau', N'10.509094127415196, 107.18162481120459')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (3, N'Bac Lieu', N'9.294583127731087, 105.71867875398614')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (4, N'Bac Kan', N'22.17070313874945, 105.81805683938215')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (5, N'Bac Giang', N'21.275748401697918, 106.19089002725529')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (6, N'Bac Ninh', N'21.195116129671334, 106.08160095554733')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (7, N'Ben Tre', N'10.246200097546886, 106.37584889943226')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (8, N'Binh Duong', N'11.325138983531723, 106.47488302887547')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (9, N'Binh Dinh', N'13.893456044748804, 109.10514020809183')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (10, N'Binh Phuoc', N'11.753790179666257, 106.72084113029652')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (11, N'Binh Thuan', N'11.093676815629397, 108.07036340080403')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (12, N'Ca Mau', N'9.155953454201851, 105.19388213497459')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (13, N'Cao Bang', N'22.644920234284903, 106.25758057512576')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (14, N'Can Tho', N'10.065456498519003, 105.56212383956404')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (15, N'Da Nang', N'16.054936947146228, 108.05255829391523')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (16, N'Dak Lak', N'12.712882987349838, 108.23385525002199')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (17, N'Dak Nong', N'12.267741282249812, 107.60441643460126')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (18, N'Dien Bien', N'21.411442288354284, 103.01793601800664')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (19, N'Dong Nai', N'11.068434792423306, 107.16723924932687')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (20, N'Dong Thap', N'10.494890628237748, 105.68884286503763')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (21, N'Gia Lai', N'13.803898831776294, 108.10581041558234')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (22, N'Ha Giang', N'22.87222014349392, 104.960452326242')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (23, N'Ha Nam', N'20.599602138776564, 105.90574286810359')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (24, N'Ha Noi', N'21.028380547250343, 105.8179062853767')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (25, N'Ha Tinh', N'18.369133317317843, 105.87772315595242')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (26, N'Hai Duong', N'20.93842295188951, 106.3181216936392')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (27, N'Hai Phong', N'20.837918306302097, 106.69679445394372')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (28, N'Hoa Binh', N'20.710920679271975, 105.2826894855746')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (29, N'TP Ho Chi Minh', N'10.823215522917454, 106.63073993366747')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (30, N'Hau Giang', N'9.795770003040449, 105.46873997303636')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (31, N'Hung Yen', N'20.677234575102457, 106.05956111664767')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (32, N'Khanh Hoa', N'12.260652078135882, 109.05212902693196')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (33, N'Kien Giang', N'9.82596740560047, 105.12306917032981')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (34, N'Kon Tum', N'14.349723368130347, 107.99594845323492')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (35, N'Lai Chau', N'22.39002446506377, 103.45683562147431')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (36, N'Lao Cai', N'22.474772641815214, 103.94651451411538')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (37, N'Lang Son', N'21.827333351545807, 106.71889689122484')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (38, N'Lam Dong', N'11.574675656140778, 108.14412835893711')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (39, N'Long An', N'10.699040254910063, 106.2412755604058')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (40, N'Nam Dinh', N'20.42801301320725, 106.14742395656766')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (41, N'Nghe An', N'19.23591133244641, 104.89216395835084')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (42, N'Ninh Binh', N'20.27369476356621, 105.94964581281378')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (43, N'Ninh Thuan', N'11.674878939446225, 108.8620356772059')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (44, N'Phu Tho', N'21.2734753218388, 105.20272710628257')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (45, N'Phu Yen', N'13.089644896136551, 109.08865860000468')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (46, N'Quang Binh', N'17.652554664993282, 106.32179726506993')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (47, N'Quang Nam', N'15.534368132350355, 108.02985010913243')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (48, N'Quang Ngai', N'15.119838325266496, 108.79679590486616')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (49, N'Quang Ninh', N'21.015152484706324, 107.3120542733302')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (50, N'Quang Tri', N'16.74864195645111, 107.17293328274853')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (51, N'Soc Trang', N'9.606284064989026, 105.97536009301027')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (52, N'Son La', N'21.328378078903945, 103.8925842804117')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (53, N'Tay Ninh', N'11.335409825696507, 106.11148726861994')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (54, N'Thai Binh', N'20.49538325228684, 106.3232066709509')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (55, N'Thai Nguyen', N'21.607789332425597, 105.81798011676887')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (56, N'Thanh Hoa', N'19.81448821449096, 105.77887246770628')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (57, N'Thua Thien Hue', N'16.475594848542144, 107.59113911852425')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (58, N'Tien Giang', N'10.44981523277147, 106.3401433486586')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (59, N'Tra Vinh', N'9.951886198444761, 106.33472022805748')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (60, N'Tuyen Quang', N'21.790102311431557, 105.24671874548707')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (61, N'Vinh Long', N'10.236856241027406, 105.95528493827221')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (62, N'Vinh Phuc', N'21.385571489981864, 105.5762537595833')
INSERT [dbo].[station] ([st_id], [st_name], [st_url]) VALUES (63, N'Yen Bai', N'21.700168545667452, 104.89514836382179')
SET IDENTITY_INSERT [dbo].[station] OFF
GO
INSERT [dbo].[trip_detail] ([td_id], [tr_id], [td_depature_time], [td_date], [td_ticket_price]) VALUES (N'DNNA01001', N'DNNA01', CAST(N'19:00:00' AS Time), CAST(N'2023-12-06' AS Date), 300000)
INSERT [dbo].[trip_detail] ([td_id], [tr_id], [td_depature_time], [td_date], [td_ticket_price]) VALUES (N'DNNAV1001', N'DNNAV1', CAST(N'19:00:00' AS Time), CAST(N'2023-12-06' AS Date), 400000)
INSERT [dbo].[trip_detail] ([td_id], [tr_id], [td_depature_time], [td_date], [td_ticket_price]) VALUES (N'DNQN01001', N'DNQN01', CAST(N'12:00:00' AS Time), CAST(N'2023-12-03' AS Date), 150000)
INSERT [dbo].[trip_detail] ([td_id], [tr_id], [td_depature_time], [td_date], [td_ticket_price]) VALUES (N'DNSG01001', N'DNSG01', CAST(N'23:00:00' AS Time), CAST(N'2023-07-03' AS Date), 400000)
INSERT [dbo].[trip_detail] ([td_id], [tr_id], [td_depature_time], [td_date], [td_ticket_price]) VALUES (N'NADN01001', N'NADN01', CAST(N'19:00:00' AS Time), CAST(N'2023-12-04' AS Date), 300000)
INSERT [dbo].[trip_detail] ([td_id], [tr_id], [td_depature_time], [td_date], [td_ticket_price]) VALUES (N'NADNV1001', N'NADNV1', CAST(N'19:00:00' AS Time), CAST(N'2023-12-04' AS Date), 400000)
INSERT [dbo].[trip_detail] ([td_id], [tr_id], [td_depature_time], [td_date], [td_ticket_price]) VALUES (N'QNDA01001', N'QNDN01', CAST(N'14:00:00' AS Time), CAST(N'2023-12-03' AS Date), 150000)
INSERT [dbo].[trip_detail] ([td_id], [tr_id], [td_depature_time], [td_date], [td_ticket_price]) VALUES (N'QNDNV1001', N'QNDNV1', CAST(N'14:00:00' AS Time), CAST(N'2023-12-03' AS Date), 250000)
GO
INSERT [dbo].[trip_of_bus] ([tr_id], [tr_starting_point], [tr_destination], [tr_total_seat], [tr_during], [tr_bus_code]) VALUES (N'DNHNV1', 15, 24, 24, 14, N'43A0123  ')
INSERT [dbo].[trip_of_bus] ([tr_id], [tr_starting_point], [tr_destination], [tr_total_seat], [tr_during], [tr_bus_code]) VALUES (N'DNHTV1', 15, 25, 24, 7, N'43A69696 ')
INSERT [dbo].[trip_of_bus] ([tr_id], [tr_starting_point], [tr_destination], [tr_total_seat], [tr_during], [tr_bus_code]) VALUES (N'DNNA01', 15, 41, 36, 8, N'43A45678 ')
INSERT [dbo].[trip_of_bus] ([tr_id], [tr_starting_point], [tr_destination], [tr_total_seat], [tr_during], [tr_bus_code]) VALUES (N'DNNAV1', 15, 41, 24, 8, N'43A45679 ')
INSERT [dbo].[trip_of_bus] ([tr_id], [tr_starting_point], [tr_destination], [tr_total_seat], [tr_during], [tr_bus_code]) VALUES (N'DNQN01', 15, 47, 36, 1, N'43A12345 ')
INSERT [dbo].[trip_of_bus] ([tr_id], [tr_starting_point], [tr_destination], [tr_total_seat], [tr_during], [tr_bus_code]) VALUES (N'DNQNV1', 15, 47, 24, 1, N'43A12346 ')
INSERT [dbo].[trip_of_bus] ([tr_id], [tr_starting_point], [tr_destination], [tr_total_seat], [tr_during], [tr_bus_code]) VALUES (N'DNSG01', 15, 29, 36, 17, N'43A0123  ')
INSERT [dbo].[trip_of_bus] ([tr_id], [tr_starting_point], [tr_destination], [tr_total_seat], [tr_during], [tr_bus_code]) VALUES (N'NADN01', 41, 15, 36, 8, N'43A45678 ')
INSERT [dbo].[trip_of_bus] ([tr_id], [tr_starting_point], [tr_destination], [tr_total_seat], [tr_during], [tr_bus_code]) VALUES (N'NADNV1', 41, 15, 24, 8, N'43A45679 ')
INSERT [dbo].[trip_of_bus] ([tr_id], [tr_starting_point], [tr_destination], [tr_total_seat], [tr_during], [tr_bus_code]) VALUES (N'QNDN01', 47, 15, 36, 1, N'43A12345 ')
INSERT [dbo].[trip_of_bus] ([tr_id], [tr_starting_point], [tr_destination], [tr_total_seat], [tr_during], [tr_bus_code]) VALUES (N'QNDNV1', 47, 15, 24, 1, N'43A12346 ')
GO
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100101', N'DNNA01001', 1, 0)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100102', N'DNNA01001', 2, 0)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100103', N'DNNA01001', 3, 0)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100104', N'DNNA01001', 4, 0)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100105', N'DNNA01001', 5, 0)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100106', N'DNNA01001', 6, 0)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100107', N'DNNA01001', 7, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100108', N'DNNA01001', 8, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100109', N'DNNA01001', 9, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100110', N'DNNA01001', 10, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100111', N'DNNA01001', 11, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100112', N'DNNA01001', 12, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100113', N'DNNA01001', 13, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100114', N'DNNA01001', 14, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100115', N'DNNA01001', 15, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100116', N'DNNA01001', 16, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100117', N'DNNA01001', 17, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100118', N'DNNA01001', 18, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100119', N'DNNA01001', 19, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100120', N'DNNA01001', 20, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100121', N'DNNA01001', 21, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100122', N'DNNA01001', 22, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100123', N'DNNA01001', 23, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100124', N'DNNA01001', 24, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100125', N'DNNA01001', 25, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100126', N'DNNA01001', 26, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100127', N'DNNA01001', 27, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100128', N'DNNA01001', 28, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100129', N'DNNA01001', 29, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100130', N'DNNA01001', 30, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100131', N'DNNA01001', 31, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100132', N'DNNA01001', 32, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100133', N'DNNA01001', 33, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100134', N'DNNA01001', 34, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100135', N'DNNA01001', 35, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNA0100136', N'DNNA01001', 36, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNAV100101', N'DNNAV1001', 1, 0)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNAV100102', N'DNNAV1001', 2, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNAV100103', N'DNNAV1001', 3, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNAV100104', N'DNNAV1001', 4, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNAV100105', N'DNNAV1001', 5, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNAV100106', N'DNNAV1001', 6, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNAV100107', N'DNNAV1001', 7, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNAV100108', N'DNNAV1001', 8, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNAV100109', N'DNNAV1001', 9, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNAV100110', N'DNNAV1001', 10, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNAV100111', N'DNNAV1001', 11, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNAV100112', N'DNNAV1001', 12, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNAV100113', N'DNNAV1001', 13, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNAV100114', N'DNNAV1001', 14, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNAV100115', N'DNNAV1001', 15, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNAV100116', N'DNNAV1001', 16, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNAV100117', N'DNNAV1001', 17, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNAV100118', N'DNNAV1001', 18, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNAV100119', N'DNNAV1001', 19, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNAV100120', N'DNNAV1001', 20, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNAV100121', N'DNNAV1001', 21, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNAV100122', N'DNNAV1001', 22, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNAV100123', N'DNNAV1001', 23, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNNAV100124', N'DNNAV1001', 24, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100101', N'DNQN01001', 1, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100102', N'DNQN01001', 2, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100103', N'DNQN01001', 3, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100104', N'DNQN01001', 4, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100105', N'DNQN01001', 5, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100106', N'DNQN01001', 6, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100107', N'DNQN01001', 7, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100108', N'DNQN01001', 8, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100109', N'DNQN01001', 9, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100110', N'DNQN01001', 10, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100111', N'DNQN01001', 11, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100112', N'DNQN01001', 12, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100113', N'DNQN01001', 13, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100114', N'DNQN01001', 14, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100115', N'DNQN01001', 15, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100116', N'DNQN01001', 16, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100117', N'DNQN01001', 17, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100118', N'DNQN01001', 18, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100119', N'DNQN01001', 19, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100120', N'DNQN01001', 20, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100121', N'DNQN01001', 21, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100122', N'DNQN01001', 22, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100123', N'DNQN01001', 23, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100124', N'DNQN01001', 24, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100125', N'DNQN01001', 25, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100126', N'DNQN01001', 26, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100127', N'DNQN01001', 27, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100128', N'DNQN01001', 28, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100129', N'DNQN01001', 29, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100130', N'DNQN01001', 30, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100131', N'DNQN01001', 31, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100132', N'DNQN01001', 32, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100133', N'DNQN01001', 33, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100134', N'DNQN01001', 34, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100135', N'DNQN01001', 35, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNQN0100136', N'DNQN01001', 36, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100101', N'DNSG01001', 1, 0)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100102', N'DNSG01001', 2, 0)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100103', N'DNSG01001', 3, 0)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100104', N'DNSG01001', 4, 1)
GO
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100105', N'DNSG01001', 5, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100106', N'DNSG01001', 6, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100107', N'DNSG01001', 7, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100108', N'DNSG01001', 8, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100109', N'DNSG01001', 9, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100110', N'DNSG01001', 10, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100111', N'DNSG01001', 11, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100112', N'DNSG01001', 12, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100113', N'DNSG01001', 13, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100114', N'DNSG01001', 14, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100115', N'DNSG01001', 15, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100116', N'DNSG01001', 16, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100117', N'DNSG01001', 17, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100118', N'DNSG01001', 18, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100119', N'DNSG01001', 19, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100120', N'DNSG01001', 20, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100121', N'DNSG01001', 21, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100122', N'DNSG01001', 22, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100123', N'DNSG01001', 23, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100124', N'DNSG01001', 24, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100125', N'DNSG01001', 25, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100126', N'DNSG01001', 26, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100127', N'DNSG01001', 27, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100128', N'DNSG01001', 28, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100129', N'DNSG01001', 29, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100130', N'DNSG01001', 30, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100131', N'DNSG01001', 31, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100132', N'DNSG01001', 32, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100133', N'DNSG01001', 33, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100134', N'DNSG01001', 34, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100135', N'DNSG01001', 35, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'DNSG0100136', N'DNSG01001', 36, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100101', N'NADN01001', 1, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100102', N'NADN01001', 2, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100103', N'NADN01001', 3, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100104', N'NADN01001', 4, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100105', N'NADN01001', 5, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100106', N'NADN01001', 6, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100107', N'NADN01001', 7, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100108', N'NADN01001', 8, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100109', N'NADN01001', 9, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100110', N'NADN01001', 10, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100111', N'NADN01001', 11, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100112', N'NADN01001', 12, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100113', N'NADN01001', 13, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100114', N'NADN01001', 14, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100115', N'NADN01001', 15, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100116', N'NADN01001', 16, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100117', N'NADN01001', 17, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100118', N'NADN01001', 18, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100119', N'NADN01001', 19, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100120', N'NADN01001', 20, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100121', N'NADN01001', 21, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100122', N'NADN01001', 22, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100123', N'NADN01001', 23, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100124', N'NADN01001', 24, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100125', N'NADN01001', 25, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100126', N'NADN01001', 26, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100127', N'NADN01001', 27, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100128', N'NADN01001', 28, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100129', N'NADN01001', 29, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100130', N'NADN01001', 30, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100131', N'NADN01001', 31, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100132', N'NADN01001', 32, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100133', N'NADN01001', 33, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100134', N'NADN01001', 34, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100135', N'NADN01001', 35, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADN0100136', N'NADN01001', 36, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADNV100101', N'NADNV1001', 1, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADNV100102', N'NADNV1001', 2, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADNV100103', N'NADNV1001', 3, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADNV100104', N'NADNV1001', 4, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADNV100105', N'NADNV1001', 5, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADNV100106', N'NADNV1001', 6, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADNV100107', N'NADNV1001', 7, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADNV100108', N'NADNV1001', 8, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADNV100109', N'NADNV1001', 9, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADNV100110', N'NADNV1001', 10, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADNV100111', N'NADNV1001', 11, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADNV100112', N'NADNV1001', 12, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADNV100113', N'NADNV1001', 13, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADNV100114', N'NADNV1001', 14, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADNV100115', N'NADNV1001', 15, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADNV100116', N'NADNV1001', 16, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADNV100117', N'NADNV1001', 17, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADNV100118', N'NADNV1001', 18, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADNV100119', N'NADNV1001', 19, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADNV100120', N'NADNV1001', 20, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADNV100121', N'NADNV1001', 21, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADNV100122', N'NADNV1001', 22, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADNV100123', N'NADNV1001', 23, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'NADNV100124', N'NADNV1001', 24, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100101', N'QNDA01001', 1, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100102', N'QNDA01001', 2, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100103', N'QNDA01001', 3, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100104', N'QNDA01001', 4, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100105', N'QNDA01001', 5, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100106', N'QNDA01001', 6, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100107', N'QNDA01001', 7, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100108', N'QNDA01001', 8, 1)
GO
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100109', N'QNDA01001', 9, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100110', N'QNDA01001', 10, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100111', N'QNDA01001', 11, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100112', N'QNDA01001', 12, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100113', N'QNDA01001', 13, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100114', N'QNDA01001', 14, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100115', N'QNDA01001', 15, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100116', N'QNDA01001', 16, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100117', N'QNDA01001', 17, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100118', N'QNDA01001', 18, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100119', N'QNDA01001', 19, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100120', N'QNDA01001', 20, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100121', N'QNDA01001', 21, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100122', N'QNDA01001', 22, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100123', N'QNDA01001', 23, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100124', N'QNDA01001', 24, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100125', N'QNDA01001', 25, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100126', N'QNDA01001', 26, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100127', N'QNDA01001', 27, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100128', N'QNDA01001', 28, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100129', N'QNDA01001', 29, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100130', N'QNDA01001', 30, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100131', N'QNDA01001', 31, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100132', N'QNDA01001', 32, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100133', N'QNDA01001', 33, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100134', N'QNDA01001', 34, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100135', N'QNDA01001', 35, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDA0100136', N'QNDA01001', 36, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDNV100101', N'QNDNV1001', 1, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDNV100102', N'QNDNV1001', 2, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDNV100103', N'QNDNV1001', 3, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDNV100104', N'QNDNV1001', 4, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDNV100105', N'QNDNV1001', 5, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDNV100106', N'QNDNV1001', 6, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDNV100107', N'QNDNV1001', 7, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDNV100108', N'QNDNV1001', 8, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDNV100109', N'QNDNV1001', 9, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDNV100110', N'QNDNV1001', 10, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDNV100111', N'QNDNV1001', 11, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDNV100112', N'QNDNV1001', 12, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDNV100113', N'QNDNV1001', 13, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDNV100114', N'QNDNV1001', 14, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDNV100115', N'QNDNV1001', 15, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDNV100116', N'QNDNV1001', 16, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDNV100117', N'QNDNV1001', 17, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDNV100118', N'QNDNV1001', 18, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDNV100119', N'QNDNV1001', 19, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDNV100120', N'QNDNV1001', 20, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDNV100121', N'QNDNV1001', 21, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDNV100122', N'QNDNV1001', 22, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDNV100123', N'QNDNV1001', 23, 1)
INSERT [dbo].[trip_seat_detail] ([ts_id], [td_id], [se_id], [se_status]) VALUES (N'QNDNV100124', N'QNDNV1001', 24, 1)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__customer__B44355D0BCD03422]    Script Date: 06/07/2023 10:07:53 CH ******/
ALTER TABLE [dbo].[customer] ADD UNIQUE NONCLUSTERED 
(
	[c_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__notifica__F073E3AAC41D186A]    Script Date: 06/07/2023 10:07:53 CH ******/
ALTER TABLE [dbo].[notification] ADD UNIQUE NONCLUSTERED 
(
	[no_title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__role__92CB0F55B54DA2B2]    Script Date: 06/07/2023 10:07:53 CH ******/
ALTER TABLE [dbo].[role] ADD UNIQUE NONCLUSTERED 
(
	[r_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__seat__B459E0938FEFFA0B]    Script Date: 06/07/2023 10:07:53 CH ******/
ALTER TABLE [dbo].[seat] ADD UNIQUE NONCLUSTERED 
(
	[se_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UNIQUE_TRIP_DETAIL]    Script Date: 06/07/2023 10:07:53 CH ******/
ALTER TABLE [dbo].[trip_detail] ADD  CONSTRAINT [UNIQUE_TRIP_DETAIL] UNIQUE NONCLUSTERED 
(
	[tr_id] ASC,
	[td_depature_time] ASC,
	[td_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UNIQUE_SEAT_TRIP_DETAIL]    Script Date: 06/07/2023 10:07:53 CH ******/
ALTER TABLE [dbo].[trip_seat_detail] ADD  CONSTRAINT [UNIQUE_SEAT_TRIP_DETAIL] UNIQUE NONCLUSTERED 
(
	[td_id] ASC,
	[se_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[booking]  WITH CHECK ADD FOREIGN KEY([c_phone])
REFERENCES [dbo].[customer] ([c_phone])
GO
ALTER TABLE [dbo].[booking]  WITH CHECK ADD FOREIGN KEY([ts_id])
REFERENCES [dbo].[trip_seat_detail] ([ts_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[employee_account]  WITH CHECK ADD FOREIGN KEY([r_id])
REFERENCES [dbo].[role] ([r_id])
GO
ALTER TABLE [dbo].[route]  WITH CHECK ADD FOREIGN KEY([st_id])
REFERENCES [dbo].[station] ([st_id])
GO
ALTER TABLE [dbo].[route]  WITH CHECK ADD FOREIGN KEY([tr_id])
REFERENCES [dbo].[trip_of_bus] ([tr_id])
GO
ALTER TABLE [dbo].[trip_detail]  WITH CHECK ADD FOREIGN KEY([tr_id])
REFERENCES [dbo].[trip_of_bus] ([tr_id])
GO
ALTER TABLE [dbo].[trip_of_bus]  WITH CHECK ADD FOREIGN KEY([tr_destination])
REFERENCES [dbo].[station] ([st_id])
GO
ALTER TABLE [dbo].[trip_of_bus]  WITH CHECK ADD FOREIGN KEY([tr_starting_point])
REFERENCES [dbo].[station] ([st_id])
GO
ALTER TABLE [dbo].[trip_seat_detail]  WITH CHECK ADD FOREIGN KEY([se_id])
REFERENCES [dbo].[seat] ([se_id])
GO
ALTER TABLE [dbo].[trip_seat_detail]  WITH CHECK ADD FOREIGN KEY([td_id])
REFERENCES [dbo].[trip_detail] ([td_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[booking]  WITH CHECK ADD CHECK  (([b_status]='refunding' OR [b_status]='canceled' OR [b_status]='paid' OR [b_status]='order'))
GO
ALTER TABLE [dbo].[employee_account]  WITH CHECK ADD CHECK  (([status]='disable' OR [status]='enable'))
GO
ALTER TABLE [dbo].[role]  WITH CHECK ADD CHECK  (([r_name]='admin' OR [r_name]='employee'))
GO
USE [master]
GO
ALTER DATABASE [fuda_bus_ticket_booking] SET  READ_WRITE 
GO
