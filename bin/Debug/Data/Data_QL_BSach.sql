USE [master]
GO
/****** Object:  Database [QL_BSach]    Script Date: 25-May-22 9:06:09 AM ******/
CREATE DATABASE [QL_BSach]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QL_BSach', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.TUANDAT\MSSQL\DATA\QL_BSach.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QL_BSach_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.TUANDAT\MSSQL\DATA\QL_BSach_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QL_BSach] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QL_BSach].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QL_BSach] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QL_BSach] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QL_BSach] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QL_BSach] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QL_BSach] SET ARITHABORT OFF 
GO
ALTER DATABASE [QL_BSach] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QL_BSach] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QL_BSach] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QL_BSach] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QL_BSach] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QL_BSach] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QL_BSach] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QL_BSach] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QL_BSach] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QL_BSach] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QL_BSach] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QL_BSach] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QL_BSach] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QL_BSach] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QL_BSach] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QL_BSach] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QL_BSach] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QL_BSach] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QL_BSach] SET RECOVERY FULL 
GO
ALTER DATABASE [QL_BSach] SET  MULTI_USER 
GO
ALTER DATABASE [QL_BSach] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QL_BSach] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QL_BSach] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QL_BSach] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QL_BSach', N'ON'
GO
USE [QL_BSach]
GO
/****** Object:  StoredProcedure [dbo].[sap_xep_don_ban_hang_sl]    Script Date: 25-May-22 9:06:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sap_xep_don_ban_hang_sl]
as
begin
	select maDonBan, nv.tenNV, kh.tenKH, ngayBan, soLuong, tongTien  
	from DonBanHang db, NhanVien nv, KhachHang kh 
	where db.maNV = nv.maNV and db.maKH = kh.maKH order by 5 DESC
end
GO
/****** Object:  StoredProcedure [dbo].[sap_xep_don_ban_hang_tong_tien]    Script Date: 25-May-22 9:06:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sap_xep_don_ban_hang_tong_tien]
as
begin
	select maDonBan, nv.tenNV, kh.tenKH, ngayBan, soLuong, tongTien  
	from DonBanHang db, NhanVien nv, KhachHang kh 
	where db.maNV = nv.maNV and db.maKH = kh.maKH order by 6 DESC
end
GO
/****** Object:  StoredProcedure [dbo].[sap_xep_don_nhap_hang_sl]    Script Date: 25-May-22 9:06:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sap_xep_don_nhap_hang_sl]
as
begin
	select maDonNhap, tenNV, tenNCC, ngayNhap, soLuong, tongTienHD 
	from HoaDonNhapSach, NhanVien, NhaCungCap 
	where HoaDonNhapSach.maNV = NhanVien.maNV and HoaDonNhapSach.maNCC = NhaCungCap.maNCC
	order by 5 DESC
end
GO
/****** Object:  StoredProcedure [dbo].[sap_xep_don_nhap_hang_tong_tien]    Script Date: 25-May-22 9:06:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sap_xep_don_nhap_hang_tong_tien]
as
begin
	select maDonNhap, tenNV, tenNCC, ngayNhap, soLuong, tongTienHD 
	from HoaDonNhapSach, NhanVien, NhaCungCap 
	where HoaDonNhapSach.maNV = NhanVien.maNV and HoaDonNhapSach.maNCC = NhaCungCap.maNCC
	order by 6 DESC
end
GO
/****** Object:  StoredProcedure [dbo].[show_DB]    Script Date: 25-May-22 9:06:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[show_DB] @ngay DateTime
as
	begin
		set dateformat DMY
		select s.tenSach, ncc.tenNCC, SUM(ctb.soLuong) as tongSLBan, AVG(s.giaBan) as trungBinhGiaBan,
					 AVG(ctn.giaNhap) trungBinhGiaNhap, (AVG(s.giaBan) - AVG(ctn.giaNhap)) as doanhThu
		from THONGTINSACH s, CT_HoaDonNhapSach ctn, CT_DonBanHang ctb, DonBanHang dbh, HoaDonNhapSach dnh, NhaCungCap ncc
		where s.maSach = ctn.maSach and dnh.maDonNhap = ctn.maDonNhap and dnh.maNCC = ncc.maNCC
		and s.maSach = ctb.maSach and ctb.maDonBan = dbh.maDonBan and dbh.ngayBan = @ngay
		group by s.tenSach, ncc.tenNCC
	end

GO
/****** Object:  StoredProcedure [dbo].[show_DB_Quy_1]    Script Date: 25-May-22 9:06:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[show_DB_Quy_1]
as
	begin
		set dateformat DMY
		select s.tenSach, ncc.tenNCC, SUM(ctb.soLuong) as tongSLBan, AVG(s.giaBan) as trungBinhGiaBan,
					 AVG(ctn.giaNhap) trungBinhGiaNhap, (AVG(s.giaBan) - AVG(ctn.giaNhap)) as doanhThu
		from THONGTINSACH s, CT_HoaDonNhapSach ctn, CT_DonBanHang ctb, DonBanHang dbh, HoaDonNhapSach dnh, NhaCungCap ncc
		where s.maSach = ctn.maSach and dnh.maDonNhap = ctn.maDonNhap and dnh.maNCC = ncc.maNCC
		and s.maSach = ctb.maSach and ctb.maDonBan = dbh.maDonBan and (MONTH(dbh.ngayBan) between 1 and 6)
		group by s.tenSach, ncc.tenNCC
	end

GO
/****** Object:  StoredProcedure [dbo].[show_DB_Quy_2]    Script Date: 25-May-22 9:06:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[show_DB_Quy_2]
as
	begin
		set dateformat DMY
		select s.tenSach, ncc.tenNCC, SUM(ctb.soLuong) as tongSLBan, AVG(s.giaBan) as trungBinhGiaBan,
					 AVG(ctn.giaNhap) trungBinhGiaNhap, (AVG(s.giaBan) - AVG(ctn.giaNhap)) as doanhThu
		from THONGTINSACH s, CT_HoaDonNhapSach ctn, CT_DonBanHang ctb, DonBanHang dbh, HoaDonNhapSach dnh, NhaCungCap ncc
		where s.maSach = ctn.maSach and dnh.maDonNhap = ctn.maDonNhap and dnh.maNCC = ncc.maNCC
		and s.maSach = ctb.maSach and ctb.maDonBan = dbh.maDonBan and (MONTH(dbh.ngayBan) between 7 and 12)
		group by s.tenSach, ncc.tenNCC
	end

GO
/****** Object:  StoredProcedure [dbo].[show_DB_Thang]    Script Date: 25-May-22 9:06:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[show_DB_Thang] @thang int
as
	begin
		set dateformat DMY
		select s.tenSach, ncc.tenNCC, SUM(ctb.soLuong) as tongSLBan, AVG(s.giaBan) as trungBinhGiaBan,
					 AVG(ctn.giaNhap) trungBinhGiaNhap, (AVG(s.giaBan) - AVG(ctn.giaNhap)) as doanhThu
		from THONGTINSACH s, CT_HoaDonNhapSach ctn, CT_DonBanHang ctb, DonBanHang dbh, HoaDonNhapSach dnh, NhaCungCap ncc
		where s.maSach = ctn.maSach and dnh.maDonNhap = ctn.maDonNhap and dnh.maNCC = ncc.maNCC
		and s.maSach = ctb.maSach and ctb.maDonBan = dbh.maDonBan and MONTH(dbh.ngayBan) = @thang
		group by s.tenSach, ncc.tenNCC
	end

GO
/****** Object:  StoredProcedure [dbo].[show_hoadonnhaphang]    Script Date: 25-May-22 9:06:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[show_hoadonnhaphang] @mahoadon char(20)
as
	begin
		select CT_HoaDonNhapSach.maDonNhap,HoaDonNhapSach.maNV,tenNV,tenNCC,ngayNhap,tenSach,CT_HoaDonNhapSach.soLuongNhap,CT_HoaDonNhapSach.giaNhap,CT_HoaDonNhapSach.thanhtien
		from CT_HoaDonNhapSach,HoaDonNhapSach,NhanVien,ThongTinSach,NhaCungCap
		WHERE CT_HoaDonNhapSach.maDonNhap=HoaDonNhapSach.maDonNhap AND HoaDonNhapSach.maNV=NhanVien.maNV AND HoaDonNhapSach.maNCC=NhaCungCap.maNCC
		 AND CT_HoaDonNhapSach.maSach=ThongTinSach.maSach
		  AND CT_HoaDonNhapSach.maDonNhap=@mahoadon
	end

GO
/****** Object:  StoredProcedure [dbo].[show_thanhtoan]    Script Date: 25-May-22 9:06:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[show_thanhtoan] @mahoadon char(20)
as
	begin
		select CT_DonBanHang.maDonBan,tenKH,TenNV,ngayBan,TenSach,CT_DonBanHang.soLuong,CT_DonBanHang.DonGiaBan,CT_DonBanHang.TongTien, DonBanHang.tongTien
		from CT_DonBanHang,DonBanHang,KhachHang,NhanVien,ThongTinSach
		WHERE CT_DonBanHang.maDonBan=DonBanHang.maDonBan AND DonBanHang.maKH=KhachHang.maKH AND DonBanHang.maNV=NhanVien.maNV AND CT_DonBanHang.maSach=ThongTinSach.maSach
		  AND CT_DonBanHang.maDonBan=@mahoadon
	end

GO
/****** Object:  StoredProcedure [dbo].[tim_kiem_don_ban_manv_kh]    Script Date: 25-May-22 9:06:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tim_kiem_don_ban_manv_kh]
as
	begin
		select maDonBan, nv.tenNV, kh.tenKH, ngayBan, soLuong, tongTien , db.maNV, db.maKH, SoDT, sdt
		from DonBanHang db, NhanVien nv, KhachHang kh 
		where db.maNV = nv.maNV and db.maKH = kh.maKH 
	end

GO
/****** Object:  StoredProcedure [dbo].[tim_kiem_don_ban_ngay]    Script Date: 25-May-22 9:06:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tim_kiem_don_ban_ngay] @ngay date
as
	begin
		set dateformat DMY
		select maDonBan, nv.tenNV, kh.tenKH, ngayBan, soLuong, tongTien  
		from DonBanHang db, NhanVien nv, KhachHang kh 
		where db.maNV = nv.maNV and db.maKH = kh.maKH and db.ngayBan = @ngay
	end

GO
/****** Object:  StoredProcedure [dbo].[tim_kiem_don_nhap_manv_ncc]    Script Date: 25-May-22 9:06:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tim_kiem_don_nhap_manv_ncc]
as
	begin
		select maDonNhap, tenNV, tenNCC, ngayNhap, soLuong, tongTienHD, HoaDonNhapSach.maNV, HoaDonNhapSach.maNCC, SoDT, sdt 
		from HoaDonNhapSach, NhanVien, NhaCungCap 
		where HoaDonNhapSach.maNV = NhanVien.maNV and HoaDonNhapSach.maNCC = NhaCungCap.maNCC
	end

GO
/****** Object:  StoredProcedure [dbo].[tim_kiem_don_nhap_ngay]    Script Date: 25-May-22 9:06:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tim_kiem_don_nhap_ngay] @ngay date
as
	begin
		select maDonNhap, tenNV, tenNCC, ngayNhap, soLuong, tongTienHD 
		from HoaDonNhapSach, NhanVien, NhaCungCap 
		where HoaDonNhapSach.maNV = NhanVien.maNV and HoaDonNhapSach.maNCC = NhaCungCap.maNCC and ngayNhap = @ngay
	end

GO
/****** Object:  StoredProcedure [dbo].[tim_kiem_sach]    Script Date: 25-May-22 9:06:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tim_kiem_sach] @dieukien nvarchar(100)
as
begin
	select maSach, tenSach, tacGia, nhaXB, namXB, theLoai, giaBan from THONGTINSACH
	where (tenSach LIKE '%' + @dieukien + '%' or tacGia LIKE '%' + @dieukien + '%' or nhaXB LIKE '%' + @dieukien + '%'
	or theLoai LIKE '%' + @dieukien + '%')
end
GO
/****** Object:  StoredProcedure [dbo].[tim_kiem_sach_giaban]    Script Date: 25-May-22 9:06:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tim_kiem_sach_giaban] @dieukien nvarchar(100), @giabanmin int, @giabanmax int
as
begin
	select maSach, tenSach, tacGia, nhaXB, namXB, theLoai, giaBan from THONGTINSACH
	where (tenSach LIKE '%' + @dieukien + '%' or tacGia LIKE '%' + @dieukien + '%' or nhaXB LIKE '%' + @dieukien + '%'
	or theLoai LIKE '%' + @dieukien + '%') and (giaBan BETWEEN @giabanmin and @giabanmax )
end
GO
/****** Object:  StoredProcedure [dbo].[tim_kiem_sach_namxb_giaban]    Script Date: 25-May-22 9:06:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tim_kiem_sach_namxb_giaban] @dieukien int, @giabanmin int, @giabanmax int
as
begin
	select maSach, tenSach, tacGia, nhaXB, namXB, theLoai, giaBan from THONGTINSACH
	where namXB = @dieukien and (giaBan BETWEEN @giabanmin and @giabanmax )
end
GO
/****** Object:  StoredProcedure [dbo].[tim_kiem_sach_theo_namxb]    Script Date: 25-May-22 9:06:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tim_kiem_sach_theo_namxb] @dieukien int
as
begin
	select maSach, tenSach, tacGia, nhaXB, namXB, theLoai, giaBan from THONGTINSACH
	where namXB = @dieukien
end
GO
/****** Object:  Table [dbo].[CT_DonBanHang]    Script Date: 25-May-22 9:06:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CT_DonBanHang](
	[maDonBan] [char](10) NOT NULL,
	[maSach] [char](10) NOT NULL,
	[soLuong] [int] NULL,
	[DonGiaBan] [int] NULL,
	[TongTien] [int] NULL,
 CONSTRAINT [PK_CT_DonBanHang] PRIMARY KEY CLUSTERED 
(
	[maDonBan] ASC,
	[maSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CT_HoaDonNhapSach]    Script Date: 25-May-22 9:06:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CT_HoaDonNhapSach](
	[maDonNhap] [char](10) NOT NULL,
	[maSach] [char](10) NOT NULL,
	[soLuongNhap] [int] NULL,
	[giaNhap] [int] NULL,
	[thanhtien] [int] NULL,
 CONSTRAINT [PK_CT_DonNhapHang] PRIMARY KEY CLUSTERED 
(
	[maDonNhap] ASC,
	[maSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DonBanHang]    Script Date: 25-May-22 9:06:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DonBanHang](
	[maDonBan] [char](10) NOT NULL,
	[maNV] [nchar](10) NULL,
	[maKH] [char](10) NULL,
	[ngayBan] [date] NULL,
	[soLuong] [int] NULL,
	[tongTien] [int] NULL,
 CONSTRAINT [PK_DonBanHang] PRIMARY KEY CLUSTERED 
(
	[maDonBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoaDonNhapSach]    Script Date: 25-May-22 9:06:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoaDonNhapSach](
	[maDonNhap] [char](10) NOT NULL,
	[maNV] [nchar](10) NULL,
	[maNCC] [char](10) NULL,
	[ngayNhap] [date] NULL,
	[soLuong] [int] NULL,
	[tongTienHD] [int] NULL,
 CONSTRAINT [PK_DonNhapHang] PRIMARY KEY CLUSTERED 
(
	[maDonNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 25-May-22 9:06:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[maKH] [char](10) NOT NULL,
	[tenKH] [nvarchar](50) NULL,
	[sdt] [char](11) NULL,
	[email] [nvarchar](100) NULL,
	[diaChi] [nvarchar](100) NULL,
	[tinhTrang] [nvarchar](100) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[maKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 25-May-22 9:06:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[maNCC] [char](10) NOT NULL,
	[tenNCC] [nvarchar](100) NULL,
	[sdt] [char](11) NULL,
	[email] [nvarchar](100) NULL,
	[diaChi] [nvarchar](100) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[maNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 25-May-22 9:06:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[maNV] [nchar](10) NOT NULL,
	[taiKhoan] [char](30) NULL,
	[matKhau] [char](30) NULL,
	[tenNV] [nvarchar](50) NULL,
	[ngaySinh] [date] NULL,
	[gioiTinh] [nvarchar](5) NULL,
	[emailNV] [nvarchar](100) NULL,
	[SoDT] [char](12) NULL,
	[anhNV] [nvarchar](100) NULL,
	[ID_ROLE] [int] NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[maNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PHANQUYEN]    Script Date: 25-May-22 9:06:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHANQUYEN](
	[ID_PP] [int] IDENTITY(1,1) NOT NULL,
	[ID_ROLE] [int] NULL,
	[TEN_ACTION] [nvarchar](50) NULL,
	[CODE_ACTION] [nvarchar](50) NULL,
 CONSTRAINT [PK_PHANQUYEN] PRIMARY KEY CLUSTERED 
(
	[ID_PP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SachTonKho]    Script Date: 25-May-22 9:06:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SachTonKho](
	[maSach] [char](10) NOT NULL,
	[SoLuongTon] [int] NULL,
 CONSTRAINT [PK_SachTonKho] PRIMARY KEY CLUSTERED 
(
	[maSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBL_ROLE]    Script Date: 25-May-22 9:06:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_ROLE](
	[ID_ROLE] [int] NOT NULL,
	[TEN_ROLE] [nvarchar](50) NULL,
 CONSTRAINT [PK_TBL_ROLE] PRIMARY KEY CLUSTERED 
(
	[ID_ROLE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[THONGTINSACH]    Script Date: 25-May-22 9:06:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[THONGTINSACH](
	[maSach] [char](10) NOT NULL,
	[tenSach] [nvarchar](100) NULL,
	[tacGia] [nvarchar](100) NULL,
	[nhaXB] [nvarchar](100) NULL,
	[namXB] [int] NULL,
	[theLoai] [nvarchar](100) NULL,
	[giaBan] [int] NULL,
	[anhSach] [nvarchar](100) NULL,
 CONSTRAINT [PK_ThongTinSach] PRIMARY KEY CLUSTERED 
(
	[maSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[CT_DonBanHang] ([maDonBan], [maSach], [soLuong], [DonGiaBan], [TongTien]) VALUES (N'HD001     ', N'S015      ', 2, 100000, 200000)
INSERT [dbo].[CT_DonBanHang] ([maDonBan], [maSach], [soLuong], [DonGiaBan], [TongTien]) VALUES (N'HD002     ', N'S011      ', 1, 200000, 200000)
INSERT [dbo].[CT_DonBanHang] ([maDonBan], [maSach], [soLuong], [DonGiaBan], [TongTien]) VALUES (N'HD002     ', N'S012      ', 2, 300000, 600000)
INSERT [dbo].[CT_DonBanHang] ([maDonBan], [maSach], [soLuong], [DonGiaBan], [TongTien]) VALUES (N'HD002     ', N'S013      ', 2, 560000, 1120000)
INSERT [dbo].[CT_DonBanHang] ([maDonBan], [maSach], [soLuong], [DonGiaBan], [TongTien]) VALUES (N'HD003     ', N'S019      ', 1, 400000, 400000)
INSERT [dbo].[CT_DonBanHang] ([maDonBan], [maSach], [soLuong], [DonGiaBan], [TongTien]) VALUES (N'HD004     ', N'S018      ', 2, 500000, 1000000)
INSERT [dbo].[CT_DonBanHang] ([maDonBan], [maSach], [soLuong], [DonGiaBan], [TongTien]) VALUES (N'HD005     ', N'S014      ', 3, 200000, 600000)
INSERT [dbo].[CT_DonBanHang] ([maDonBan], [maSach], [soLuong], [DonGiaBan], [TongTien]) VALUES (N'HD006     ', N'S012      ', 1, 400000, 400000)
INSERT [dbo].[CT_DonBanHang] ([maDonBan], [maSach], [soLuong], [DonGiaBan], [TongTien]) VALUES (N'HD006     ', N'S016      ', 4, 500000, 2000000)
INSERT [dbo].[CT_DonBanHang] ([maDonBan], [maSach], [soLuong], [DonGiaBan], [TongTien]) VALUES (N'HD007     ', N'S015      ', 5, 300000, 1500000)
INSERT [dbo].[CT_DonBanHang] ([maDonBan], [maSach], [soLuong], [DonGiaBan], [TongTien]) VALUES (N'HD007     ', N'S017      ', 2, 300000, 600000)
INSERT [dbo].[CT_DonBanHang] ([maDonBan], [maSach], [soLuong], [DonGiaBan], [TongTien]) VALUES (N'HD008     ', N'S017      ', 2, 100000, 200000)
INSERT [dbo].[CT_DonBanHang] ([maDonBan], [maSach], [soLuong], [DonGiaBan], [TongTien]) VALUES (N'HD009     ', N'S019      ', 3, 560000, 1680000)
INSERT [dbo].[CT_HoaDonNhapSach] ([maDonNhap], [maSach], [soLuongNhap], [giaNhap], [thanhtien]) VALUES (N'NH10      ', N'S014      ', 150, 14000, 210000)
INSERT [dbo].[CT_HoaDonNhapSach] ([maDonNhap], [maSach], [soLuongNhap], [giaNhap], [thanhtien]) VALUES (N'NH11      ', N'S012      ', 20, 11000, 220000)
INSERT [dbo].[CT_HoaDonNhapSach] ([maDonNhap], [maSach], [soLuongNhap], [giaNhap], [thanhtien]) VALUES (N'NH12      ', N'S010      ', 70, 55000, 3850000)
INSERT [dbo].[CT_HoaDonNhapSach] ([maDonNhap], [maSach], [soLuongNhap], [giaNhap], [thanhtien]) VALUES (N'NH13      ', N'S015      ', 10, 21000, 210000)
INSERT [dbo].[CT_HoaDonNhapSach] ([maDonNhap], [maSach], [soLuongNhap], [giaNhap], [thanhtien]) VALUES (N'NH13      ', N'S017      ', 112, 75000, 8400000)
INSERT [dbo].[CT_HoaDonNhapSach] ([maDonNhap], [maSach], [soLuongNhap], [giaNhap], [thanhtien]) VALUES (N'NH15      ', N'S013      ', 50, 10000, 500000)
INSERT [dbo].[CT_HoaDonNhapSach] ([maDonNhap], [maSach], [soLuongNhap], [giaNhap], [thanhtien]) VALUES (N'NH16      ', N'S011      ', 150, 15000, 2250000)
INSERT [dbo].[CT_HoaDonNhapSach] ([maDonNhap], [maSach], [soLuongNhap], [giaNhap], [thanhtien]) VALUES (N'NH17      ', N'S016      ', 50, 30000, 1500000)
INSERT [dbo].[DonBanHang] ([maDonBan], [maNV], [maKH], [ngayBan], [soLuong], [tongTien]) VALUES (N'HD001     ', N'NV001     ', N'KH01      ', CAST(N'2021-04-01' AS Date), 2, 200000)
INSERT [dbo].[DonBanHang] ([maDonBan], [maNV], [maKH], [ngayBan], [soLuong], [tongTien]) VALUES (N'HD002     ', N'NV003     ', N'KH05      ', CAST(N'2021-04-14' AS Date), 5, 1920000)
INSERT [dbo].[DonBanHang] ([maDonBan], [maNV], [maKH], [ngayBan], [soLuong], [tongTien]) VALUES (N'HD003     ', N'NV002     ', N'KH01      ', CAST(N'2021-05-15' AS Date), 1, 400000)
INSERT [dbo].[DonBanHang] ([maDonBan], [maNV], [maKH], [ngayBan], [soLuong], [tongTien]) VALUES (N'HD004     ', N'NV001     ', N'KH07      ', CAST(N'2021-06-03' AS Date), 2, 1000000)
INSERT [dbo].[DonBanHang] ([maDonBan], [maNV], [maKH], [ngayBan], [soLuong], [tongTien]) VALUES (N'HD005     ', N'NV005     ', N'KH09      ', CAST(N'2021-06-08' AS Date), 3, 600000)
INSERT [dbo].[DonBanHang] ([maDonBan], [maNV], [maKH], [ngayBan], [soLuong], [tongTien]) VALUES (N'HD006     ', N'NV001     ', N'KH03      ', CAST(N'2021-09-13' AS Date), 5, 2400000)
INSERT [dbo].[DonBanHang] ([maDonBan], [maNV], [maKH], [ngayBan], [soLuong], [tongTien]) VALUES (N'HD007     ', N'NV004     ', N'KH08      ', CAST(N'2021-06-14' AS Date), 7, 2100000)
INSERT [dbo].[DonBanHang] ([maDonBan], [maNV], [maKH], [ngayBan], [soLuong], [tongTien]) VALUES (N'HD008     ', N'NV002     ', N'KH03      ', CAST(N'2021-09-26' AS Date), 2, 200000)
INSERT [dbo].[DonBanHang] ([maDonBan], [maNV], [maKH], [ngayBan], [soLuong], [tongTien]) VALUES (N'HD009     ', N'NV003     ', N'KH07      ', CAST(N'2021-03-14' AS Date), 3, 1680000)
INSERT [dbo].[HoaDonNhapSach] ([maDonNhap], [maNV], [maNCC], [ngayNhap], [soLuong], [tongTienHD]) VALUES (N'NH10      ', N'NV001     ', N'NCC05     ', CAST(N'2020-10-17' AS Date), 150, 69000)
INSERT [dbo].[HoaDonNhapSach] ([maDonNhap], [maNV], [maNCC], [ngayNhap], [soLuong], [tongTienHD]) VALUES (N'NH11      ', N'NV001     ', N'NCC06     ', CAST(N'2021-01-11' AS Date), 20, 77000)
INSERT [dbo].[HoaDonNhapSach] ([maDonNhap], [maNV], [maNCC], [ngayNhap], [soLuong], [tongTienHD]) VALUES (N'NH12      ', N'NV002     ', N'NCC05     ', CAST(N'2018-09-26' AS Date), 70, 54000)
INSERT [dbo].[HoaDonNhapSach] ([maDonNhap], [maNV], [maNCC], [ngayNhap], [soLuong], [tongTienHD]) VALUES (N'NH13      ', N'NV001     ', N'NCC04     ', CAST(N'2019-08-27' AS Date), 122, 102000)
INSERT [dbo].[HoaDonNhapSach] ([maDonNhap], [maNV], [maNCC], [ngayNhap], [soLuong], [tongTienHD]) VALUES (N'NH15      ', N'NV002     ', N'NCC02     ', CAST(N'2020-04-15' AS Date), 50, 56000)
INSERT [dbo].[HoaDonNhapSach] ([maDonNhap], [maNV], [maNCC], [ngayNhap], [soLuong], [tongTienHD]) VALUES (N'NH16      ', N'NV002     ', N'NCC07     ', CAST(N'2021-06-01' AS Date), 50, 34000)
INSERT [dbo].[HoaDonNhapSach] ([maDonNhap], [maNV], [maNCC], [ngayNhap], [soLuong], [tongTienHD]) VALUES (N'NH17      ', N'NV001     ', N'NCC05     ', CAST(N'2021-12-13' AS Date), 150, 12000)
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [sdt], [email], [diaChi], [tinhTrang]) VALUES (N'KH01      ', N'Pha Tu Da', N'0987456321 ', N'phatuda@gmail.com', N'140 Lê Trọng Tấn, Tây Thạnh', N'Thành viên thường')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [sdt], [email], [diaChi], [tinhTrang]) VALUES (N'KH02      ', N'L Th Tha Bi', N'0326598741 ', N'lththabi@gmail.com', N'142 Lê Trọng Tấn, Tây Thạnh', N'Thành viên thường')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [sdt], [email], [diaChi], [tinhTrang]) VALUES (N'KH03      ', N'Pha Tha Bi', N'0235687419 ', N'tudathabi@gmail.com', N'144 Lê Trọng Tấn, Tây Thạnh', N'Thành viên thường')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [sdt], [email], [diaChi], [tinhTrang]) VALUES (N'KH04      ', N'Phe tu de', N'0235698741 ', N'phetude@gmail.com', N'140 Lê Trọng Tấn, Tây Thạnh', N'Thành viên thường')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [sdt], [email], [diaChi], [tinhTrang]) VALUES (N'KH05      ', N'Nguyễn Bá Cây', N'0956321478 ', N'bacay123@gmail.com', N'140 Lê Trọng Tấn, Tây Thạnh', N'Thành viên thường')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [sdt], [email], [diaChi], [tinhTrang]) VALUES (N'KH06      ', N'Le Hoai Thuong', N'0321654789 ', N'hoaithuong@gmail.com', N'227 Nguyen Van Cu, Q5, TpHCM', N'Thành viên thường')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [sdt], [email], [diaChi], [tinhTrang]) VALUES (N'KH07      ', N'Nguyen Van Tam', N'0123654789 ', N'vantam@gmail.com', N'32/3 Tran Binh Trong, Q5, TpHCM', N'Thành viên thường')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [sdt], [email], [diaChi], [tinhTrang]) VALUES (N'KH08      ', N'Phan Thi Thanh', N'0598746213 ', N'thithanh@gmail.com', N'45/2 An Duong Vuong, Q5, TpHCM', N'Thành viên thường')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [sdt], [email], [diaChi], [tinhTrang]) VALUES (N'KH09      ', N'Le Ha Vinh', N'0987456321 ', N'having@gmail.com', N'873 Le Hong Phong, Q5, TpHCM', N'Thành viên thường')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [sdt], [email], [diaChi], [tinhTrang]) VALUES (N'KH10      ', N'Ha Duy Lap', N'0789546321 ', N'duylap@gmail.com', N'34/34B Nguyen Trai, Q1, TpHCM', N'Thành viên thường')
INSERT [dbo].[NhaCungCap] ([maNCC], [tenNCC], [sdt], [email], [diaChi]) VALUES (N'NCC01     ', N'Nhà cung cấp Bình Dương', N'0123684273 ', N'binhduong@gmail.com', N'Dĩ An, Thủ Dầu 1, Bình Dương')
INSERT [dbo].[NhaCungCap] ([maNCC], [tenNCC], [sdt], [email], [diaChi]) VALUES (N'NCC02     ', N'Nhà cung cấp TP.HCM', N'0654321987 ', N'tphcm@gmail.com', N'Quận 11, TPHCM')
INSERT [dbo].[NhaCungCap] ([maNCC], [tenNCC], [sdt], [email], [diaChi]) VALUES (N'NCC03     ', N'Nhà cung cấp Bình Định', N'0232391209 ', N'binhdinh@gmail.com', N'Hòa Hải, Bình Định')
INSERT [dbo].[NhaCungCap] ([maNCC], [tenNCC], [sdt], [email], [diaChi]) VALUES (N'NCC04     ', N'Nhà cung cấp Hà Nội', N'0823481910 ', N'hanoi@gmail.com', N'Quận 8, Hà Nội')
INSERT [dbo].[NhaCungCap] ([maNCC], [tenNCC], [sdt], [email], [diaChi]) VALUES (N'NCC05     ', N'Nhà cung cấp Ninh Thuận', N'0123569874 ', N'ninhthuan@gmail.com', N'Nguyễn Thái Tông,Ninh Thuận')
INSERT [dbo].[NhaCungCap] ([maNCC], [tenNCC], [sdt], [email], [diaChi]) VALUES (N'NCC06     ', N'Nhà cung cấp Tây Ninh ', N'0234731209 ', N'tayninh@gmail.com', N'11 Võ Thị Sáu,Tây Ninh')
INSERT [dbo].[NhaCungCap] ([maNCC], [tenNCC], [sdt], [email], [diaChi]) VALUES (N'NCC07     ', N'Nhà cung cấp Đồng Nai', N'0523641789 ', N'dongnai@gmail.com', N'1123 Hoàng Hoa Thám ,Đồng Nai')
INSERT [dbo].[NhanVien] ([maNV], [taiKhoan], [matKhau], [tenNV], [ngaySinh], [gioiTinh], [emailNV], [SoDT], [anhNV], [ID_ROLE]) VALUES (N'NV001     ', N'TuanDat                       ', N'321321                        ', N'Phạm Tuấn Đạt', CAST(N'2000-07-16' AS Date), N'Nam', N'tuananh@gmail.com', N'0937940673  ', N'\img\nv1_1.jpg', 1)
INSERT [dbo].[NhanVien] ([maNV], [taiKhoan], [matKhau], [tenNV], [ngaySinh], [gioiTinh], [emailNV], [SoDT], [anhNV], [ID_ROLE]) VALUES (N'NV002     ', N'MyLinh                        ', N'111112                        ', N'Trần Mỹ Linh', CAST(N'1995-09-01' AS Date), N'Nữ', N'mylinh112@gmail.com', N'0908918390  ', N'\img\nv1_1.jpg', 2)
INSERT [dbo].[NhanVien] ([maNV], [taiKhoan], [matKhau], [tenNV], [ngaySinh], [gioiTinh], [emailNV], [SoDT], [anhNV], [ID_ROLE]) VALUES (N'NV003     ', N'DuyMinh                       ', N'101010                        ', N'Phạm Duy Minh', CAST(N'1999-03-26' AS Date), N'Nam', N'duyminh@gmail.com', N'0912845307  ', N'\img\nv1_1.jpg', 2)
INSERT [dbo].[NhanVien] ([maNV], [taiKhoan], [matKhau], [tenNV], [ngaySinh], [gioiTinh], [emailNV], [SoDT], [anhNV], [ID_ROLE]) VALUES (N'NV004     ', N'HongAnh                       ', N'156789                        ', N'Nguyễn Hồng Hoa', CAST(N'1998-08-07' AS Date), N'Nữ', N'honganh0101@gmail.com', N'0371412546  ', N'\img\nv1_1.jpg', 2)
INSERT [dbo].[NhanVien] ([maNV], [taiKhoan], [matKhau], [tenNV], [ngaySinh], [gioiTinh], [emailNV], [SoDT], [anhNV], [ID_ROLE]) VALUES (N'NV005     ', N'DucAnh                        ', N'000012                        ', N'Nguyễn Đức Anh', CAST(N'2001-10-20' AS Date), N'Nam', N'dat16072001@gmail.com', N'0920392050  ', N'\img\nv1_1.jpg', 2)
SET IDENTITY_INSERT [dbo].[PHANQUYEN] ON 

INSERT [dbo].[PHANQUYEN] ([ID_PP], [ID_ROLE], [TEN_ACTION], [CODE_ACTION]) VALUES (1, 1, N'Them', N'INSERT')
INSERT [dbo].[PHANQUYEN] ([ID_PP], [ID_ROLE], [TEN_ACTION], [CODE_ACTION]) VALUES (2, 1, N'Xem', N'SELECT')
INSERT [dbo].[PHANQUYEN] ([ID_PP], [ID_ROLE], [TEN_ACTION], [CODE_ACTION]) VALUES (3, 1, N'Xoa', N'DELETE')
INSERT [dbo].[PHANQUYEN] ([ID_PP], [ID_ROLE], [TEN_ACTION], [CODE_ACTION]) VALUES (4, 2, N'Them', N'INSERT')
INSERT [dbo].[PHANQUYEN] ([ID_PP], [ID_ROLE], [TEN_ACTION], [CODE_ACTION]) VALUES (5, 2, N'Xem', N'SELECT')
SET IDENTITY_INSERT [dbo].[PHANQUYEN] OFF
INSERT [dbo].[SachTonKho] ([maSach], [SoLuongTon]) VALUES (N'S010      ', 100)
INSERT [dbo].[SachTonKho] ([maSach], [SoLuongTon]) VALUES (N'S011      ', 150)
INSERT [dbo].[SachTonKho] ([maSach], [SoLuongTon]) VALUES (N'S012      ', 120)
INSERT [dbo].[SachTonKho] ([maSach], [SoLuongTon]) VALUES (N'S013      ', 90)
INSERT [dbo].[SachTonKho] ([maSach], [SoLuongTon]) VALUES (N'S014      ', 99)
INSERT [dbo].[SachTonKho] ([maSach], [SoLuongTon]) VALUES (N'S015      ', 58)
INSERT [dbo].[SachTonKho] ([maSach], [SoLuongTon]) VALUES (N'S016      ', 72)
INSERT [dbo].[SachTonKho] ([maSach], [SoLuongTon]) VALUES (N'S017      ', 56)
INSERT [dbo].[SachTonKho] ([maSach], [SoLuongTon]) VALUES (N'S018      ', 50)
INSERT [dbo].[SachTonKho] ([maSach], [SoLuongTon]) VALUES (N'S019      ', 56)
INSERT [dbo].[TBL_ROLE] ([ID_ROLE], [TEN_ROLE]) VALUES (1, N'Quan Ly')
INSERT [dbo].[TBL_ROLE] ([ID_ROLE], [TEN_ROLE]) VALUES (2, N'Nhan Vien')
INSERT [dbo].[THONGTINSACH] ([maSach], [tenSach], [tacGia], [nhaXB], [namXB], [theLoai], [giaBan], [anhSach]) VALUES (N'S010      ', N'Sách tự nhiên', N'Pha Tu Da', N'Nhà Xuất Bản Gia đình', 2018, N'Sách nghiên cứu', 25000, N'\img\nocontentyet.jpg')
INSERT [dbo].[THONGTINSACH] ([maSach], [tenSach], [tacGia], [nhaXB], [namXB], [theLoai], [giaBan], [anhSach]) VALUES (N'S011      ', N'Toán a2', N'Đinh Xuân Ngoc', N'Nhà Xuất Bản Giáo Dục', 2018, N'Sách Giáo Khoa', 23000, N'\img\nocontentyet.jpg')
INSERT [dbo].[THONGTINSACH] ([maSach], [tenSach], [tacGia], [nhaXB], [namXB], [theLoai], [giaBan], [anhSach]) VALUES (N'S012      ', N'Hạt giống tội lỗi', N'Nguyễn Văn Vỵ', N'Kim Đồng', 1999, N'Khoa Học Tự Nhiên', 21000, N'\img\nocontentyet.jpg')
INSERT [dbo].[THONGTINSACH] ([maSach], [tenSach], [tacGia], [nhaXB], [namXB], [theLoai], [giaBan], [anhSach]) VALUES (N'S013      ', N'Tom and Jerry', N'Trần Văn Tuấn', N'Nhà xuất bản Trẻ', 1980, N'Truyện Tranh Thiếu Nhi', 28000, N'\img\nocontentyet.jpg')
INSERT [dbo].[THONGTINSACH] ([maSach], [tenSach], [tacGia], [nhaXB], [namXB], [theLoai], [giaBan], [anhSach]) VALUES (N'S014      ', N'Truyện Doremon', N'Hồ Thị Anh', N'Nhà xuất bản Trẻ', 1990, N'Truyện Tranh Thiếu Nhi', 27000, N'\img\nocontentyet.jpg')
INSERT [dbo].[THONGTINSACH] ([maSach], [tenSach], [tacGia], [nhaXB], [namXB], [theLoai], [giaBan], [anhSach]) VALUES (N'S015      ', N'Tâm lý học ', N'Đoàn Thị Hoa', N'Nhà xuất bản lao động', 2001, N'Tâm Lý', 23500, N'\img\nocontentyet.jpg')
INSERT [dbo].[THONGTINSACH] ([maSach], [tenSach], [tacGia], [nhaXB], [namXB], [theLoai], [giaBan], [anhSach]) VALUES (N'S016      ', N'Ngữ Pháp Tiếng Anh', N'Nguyễn Anh Đào', N'Từ điển Bách KHoa', 2008, N'Sách Giáo Khoa', 24500, N'\img\nocontentyet.jpg')
INSERT [dbo].[THONGTINSACH] ([maSach], [tenSach], [tacGia], [nhaXB], [namXB], [theLoai], [giaBan], [anhSach]) VALUES (N'S017      ', N'Bắt trẻ đồng xanh', N'Nguyễn Hoàng Nam', N' Khoa học và kỹ thuật', 2013, N'Giáo Khoa', 20000, N'\img\nocontentyet.jpg')
INSERT [dbo].[THONGTINSACH] ([maSach], [tenSach], [tacGia], [nhaXB], [namXB], [theLoai], [giaBan], [anhSach]) VALUES (N'S018      ', N'Tội ác trừ trị', N'Trần Văn Tuấn', N'Nhà xuất bản Tư pháp', 2002, N'Chính Trị-Pháp Luật', 31000, N'\img\nocontentyet.jpg')
INSERT [dbo].[THONGTINSACH] ([maSach], [tenSach], [tacGia], [nhaXB], [namXB], [theLoai], [giaBan], [anhSach]) VALUES (N'S019      ', N'Hồi Xuân', N'Nguyễn Tiến Huy', N'Nhà xuất bản Trẻ', 2019, N'Sách Tiểu Thuyết', 25000, N'\img\nocontentyet.jpg')
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__NhanVien__E570E42EA03FB99C]    Script Date: 25-May-22 9:06:09 AM ******/
ALTER TABLE [dbo].[NhanVien] ADD UNIQUE NONCLUSTERED 
(
	[taiKhoan] ASC,
	[matKhau] ASC,
	[emailNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KhachHang] ADD  DEFAULT (N'Thành viên thường') FOR [tinhTrang]
GO
ALTER TABLE [dbo].[NhanVien] ADD  DEFAULT (N'\img\nv1_1.jpg') FOR [anhNV]
GO
ALTER TABLE [dbo].[THONGTINSACH] ADD  DEFAULT (N'\img\nocontentyet.jpg') FOR [anhSach]
GO
ALTER TABLE [dbo].[CT_DonBanHang]  WITH CHECK ADD  CONSTRAINT [FK_CT_DonBanHang_DonBanHang] FOREIGN KEY([maDonBan])
REFERENCES [dbo].[DonBanHang] ([maDonBan])
GO
ALTER TABLE [dbo].[CT_DonBanHang] CHECK CONSTRAINT [FK_CT_DonBanHang_DonBanHang]
GO
ALTER TABLE [dbo].[CT_DonBanHang]  WITH CHECK ADD  CONSTRAINT [FK_CT_DonBanHang_Sach] FOREIGN KEY([maSach])
REFERENCES [dbo].[THONGTINSACH] ([maSach])
GO
ALTER TABLE [dbo].[CT_DonBanHang] CHECK CONSTRAINT [FK_CT_DonBanHang_Sach]
GO
ALTER TABLE [dbo].[CT_HoaDonNhapSach]  WITH CHECK ADD  CONSTRAINT [FK_CT_DonNhapHang_DonNhapHang] FOREIGN KEY([maDonNhap])
REFERENCES [dbo].[HoaDonNhapSach] ([maDonNhap])
GO
ALTER TABLE [dbo].[CT_HoaDonNhapSach] CHECK CONSTRAINT [FK_CT_DonNhapHang_DonNhapHang]
GO
ALTER TABLE [dbo].[CT_HoaDonNhapSach]  WITH CHECK ADD  CONSTRAINT [FK_CT_DonNhapHang_ThongTinSach] FOREIGN KEY([maSach])
REFERENCES [dbo].[THONGTINSACH] ([maSach])
GO
ALTER TABLE [dbo].[CT_HoaDonNhapSach] CHECK CONSTRAINT [FK_CT_DonNhapHang_ThongTinSach]
GO
ALTER TABLE [dbo].[DonBanHang]  WITH CHECK ADD  CONSTRAINT [FK_DonBanHang_KhachHang] FOREIGN KEY([maKH])
REFERENCES [dbo].[KhachHang] ([maKH])
GO
ALTER TABLE [dbo].[DonBanHang] CHECK CONSTRAINT [FK_DonBanHang_KhachHang]
GO
ALTER TABLE [dbo].[DonBanHang]  WITH CHECK ADD  CONSTRAINT [FK_DonBanHang_NhanVien] FOREIGN KEY([maNV])
REFERENCES [dbo].[NhanVien] ([maNV])
GO
ALTER TABLE [dbo].[DonBanHang] CHECK CONSTRAINT [FK_DonBanHang_NhanVien]
GO
ALTER TABLE [dbo].[HoaDonNhapSach]  WITH CHECK ADD  CONSTRAINT [FK_DonNhapHang_NhaCungCap] FOREIGN KEY([maNCC])
REFERENCES [dbo].[NhaCungCap] ([maNCC])
GO
ALTER TABLE [dbo].[HoaDonNhapSach] CHECK CONSTRAINT [FK_DonNhapHang_NhaCungCap]
GO
ALTER TABLE [dbo].[HoaDonNhapSach]  WITH CHECK ADD  CONSTRAINT [FK_DonNhapHang_NhanVien] FOREIGN KEY([maNV])
REFERENCES [dbo].[NhanVien] ([maNV])
GO
ALTER TABLE [dbo].[HoaDonNhapSach] CHECK CONSTRAINT [FK_DonNhapHang_NhanVien]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_TBL_ROLE] FOREIGN KEY([ID_ROLE])
REFERENCES [dbo].[TBL_ROLE] ([ID_ROLE])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_TBL_ROLE]
GO
ALTER TABLE [dbo].[PHANQUYEN]  WITH CHECK ADD  CONSTRAINT [FK_PHANQUYEN_TBL_ROLE] FOREIGN KEY([ID_ROLE])
REFERENCES [dbo].[TBL_ROLE] ([ID_ROLE])
GO
ALTER TABLE [dbo].[PHANQUYEN] CHECK CONSTRAINT [FK_PHANQUYEN_TBL_ROLE]
GO
ALTER TABLE [dbo].[SachTonKho]  WITH CHECK ADD  CONSTRAINT [FK_SachTonKho_Sach] FOREIGN KEY([maSach])
REFERENCES [dbo].[THONGTINSACH] ([maSach])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SachTonKho] CHECK CONSTRAINT [FK_SachTonKho_Sach]
GO
ALTER TABLE [dbo].[CT_DonBanHang]  WITH CHECK ADD CHECK  (([DonGiaBan]>=(0)))
GO
ALTER TABLE [dbo].[CT_DonBanHang]  WITH CHECK ADD CHECK  (([TongTien]>=(0)))
GO
ALTER TABLE [dbo].[CT_HoaDonNhapSach]  WITH CHECK ADD CHECK  (([giaNhap]>=(0)))
GO
ALTER TABLE [dbo].[DonBanHang]  WITH CHECK ADD CHECK  (([tongTien]>=(0)))
GO
ALTER TABLE [dbo].[THONGTINSACH]  WITH CHECK ADD CHECK  (([giaBan]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [QL_BSach] SET  READ_WRITE 
GO
