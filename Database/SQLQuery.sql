USE [master]
GO
/****** Object:  Database [WebNC]    Script Date: 7/12/2022 11:13:30 AM ******/
CREATE DATABASE [WebNC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebNC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.XUANCUONG\MSSQL\DATA\WebNC.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebNC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.XUANCUONG\MSSQL\DATA\WebNC_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WebNC] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebNC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebNC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebNC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebNC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebNC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebNC] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebNC] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [WebNC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebNC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebNC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebNC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebNC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebNC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebNC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebNC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebNC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebNC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebNC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebNC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebNC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebNC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebNC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebNC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebNC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebNC] SET  MULTI_USER 
GO
ALTER DATABASE [WebNC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebNC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebNC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebNC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebNC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebNC] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [WebNC] SET QUERY_STORE = OFF
GO
USE [WebNC]
GO
/****** Object:  Table [dbo].[tbl_CTGioHang]    Script Date: 7/12/2022 11:13:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CTGioHang](
	[sID_CTGioHang] [int] NOT NULL,
	[sID_SanPham] [nvarchar](20) NULL,
	[iSoluongmua] [int] NULL,
	[fThanhTien] [float] NOT NULL,
	[sUserName] [nvarchar](50) NULL,
	[sCheck] [nvarchar](1) NULL,
 CONSTRAINT [PK_tbl_CTGioHang] PRIMARY KEY CLUSTERED 
(
	[sID_CTGioHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CTHoaDon]    Script Date: 7/12/2022 11:13:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CTHoaDon](
	[sID_HoaDon] [nvarchar](50) NOT NULL,
	[sID_SanPham] [nvarchar](20) NOT NULL,
	[iSoluongmua] [int] NULL,
	[fDongia] [float] NULL,
	[sID_CTHoaDon] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DanhGia]    Script Date: 7/12/2022 11:13:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DanhGia](
	[sID_DanhGia] [nvarchar](50) NOT NULL,
	[sBinhLuan] [nvarchar](100) NULL,
	[sUserName] [nvarchar](50) NULL,
	[sID_SanPham] [nvarchar](20) NULL,
	[dThoigian] [datetime] NULL,
	[iStar] [int] NULL,
 CONSTRAINT [PK_tbl_DanhGia1] PRIMARY KEY CLUSTERED 
(
	[sID_DanhGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_LoaiHang]    Script Date: 7/12/2022 11:13:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_LoaiHang](
	[sID_LoaiHang] [nvarchar](50) NOT NULL,
	[sTenLoaiHang] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_LoaiHang] PRIMARY KEY CLUSTERED 
(
	[sID_LoaiHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_SanPham]    Script Date: 7/12/2022 11:13:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_SanPham](
	[sID_SanPham] [nvarchar](20) NOT NULL,
	[sTenSanPham] [nvarchar](100) NULL,
	[fDongia] [float] NULL,
	[iSoluong_Kho] [int] NULL,
	[sImg] [nvarchar](50) NULL,
	[sMota_1] [nvarchar](200) NULL,
	[sMota_2] [nvarchar](200) NULL,
	[sMota_3] [nvarchar](200) NULL,
	[sID_LoaiHang] [nvarchar](50) NULL,
	[sNhaSanXuat] [nvarchar](50) NULL,
	[fSale] [float] NULL,
	[fGiamgia]  AS (([fDongia]*((100)-[fSale]))/(100)),
 CONSTRAINT [PK_tbl_SanPham1] PRIMARY KEY CLUSTERED 
(
	[sID_SanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 7/12/2022 11:13:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_User](
	[sUserName] [nvarchar](50) NOT NULL,
	[sPassWord] [nvarchar](20) NULL,
	[sHoTen] [nvarchar](20) NULL,
	[iType] [int] NULL,
	[sMoTa] [nvarchar](20) NULL,
 CONSTRAINT [PK_tbl_User] PRIMARY KEY CLUSTERED 
(
	[sUserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHoaDon]    Script Date: 7/12/2022 11:13:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHoaDon](
	[sID_HoaDon] [nvarchar](50) NOT NULL,
	[sUserName] [nvarchar](50) NOT NULL,
	[sDiachi] [nvarchar](100) NULL,
	[sTrangthai] [nvarchar](50) NULL,
	[sSdt] [nvarchar](50) NULL,
	[sGhichu] [nvarchar](50) NULL,
	[sTongtien] [float] NULL,
	[sPhuongthuc] [nvarchar](50) NULL,
	[dNgaylap] [datetime] NULL,
 CONSTRAINT [PK_tblHoaDon] PRIMARY KEY CLUSTERED 
(
	[sID_HoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_CTGioHang]  WITH CHECK ADD  CONSTRAINT [FK_tbl_CTGioHang_tbl_SanPham] FOREIGN KEY([sID_SanPham])
REFERENCES [dbo].[tbl_SanPham] ([sID_SanPham])
GO
ALTER TABLE [dbo].[tbl_CTGioHang] CHECK CONSTRAINT [FK_tbl_CTGioHang_tbl_SanPham]
GO
ALTER TABLE [dbo].[tbl_CTGioHang]  WITH CHECK ADD  CONSTRAINT [FK_tbl_CTGioHang_tbl_User] FOREIGN KEY([sUserName])
REFERENCES [dbo].[tbl_User] ([sUserName])
GO
ALTER TABLE [dbo].[tbl_CTGioHang] CHECK CONSTRAINT [FK_tbl_CTGioHang_tbl_User]
GO
ALTER TABLE [dbo].[tbl_CTHoaDon]  WITH CHECK ADD  CONSTRAINT [fk_cthoadon_hoadon] FOREIGN KEY([sID_HoaDon])
REFERENCES [dbo].[tblHoaDon] ([sID_HoaDon])
GO
ALTER TABLE [dbo].[tbl_CTHoaDon] CHECK CONSTRAINT [fk_cthoadon_hoadon]
GO
ALTER TABLE [dbo].[tbl_CTHoaDon]  WITH CHECK ADD  CONSTRAINT [fk_cthoadon_sanpham] FOREIGN KEY([sID_SanPham])
REFERENCES [dbo].[tbl_SanPham] ([sID_SanPham])
GO
ALTER TABLE [dbo].[tbl_CTHoaDon] CHECK CONSTRAINT [fk_cthoadon_sanpham]
GO
ALTER TABLE [dbo].[tbl_DanhGia]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DanhGia_tbl_SanPham] FOREIGN KEY([sID_SanPham])
REFERENCES [dbo].[tbl_SanPham] ([sID_SanPham])
GO
ALTER TABLE [dbo].[tbl_DanhGia] CHECK CONSTRAINT [FK_tbl_DanhGia_tbl_SanPham]
GO
ALTER TABLE [dbo].[tbl_SanPham]  WITH CHECK ADD  CONSTRAINT [FK_tbl_SanPham_tbl_LoaiHang] FOREIGN KEY([sID_LoaiHang])
REFERENCES [dbo].[tbl_LoaiHang] ([sID_LoaiHang])
GO
ALTER TABLE [dbo].[tbl_SanPham] CHECK CONSTRAINT [FK_tbl_SanPham_tbl_LoaiHang]
GO
ALTER TABLE [dbo].[tblHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_tblHoaDon_tbl_User] FOREIGN KEY([sUserName])
REFERENCES [dbo].[tbl_User] ([sUserName])
GO
ALTER TABLE [dbo].[tblHoaDon] CHECK CONSTRAINT [FK_tblHoaDon_tbl_User]
GO
/****** Object:  StoredProcedure [dbo].[getGiatangGiam]    Script Date: 7/12/2022 11:13:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getGiatangGiam]
(
	@sID_LoaiHang nvarchar(50),
	@Orderby nvarchar(50)
)
	AS 
	IF @Orderby='default'
	Select sID_SanPham, sTenSanPham, sImg, fDongia, fGiamgia from tbl_SanPham where sID_LoaiHang = @sID_LoaiHang 
	ELSE IF @Orderby = 'asc'
		Select sID_SanPham, sTenSanPham, sImg, fDongia, fGiamgia from tbl_SanPham where sID_LoaiHang = @sID_LoaiHang ORDER BY fGiamgia ASC
		ELSE
		Select sID_SanPham, sTenSanPham, sImg, fDongia, fGiamgia from tbl_SanPham where sID_LoaiHang = @sID_LoaiHang ORDER BY fGiamgia DESC
GO
/****** Object:  StoredProcedure [dbo].[getGiatangGiamNSX]    Script Date: 7/12/2022 11:13:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getGiatangGiamNSX]
(
	@sID_LoaiHang nvarchar(50),
	@Orderby nvarchar(50),
	@nsx nvarchar(50)
)
	AS 
	IF @Orderby='default'
	Select sID_SanPham, sTenSanPham, sImg, fDongia, fGiamgia from tbl_SanPham where sID_LoaiHang = @sID_LoaiHang AND sNhaSanXuat = @nsx
	ELSE IF @Orderby = 'asc'
		Select sID_SanPham, sTenSanPham, sImg, fDongia, fGiamgia from tbl_SanPham where sID_LoaiHang = @sID_LoaiHang AND sNhaSanXuat = @nsx ORDER BY fGiamgia ASC
		ELSE
		Select sID_SanPham, sTenSanPham, sImg, fDongia, fGiamgia from tbl_SanPham where sID_LoaiHang = @sID_LoaiHang AND sNhaSanXuat = @nsx ORDER BY fGiamgia DESC
GO
USE [master]
GO
ALTER DATABASE [WebNC] SET  READ_WRITE 
GO
