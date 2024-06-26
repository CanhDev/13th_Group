USE [RUOU]
GO
/****** Object:  Table [dbo].[ChucNang]    Script Date: 6/1/2024 9:46:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucNang](
	[ID] [int] NOT NULL,
	[TenChucNang] [nvarchar](50) NULL,
	[TieuDe] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChucNang] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 6/1/2024 9:46:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[PhuongThucThanhToan] [nvarchar](255) NULL,
	[TongSanPham] [int] NULL,
	[DiaChiNhanHang] [nvarchar](255) NULL,
	[TongTien] [decimal](10, 2) NULL,
	[idKhachHang] [int] NULL,
	[ngayDat] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 6/1/2024 9:46:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[MaGioHang] [int] IDENTITY(1,1) NOT NULL,
	[SoLoaiSanPham] [int] NULL,
	[NgayThem] [date] NULL,
	[idKhachHang] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaGioHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemCart]    Script Date: 6/1/2024 9:46:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemCart](
	[itemCartID] [int] IDENTITY(1,1) NOT NULL,
	[idSanPham] [int] NULL,
	[idGioHang] [int] NULL,
	[SoLuong] [int] NULL,
	[Gia] [decimal](18, 2) NULL,
	[idDonHang] [int] NULL,
 CONSTRAINT [PK_ItemCart] PRIMARY KEY CLUSTERED 
(
	[itemCartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 6/1/2024 9:46:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[TenKhachHang] [nvarchar](50) NULL,
	[MaKhachHang] [int] IDENTITY(1,1) NOT NULL,
	[DiaChi] [nvarchar](50) NULL,
	[TenDangNhap] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[SoDienThoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 6/1/2024 9:46:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[CatalogyID] [nvarchar](50) NOT NULL,
	[CatalogyName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CatalogyImage] [nchar](20) NULL,
 CONSTRAINT [PK_Catalogies] PRIMARY KEY CLUSTERED 
(
	[CatalogyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaSanXuat]    Script Date: 6/1/2024 9:46:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaSanXuat](
	[MaNhaSanXuat] [int] IDENTITY(1,1) NOT NULL,
	[TenNhaSanXuat] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhaSanXuat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 6/1/2024 9:46:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[MaTaiKhoan] [int] NOT NULL,
	[idChucNang] [int] NOT NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_PhanQuyen] PRIMARY KEY CLUSTERED 
(
	[MaTaiKhoan] ASC,
	[idChucNang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 6/1/2024 9:46:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[PurchasePrice] [numeric](8, 2) NOT NULL,
	[Price] [numeric](8, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Vintage] [nvarchar](255) NULL,
	[CatalogyID] [nvarchar](50) NOT NULL,
	[Image] [text] NULL,
	[Region] [nvarchar](100) NOT NULL,
	[MaNhaSanXuat] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham_DonHang]    Script Date: 6/1/2024 9:46:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham_DonHang](
	[ProductID] [int] NOT NULL,
	[MaDonHang] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([MaDonHang], [PhuongThucThanhToan], [TongSanPham], [DiaChiNhanHang], [TongTien], [idKhachHang], [ngayDat]) VALUES (55, N'Thanh toán khi nhận hàng', 2, N'Hà Nam', CAST(140.00 AS Decimal(10, 2)), 17, CAST(N'2024-05-31' AS Date))
INSERT [dbo].[DonHang] ([MaDonHang], [PhuongThucThanhToan], [TongSanPham], [DiaChiNhanHang], [TongTien], [idKhachHang], [ngayDat]) VALUES (56, N'Thanh toán khi nhận hàng', 3, N'Hà Nam', CAST(175.00 AS Decimal(10, 2)), 17, CAST(N'2024-05-31' AS Date))
INSERT [dbo].[DonHang] ([MaDonHang], [PhuongThucThanhToan], [TongSanPham], [DiaChiNhanHang], [TongTien], [idKhachHang], [ngayDat]) VALUES (1043, N'Thanh toán khi nhận hàng', 4, N'Hà nội', CAST(1310.00 AS Decimal(10, 2)), 16, CAST(N'2024-05-31' AS Date))
INSERT [dbo].[DonHang] ([MaDonHang], [PhuongThucThanhToan], [TongSanPham], [DiaChiNhanHang], [TongTien], [idKhachHang], [ngayDat]) VALUES (1044, N'Thanh toán khi nhận hàng', 3, N'Hà nội', CAST(740.00 AS Decimal(10, 2)), 16, CAST(N'2024-06-01' AS Date))
INSERT [dbo].[DonHang] ([MaDonHang], [PhuongThucThanhToan], [TongSanPham], [DiaChiNhanHang], [TongTien], [idKhachHang], [ngayDat]) VALUES (1045, N'Thanh toán khi nhận hàng', 3, N'Hà nội', CAST(775.00 AS Decimal(10, 2)), 16, CAST(N'2024-06-01' AS Date))
INSERT [dbo].[DonHang] ([MaDonHang], [PhuongThucThanhToan], [TongSanPham], [DiaChiNhanHang], [TongTien], [idKhachHang], [ngayDat]) VALUES (1046, N'Thanh toán khi nhận hàng', 3, N'Hà nội', CAST(775.00 AS Decimal(10, 2)), 16, CAST(N'2024-06-01' AS Date))
INSERT [dbo].[DonHang] ([MaDonHang], [PhuongThucThanhToan], [TongSanPham], [DiaChiNhanHang], [TongTien], [idKhachHang], [ngayDat]) VALUES (1047, N'Thanh toán khi nhận hàng', 5, N'Hà nội', CAST(880.00 AS Decimal(10, 2)), 16, CAST(N'2024-06-01' AS Date))
INSERT [dbo].[DonHang] ([MaDonHang], [PhuongThucThanhToan], [TongSanPham], [DiaChiNhanHang], [TongTien], [idKhachHang], [ngayDat]) VALUES (1048, N'Thanh toán khi nhận hàng', 3, N'Hà nội', CAST(205.00 AS Decimal(10, 2)), 18, CAST(N'2024-06-01' AS Date))
INSERT [dbo].[DonHang] ([MaDonHang], [PhuongThucThanhToan], [TongSanPham], [DiaChiNhanHang], [TongTien], [idKhachHang], [ngayDat]) VALUES (1049, N'Thanh toán khi nhận hàng', 4, N'Hà nội', CAST(240.00 AS Decimal(10, 2)), 18, CAST(N'2024-06-01' AS Date))
SET IDENTITY_INSERT [dbo].[DonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[GioHang] ON 

INSERT [dbo].[GioHang] ([MaGioHang], [SoLoaiSanPham], [NgayThem], [idKhachHang]) VALUES (11, NULL, CAST(N'2024-05-31' AS Date), 16)
INSERT [dbo].[GioHang] ([MaGioHang], [SoLoaiSanPham], [NgayThem], [idKhachHang]) VALUES (12, NULL, CAST(N'2024-05-31' AS Date), 17)
INSERT [dbo].[GioHang] ([MaGioHang], [SoLoaiSanPham], [NgayThem], [idKhachHang]) VALUES (13, NULL, CAST(N'2024-05-31' AS Date), 18)
SET IDENTITY_INSERT [dbo].[GioHang] OFF
GO
SET IDENTITY_INSERT [dbo].[ItemCart] ON 

INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (87, 448, NULL, 1, CAST(30.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (88, 465, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (89, 471, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (90, 485, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (91, 489, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (92, 471, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (93, 485, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (94, 489, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (95, 471, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (96, 485, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (97, 489, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (100, 471, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (101, 485, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (102, 489, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (103, 427, NULL, 8, CAST(2000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (104, 482, NULL, 1, CAST(40.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (106, 471, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (107, 485, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (108, 489, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (109, 427, NULL, 8, CAST(2000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (110, 482, NULL, 1, CAST(40.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (111, 467, NULL, 1, CAST(2000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (112, 471, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (113, 485, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (114, 489, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (115, 427, NULL, 8, CAST(2000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (116, 482, NULL, 1, CAST(40.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (117, 467, NULL, 1, CAST(2000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (119, 471, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (120, 485, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (121, 489, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (122, 427, NULL, 8, CAST(2000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (123, 482, NULL, 1, CAST(40.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (124, 467, NULL, 1, CAST(2000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (125, 465, NULL, 2, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (126, 465, NULL, 2, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (129, 465, NULL, 2, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (130, 477, NULL, 1, CAST(1500.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (131, 427, NULL, 1, CAST(2000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (132, 427, NULL, 1, CAST(2000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (136, 427, NULL, 1, CAST(2000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (137, 465, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (138, 471, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (139, 448, NULL, 1, CAST(30.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (140, 427, NULL, 1, CAST(2000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (141, 465, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (142, 471, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (143, 448, NULL, 1, CAST(30.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (145, 427, NULL, 1, CAST(2000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (146, 465, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (147, 448, NULL, 1, CAST(30.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (148, 489, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (151, 448, NULL, 1, CAST(30.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (155, 481, NULL, 1, CAST(150.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (156, 462, NULL, 1, CAST(250.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (157, 438, NULL, 1, CAST(250.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (160, 467, NULL, 1, CAST(2000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (162, 467, NULL, 1, CAST(2000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (163, 420, NULL, 1, CAST(500.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (165, 467, NULL, 1, CAST(2000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (166, 420, NULL, 1, CAST(500.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (167, 465, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (169, 467, NULL, 1, CAST(2000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (170, 420, NULL, 1, CAST(500.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (171, 465, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (172, 423, NULL, 1, CAST(40.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (174, 467, NULL, 1, CAST(2000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (175, 420, NULL, 1, CAST(500.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (176, 465, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (177, 423, NULL, 1, CAST(40.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (178, 489, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (179, 461, 12, 1, CAST(50.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (180, 452, 12, 1, CAST(90.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (181, 461, NULL, 1, CAST(50.00 AS Decimal(18, 2)), 55)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (182, 452, NULL, 1, CAST(90.00 AS Decimal(18, 2)), 55)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (183, 465, 12, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (184, 461, NULL, 1, CAST(50.00 AS Decimal(18, 2)), 56)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (185, 452, NULL, 1, CAST(90.00 AS Decimal(18, 2)), 56)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (186, 465, NULL, 1, CAST(35.00 AS Decimal(18, 2)), 56)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (189, 448, NULL, 1, CAST(30.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (190, 465, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (192, 448, NULL, 1, CAST(30.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (193, 465, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (194, 427, NULL, 1, CAST(2000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (199, 448, NULL, 1, CAST(30.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (200, 465, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (201, 427, NULL, 1, CAST(2000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (202, 461, NULL, 1, CAST(50.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (203, 452, NULL, 1, CAST(90.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (204, 439, NULL, 1, CAST(100.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (205, 418, NULL, 1, CAST(150.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1094, 467, NULL, 1, CAST(2000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1095, 420, NULL, 1, CAST(500.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1096, 465, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1097, 489, NULL, 2, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1098, 492, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1099, 448, NULL, 4, CAST(30.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1101, 420, NULL, 1, CAST(500.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1102, 465, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1103, 434, NULL, 1, CAST(130.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1107, 465, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1108, 489, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1111, 427, NULL, 1, CAST(2000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1112, 477, NULL, 4, CAST(1500.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1115, 465, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1116, 489, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1117, 467, NULL, 1, CAST(2000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1118, 479, NULL, 6, CAST(550.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1122, 465, NULL, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1123, 448, NULL, 4, CAST(30.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1125, 465, NULL, 4, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1126, 448, NULL, 5, CAST(30.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1127, 463, NULL, 3, CAST(140.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1128, 418, 11, 4, CAST(150.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1129, 465, NULL, 4, CAST(35.00 AS Decimal(18, 2)), 1043)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1130, 448, NULL, 5, CAST(30.00 AS Decimal(18, 2)), 1043)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1131, 463, NULL, 3, CAST(140.00 AS Decimal(18, 2)), 1043)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1132, 418, NULL, 4, CAST(150.00 AS Decimal(18, 2)), 1043)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1133, 465, 11, 3, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1134, 471, 11, 3, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1135, 418, NULL, 4, CAST(150.00 AS Decimal(18, 2)), 1044)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1136, 465, NULL, 1, CAST(35.00 AS Decimal(18, 2)), 1044)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1137, 471, NULL, 3, CAST(35.00 AS Decimal(18, 2)), 1044)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1138, 418, NULL, 4, CAST(150.00 AS Decimal(18, 2)), 1045)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1139, 465, NULL, 1, CAST(35.00 AS Decimal(18, 2)), 1045)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1140, 471, NULL, 3, CAST(35.00 AS Decimal(18, 2)), 1045)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1141, 418, NULL, 4, CAST(150.00 AS Decimal(18, 2)), 1046)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1142, 465, NULL, 2, CAST(35.00 AS Decimal(18, 2)), 1046)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1143, 471, NULL, 3, CAST(35.00 AS Decimal(18, 2)), 1046)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1144, 489, 11, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1145, 492, 11, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1146, 418, NULL, 4, CAST(150.00 AS Decimal(18, 2)), 1047)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1147, 465, NULL, 2, CAST(35.00 AS Decimal(18, 2)), 1047)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1148, 471, NULL, 3, CAST(35.00 AS Decimal(18, 2)), 1047)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1149, 489, NULL, 1, CAST(35.00 AS Decimal(18, 2)), 1047)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1150, 492, NULL, 1, CAST(35.00 AS Decimal(18, 2)), 1047)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1151, 448, 13, 1, CAST(30.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1152, 465, 13, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1153, 471, 13, 4, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1154, 448, NULL, 1, CAST(30.00 AS Decimal(18, 2)), 1048)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1155, 465, NULL, 1, CAST(35.00 AS Decimal(18, 2)), 1048)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1156, 471, NULL, 4, CAST(35.00 AS Decimal(18, 2)), 1048)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1157, 489, 13, 1, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1158, 448, NULL, 1, CAST(30.00 AS Decimal(18, 2)), 1049)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1159, 465, NULL, 1, CAST(35.00 AS Decimal(18, 2)), 1049)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1160, 471, NULL, 4, CAST(35.00 AS Decimal(18, 2)), 1049)
INSERT [dbo].[ItemCart] ([itemCartID], [idSanPham], [idGioHang], [SoLuong], [Gia], [idDonHang]) VALUES (1161, 489, NULL, 1, CAST(35.00 AS Decimal(18, 2)), 1049)
SET IDENTITY_INSERT [dbo].[ItemCart] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([TenKhachHang], [MaKhachHang], [DiaChi], [TenDangNhap], [MatKhau], [SoDienThoai]) VALUES (N'Cảnh Nguyễn', 16, N'Hà nội', N'Admin', N'cb26a327a7bd362e', N'12345678')
INSERT [dbo].[KhachHang] ([TenKhachHang], [MaKhachHang], [DiaChi], [TenDangNhap], [MatKhau], [SoDienThoai]) VALUES (N'tét', 17, N'Hà Nam', N'nhanvien', N'e114eadd49b70f52', N'12345678')
INSERT [dbo].[KhachHang] ([TenKhachHang], [MaKhachHang], [DiaChi], [TenDangNhap], [MatKhau], [SoDienThoai]) VALUES (N'test', 18, N'Hà nội', N'test', N'e114eadd49b70f52', N'12345678')
INSERT [dbo].[KhachHang] ([TenKhachHang], [MaKhachHang], [DiaChi], [TenDangNhap], [MatKhau], [SoDienThoai]) VALUES (N'test2', 1018, N'Hà nội', N'test2', N'ce5518a9684e3a8a086f9a1d74c94d4e', N'22222222')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
INSERT [dbo].[LoaiSanPham] ([CatalogyID], [CatalogyName], [Description], [CatalogyImage]) VALUES (N'WINE001', N'Vang đỏ', N'Sành rượu luôn nổ lực lựa chọn những chai vang đỏ ngon trong tầm giá để quý vị an tâm mua được
chai rượu vang đỏ phù hợp cho ăn uống hàng ngày, tiệc tùng cùng đồng nghiệp, tiếp khách thân mật hoặc đại tiệc với giá thân thiện nhất.', NULL)
INSERT [dbo].[LoaiSanPham] ([CatalogyID], [CatalogyName], [Description], [CatalogyImage]) VALUES (N'WINE002', N'Vang trắng', N'Rượu vang trắng hay còn gọi là vang trắng, rượu nho trắng là một thể loại của rượu vang theo đó khác với rượu vang đỏ,
rượu vang trắng có màu lạt hơn nó được gọi là màu trắng nhưng không hoàn toà...', NULL)
INSERT [dbo].[LoaiSanPham] ([CatalogyID], [CatalogyName], [Description], [CatalogyImage]) VALUES (N'WINE003', N'Rượu sâm panh', N'Champagne là một loại vang nổ/vang sủi/sparkling đặc biệt, xuất xứ từ chỉ dẫn địa lý từ vùng Champagne
của Pháp với tiêu chuẩn và quy định khắc khe mới được gọi là Champagne và là sản phẩm được bảo...', NULL)
GO
SET IDENTITY_INSERT [dbo].[NhaSanXuat] ON 

INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat]) VALUES (1, N'Château Lafite Rothschild')
INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat]) VALUES (2, N'Domaine de la Romanée-Conti')
INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat]) VALUES (3, N'Louis Jadot')
SET IDENTITY_INSERT [dbo].[NhaSanXuat] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (417, N'Pol Roger Brut Réserve', N'Rượu Sâm Panh', CAST(55.00 AS Numeric(8, 2)), CAST(110.00 AS Numeric(8, 2)), 119, N'NV', N'WINE003', N's9.jpg', N'Champagne', 3)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (418, N'Taittinger Prestige Rosé Brut', N'Rượu Sâm Panh', CAST(75.00 AS Numeric(8, 2)), CAST(150.00 AS Numeric(8, 2)), 79, N'NV', N'WINE003', N's18.jpg', N'Champagne', 3)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (419, N'Chateau Montrose', N'Rượu vang đỏ', CAST(250.00 AS Numeric(8, 2)), CAST(500.00 AS Numeric(8, 2)), 59, N'2010', N'WINE001', N'v26.jpg', N'Bordeaux', 2)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (420, N'Dom Pérignon Rosé Vintage', N'Rượu Sâm Panh', CAST(250.00 AS Numeric(8, 2)), CAST(500.00 AS Numeric(8, 2)), 49, N'2006', N'WINE003', N's14.jpg', N'Champagne', 2)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (421, N'Chateau Haut-Brion', N'Rượu vang đỏ', CAST(600.00 AS Numeric(8, 2)), CAST(1000.00 AS Numeric(8, 2)), 28, N'2010', N'WINE001', N'v22.jpg', N'Bordeaux', 1)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (422, N'Greco di Tufo', N'Rượu vang trắng', CAST(30.00 AS Numeric(8, 2)), CAST(60.00 AS Numeric(8, 2)), 79, N'2019', N'WINE002', N't20.jpg', N'Campania', 2)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (423, N'Verdejo', N'Rượu vang trắng', CAST(20.00 AS Numeric(8, 2)), CAST(40.00 AS Numeric(8, 2)), 89, N'2018', N'WINE002', N't11.jpg', N'Rueda', 2)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (424, N'Ornellaia', N'Rượu vang đỏ', CAST(200.00 AS Numeric(8, 2)), CAST(350.00 AS Numeric(8, 2)), 50, N'2015', N'WINE001', N'v18.jpg', N'Tuscany', 3)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (425, N'Assyrtiko', N'Rượu vang trắng', CAST(22.00 AS Numeric(8, 2)), CAST(45.00 AS Numeric(8, 2)), 90, N'2020', N'WINE002', N't16.jpg', N'Santorini', 1)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (426, N'Caymus Special Selection Cabernet Sauvignon', N'Rượu vang đỏ', CAST(300.00 AS Numeric(8, 2)), CAST(500.00 AS Numeric(8, 2)), 40, N'2016', N'WINE001', N'v16.jpg', N'Napa Valley', 1)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (427, N'Screaming Eagle', N'Rượu vang đỏ', CAST(1000.00 AS Numeric(8, 2)), CAST(2000.00 AS Numeric(8, 2)), 10, N'2014', N'WINE001', N'v9.jpg', N'Napa Valley', 3)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (428, N'Bollinger Rosé Brut', N'Rượu Sâm Panh', CAST(80.00 AS Numeric(8, 2)), CAST(160.00 AS Numeric(8, 2)), 80, N'NV', N'WINE003', N's17.jpg', N'Champagne', 2)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (429, N'Perrier-Jouët Belle Époque Brut', N'Rượu Sâm Panh', CAST(200.00 AS Numeric(8, 2)), CAST(400.00 AS Numeric(8, 2)), 60, N'2008', N'WINE003', N's19.jpg', N'Champagne', 1)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (430, N'Torbato', N'Rượu vang trắng', CAST(22.00 AS Numeric(8, 2)), CAST(45.00 AS Numeric(8, 2)), 80, N'2018', N'WINE002', N't26.jpg', N'Sardinia', 2)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (431, N'Chateau Palmer', N'Rượu vang đỏ', CAST(400.00 AS Numeric(8, 2)), CAST(700.00 AS Numeric(8, 2)), 35, N'2014', N'WINE001', N'v25.jpg', N'Bordeaux', 1)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (432, N'Gaja Barbaresco', N'Rượu vang đỏ', CAST(180.00 AS Numeric(8, 2)), CAST(320.00 AS Numeric(8, 2)), 70, N'2016', N'WINE001', N'v10.jpg', N'Piedmont', 1)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (433, N'Vega Sicilia Unico', N'Rượu vang đỏ', CAST(350.00 AS Numeric(8, 2)), CAST(600.00 AS Numeric(8, 2)), 60, N'2009', N'WINE001', N'v8.jpg', N'Ribera del Duero', 2)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (434, N'Veuve Clicquot Brut Rosé', N'Rượu Sâm Panh', CAST(65.00 AS Numeric(8, 2)), CAST(130.00 AS Numeric(8, 2)), 99, N'NV', N'WINE003', N's12.jpg', N'Champagne', 3)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (435, N'Biondi Santi Brunello di Montalcino', N'Rượu vang đỏ', CAST(180.00 AS Numeric(8, 2)), CAST(320.00 AS Numeric(8, 2)), 55, N'2013', N'WINE001', N'v19.jpg', N'Tuscany', 1)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (436, N'Vermentino', N'Rượu vang trắng', CAST(25.00 AS Numeric(8, 2)), CAST(50.00 AS Numeric(8, 2)), 70, N'2017', N'WINE002', N't19.jpg', N'Sardinia', 1)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (438, N'Catena Zapata Nicolas Catena Zapata', N'Rượu vang đỏ', CAST(120.00 AS Numeric(8, 2)), CAST(250.00 AS Numeric(8, 2)), 54, N'2017', N'WINE001', N'v13.jpg', N'Mendoza', 1)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (439, N'Taittinger Brut La Française', N'Rượu Sâm Panh', CAST(50.00 AS Numeric(8, 2)), CAST(100.00 AS Numeric(8, 2)), 149, N'NV', N'WINE003', N's8.jpg', N'Champagne', 2)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (440, N'Chateau Clinet', N'Rượu vang đỏ', CAST(180.00 AS Numeric(8, 2)), CAST(320.00 AS Numeric(8, 2)), 45, N'2015', N'WINE001', N'v30.jpg', N'Bordeaux', 3)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (441, N'Chateau dYquem', N'Rượu vang đỏ', CAST(250.00 AS Numeric(8, 2)), CAST(500.00 AS Numeric(8, 2)), 45, N'2015', N'WINE001', N'v12.jpg', N'Bordeaux', 3)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (442, N'Gruner Veltliner', N'Rượu vang trắng', CAST(22.00 AS Numeric(8, 2)), CAST(45.00 AS Numeric(8, 2)), 90, N'2020', N'WINE002', N't21.jpg', N'Wachau', 3)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (443, N'Veuve Clicquot La Grande Dame', N'Rượu vang đỏ', CAST(150.00 AS Numeric(8, 2)), CAST(300.00 AS Numeric(8, 2)), 40, N'2008', N'WINE001', N'v21.jpg', N'Champagne', 3)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (444, N'Veuve Clicquot Yellow Label Brut', N'Rượu Sâm Panh', CAST(55.00 AS Numeric(8, 2)), CAST(110.00 AS Numeric(8, 2)), 120, N'NV', N'WINE003', N's2.jpg', N'Champagne', 2)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (445, N'Fiano', N'Rượu vang trắng', CAST(28.00 AS Numeric(8, 2)), CAST(55.00 AS Numeric(8, 2)), 80, N'2019', N'WINE002', N't17.jpg', N'Campania', 2)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (446, N'Harlan Estate', N'Rượu vang đỏ', CAST(700.00 AS Numeric(8, 2)), CAST(1200.00 AS Numeric(8, 2)), 35, N'2013', N'WINE001', N'v11.jpg', N'Napa Valley', 2)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (447, N'Opus One', N'Rượu vang đỏ', CAST(250.00 AS Numeric(8, 2)), CAST(400.00 AS Numeric(8, 2)), 80, N'2016', N'WINE001', N'v3.jpg', N'Napa Valley', 3)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (448, N'Pinot Grigio', N'Rượu vang trắng', CAST(15.00 AS Numeric(8, 2)), CAST(30.00 AS Numeric(8, 2)), 56, N'2017', N'WINE002', N't4.jpg', N'Veneto', 1)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (449, N'Melon de Bourgogne', N'Rượu vang trắng', CAST(20.00 AS Numeric(8, 2)), CAST(40.00 AS Numeric(8, 2)), 80, N'2019', N'WINE002', N't23.jpg', N'Muscadet', 2)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (450, N'Bollinger Special Cuvée Brut', N'Rượu Sâm Panh', CAST(70.00 AS Numeric(8, 2)), CAST(140.00 AS Numeric(8, 2)), 100, N'NV', N'WINE003', N's6.jpg', N'Champagne', 3)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (451, N'Sémillon-Sauvignon Blanc', N'Rượu vang trắng', CAST(25.00 AS Numeric(8, 2)), CAST(50.00 AS Numeric(8, 2)), 80, N'2017', N'WINE002', N't13.jpg', N'Bordeaux', 1)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (452, N'Perrier-Jouët Grand Brut', N'Rượu Sâm Panh', CAST(45.00 AS Numeric(8, 2)), CAST(90.00 AS Numeric(8, 2)), 128, N'NV', N'WINE003', N's7.jpg', N'Champagne', 1)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (453, N'Dom Pérignon Brut Vintage', N'Rượu Sâm Panh', CAST(150.00 AS Numeric(8, 2)), CAST(300.00 AS Numeric(8, 2)), 80, N'2008', N'WINE003', N's3.jpg', N'Champagne', 3)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (454, N'Louis Roederer Cristal Brut', N'Rượu Sâm Panh', CAST(180.00 AS Numeric(8, 2)), CAST(350.00 AS Numeric(8, 2)), 70, N'2012', N'WINE003', N's5.jpg', N'Champagne', 2)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (455, N'Chateau Mouton Rothschild', N'Rượu vang đỏ', CAST(500.00 AS Numeric(8, 2)), CAST(900.00 AS Numeric(8, 2)), 45, N'2009', N'WINE001', N'v23.jpg', N'Bordeaux', 2)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (456, N'Trebbiano', N'Rượu vang trắng', CAST(30.00 AS Numeric(8, 2)), CAST(60.00 AS Numeric(8, 2)), 90, N'2017', N'WINE002', N't25.jpg', N'Tuscany', 1)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (457, N'Chateau Lafite Rothschild', N'Rượu vang đỏ', CAST(500.00 AS Numeric(8, 2)), CAST(1000.00 AS Numeric(8, 2)), 29, N'2000', N'WINE001', N'v2.jpg', N'Bordeaux', 2)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (458, N'Vega Sicilia Valbuena 5°', N'Rượu vang đỏ', CAST(150.00 AS Numeric(8, 2)), CAST(300.00 AS Numeric(8, 2)), 50, N'2015', N'WINE001', N'v28.jpg', N'Ribera del Duero', 1)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (459, N'Semillon', N'Rượu vang trắng', CAST(30.00 AS Numeric(8, 2)), CAST(60.00 AS Numeric(8, 2)), 60, N'2017', N'WINE002', N't8.jpg', N'Hunter Valley', 2)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (460, N'Joseph Phelps Insignia', N'Rượu vang đỏ', CAST(250.00 AS Numeric(8, 2)), CAST(450.00 AS Numeric(8, 2)), 60, N'2016', N'WINE001', N'v20.jpg', N'Napa Valley', 2)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (461, N'Roederer Estate Brut', N'Rượu Sâm Panh', CAST(25.00 AS Numeric(8, 2)), CAST(50.00 AS Numeric(8, 2)), 198, N'NV', N'WINE003', N's10.jpg', N'California', 1)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (462, N'Penfolds Bin 389', N'Rượu vang đỏ', CAST(120.00 AS Numeric(8, 2)), CAST(250.00 AS Numeric(8, 2)), 68, N'2016', N'WINE001', N'v24.jpg', N'South Australia', 3)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (463, N'Laurent-Perrier Cuvée Rosé Brut', N'Rượu Sâm Panh', CAST(70.00 AS Numeric(8, 2)), CAST(140.00 AS Numeric(8, 2)), 87, N'NV', N'WINE003', N's13.jpg', N'Champagne', 1)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (464, N'Picpoul Blanc', N'Rượu vang trắng', CAST(20.00 AS Numeric(8, 2)), CAST(40.00 AS Numeric(8, 2)), 100, N'2018', N'WINE002', N't18.jpg', N'Languedoc', 3)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (465, N'Müller-Thurgau', N'Rượu vang trắng', CAST(18.00 AS Numeric(8, 2)), CAST(35.00 AS Numeric(8, 2)), 63, N'2018', N'WINE002', N't14.jpg', N'Mosel', 2)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (466, N'Sine Qua Non Grenache', N'Rượu vang đỏ', CAST(600.00 AS Numeric(8, 2)), CAST(1000.00 AS Numeric(8, 2)), 30, N'2014', N'WINE001', N'v14.jpg', N'California', 2)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (467, N'Krug Clos du Mesnil Blanc de Blancs Brut', N'Rượu Sâm Panh', CAST(1000.00 AS Numeric(8, 2)), CAST(2000.00 AS Numeric(8, 2)), 16, N'2006', N'WINE003', N's20.jpg', N'Champagne', 2)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (468, N'Viognier', N'Rượu vang trắng', CAST(28.00 AS Numeric(8, 2)), CAST(55.00 AS Numeric(8, 2)), 80, N'2020', N'WINE002', N't6.jpg', N'Rhône Valley', 3)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (469, N'Chateau Latour', N'Rượu vang đỏ', CAST(700.00 AS Numeric(8, 2)), CAST(1200.00 AS Numeric(8, 2)), 25, N'2005', N'WINE001', N'v27.jpg', N'Bordeaux', 3)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (470, N'Penfolds Grange', N'Rượu vang đỏ', CAST(400.00 AS Numeric(8, 2)), CAST(700.00 AS Numeric(8, 2)), 40, N'2015', N'WINE001', N'v6.jpg', N'South Australia', 3)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (471, N'Moscato', N'Rượu vang trắng', CAST(18.00 AS Numeric(8, 2)), CAST(35.00 AS Numeric(8, 2)), 90, N'2020', N'WINE002', N't10.jpg', N'Piedmont', 1)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (472, N'Billecart-Salmon Brut Réserve', N'Rượu Sâm Panh', CAST(60.00 AS Numeric(8, 2)), CAST(120.00 AS Numeric(8, 2)), 110, N'NV', N'WINE003', N's11.jpg', N'Champagne', 2)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (473, N'Malvasia', N'Rượu vang trắng', CAST(25.00 AS Numeric(8, 2)), CAST(50.00 AS Numeric(8, 2)), 90, N'2018', N'WINE002', N't29.jpg', N'Sicily', 2)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (474, N'Chenin Blanc', N'Rượu vang trắng', CAST(20.00 AS Numeric(8, 2)), CAST(40.00 AS Numeric(8, 2)), 100, N'2018', N'WINE002', N't7.jpg', N'Loire Valley', 1)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (475, N'Krug Rosé Brut', N'Rượu Sâm Panh', CAST(300.00 AS Numeric(8, 2)), CAST(600.00 AS Numeric(8, 2)), 40, N'NV', N'WINE003', N's15.jpg', N'Champagne', 3)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (476, N'Moët & Chandon Brut Impérial', N'Rượu Sâm Panh', CAST(50.00 AS Numeric(8, 2)), CAST(100.00 AS Numeric(8, 2)), 150, N'NV', N'WINE003', N's1.jpg', N'Champagne', 1)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (477, N'Chateau Petrus', N'Rượu vang đỏ', CAST(800.00 AS Numeric(8, 2)), CAST(1500.00 AS Numeric(8, 2)), 14, N'2005', N'WINE001', N'v7.jpg', N'Bordeaux', 1)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (478, N'Albariño', N'Rượu vang trắng', CAST(25.00 AS Numeric(8, 2)), CAST(50.00 AS Numeric(8, 2)), 80, N'2019', N'WINE002', N't9.jpg', N'Rías Baixas', 3)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (479, N'Louis Roederer Cristal Rosé Brut', N'Rượu Sâm Panh', CAST(280.00 AS Numeric(8, 2)), CAST(550.00 AS Numeric(8, 2)), 39, N'2009', N'WINE003', N's16.jpg', N'Champagne', 1)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (480, N'Chardonnay', N'Rượu vang trắng', CAST(25.00 AS Numeric(8, 2)), CAST(50.00 AS Numeric(8, 2)), 99, N'2019', N'WINE002', N't1.jpg', N'California', 1)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (481, N'La Rioja Alta Gran Reserva 904', N'Rượu vang đỏ', CAST(80.00 AS Numeric(8, 2)), CAST(150.00 AS Numeric(8, 2)), 64, N'2010', N'WINE001', N'v15.jpg', N'Rioja', 3)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (482, N'Marsanne', N'Rượu vang trắng', CAST(20.00 AS Numeric(8, 2)), CAST(40.00 AS Numeric(8, 2)), 67, N'2019', N'WINE002', N't15.jpg', N'Rhône Valley', 3)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (483, N'Sauvignon Blanc-Sémillon', N'Rượu vang trắng', CAST(20.00 AS Numeric(8, 2)), CAST(40.00 AS Numeric(8, 2)), 68, N'2020', N'WINE002', N't28.jpg', N'Bordeaux', 1)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (484, N'Sauvignon Blanc', N'Rượu vang trắng', CAST(20.00 AS Numeric(8, 2)), CAST(40.00 AS Numeric(8, 2)), 76, N'2020', N'WINE002', N't2.jpg', N'Marlborough', 2)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (485, N'Colombard', N'Rượu vang trắng', CAST(18.00 AS Numeric(8, 2)), CAST(35.00 AS Numeric(8, 2)), 93, N'2018', N'WINE002', N't22.jpg', N'Côtes de Gascogne', 1)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (486, N'Pecorino', N'Rượu vang trắng', CAST(25.00 AS Numeric(8, 2)), CAST(50.00 AS Numeric(8, 2)), 70, N'2020', N'WINE002', N't24.jpg', N'Abruzzo', 3)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (487, N'Gewürztraminer', N'Rượu vang trắng', CAST(22.00 AS Numeric(8, 2)), CAST(45.00 AS Numeric(8, 2)), 70, N'2019', N'WINE002', N't5.jpg', N'Alsace', 2)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (488, N'Torrontés', N'Rượu vang trắng', CAST(22.00 AS Numeric(8, 2)), CAST(45.00 AS Numeric(8, 2)), 70, N'2019', N'WINE002', N't12.jpg', N'Salta', 3)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (489, N'Chasselas', N'Rượu vang trắng', CAST(18.00 AS Numeric(8, 2)), CAST(35.00 AS Numeric(8, 2)), 85, N'2019', N'WINE002', N't27.jpg', N'Switzerland', 3)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (490, N'Dominus Estate', N'Rượu vang đỏ', CAST(200.00 AS Numeric(8, 2)), CAST(350.00 AS Numeric(8, 2)), 70, N'2017', N'WINE001', N'v5.jpg', N'Napa Valley', 2)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (491, N'Chateau Margaux', N'Rượu vang đỏ', CAST(300.00 AS Numeric(8, 2)), CAST(500.00 AS Numeric(8, 2)), 50, N'1995', N'WINE001', N'v1.jpg', N'Bordeaux', 1)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (492, N'Riesling', N'Rượu vang trắng', CAST(18.00 AS Numeric(8, 2)), CAST(35.00 AS Numeric(8, 2)), 107, N'2018', N'WINE002', N't3.jpg', N'Mosel', 3)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (493, N'Sassicaia', N'Rượu vang đỏ', CAST(150.00 AS Numeric(8, 2)), CAST(300.00 AS Numeric(8, 2)), 60, N'2015', N'WINE001', N'v4.jpg', N'Tuscany', 1)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (494, N'Krug Grande Cuvée Brut', N'Rượu Sâm Panh', CAST(200.00 AS Numeric(8, 2)), CAST(400.00 AS Numeric(8, 2)), 60, N'NV', N'WINE003', N's4.jpg', N'Champagne', 1)
INSERT [dbo].[SanPham] ([ProductID], [ProductName], [Description], [PurchasePrice], [Price], [Quantity], [Vintage], [CatalogyID], [Image], [Region], [MaNhaSanXuat]) VALUES (495, N'Chateau Lynch-Bages', N'Rượu vang đỏ', CAST(200.00 AS Numeric(8, 2)), CAST(350.00 AS Numeric(8, 2)), 40, N'2016', N'WINE001', N'v29.jpg', N'Bordeaux', 2)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_KhachHang] FOREIGN KEY([idKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_KhachHang]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK_GioHang_KhachHang1] FOREIGN KEY([idKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK_GioHang_KhachHang1]
GO
ALTER TABLE [dbo].[ItemCart]  WITH CHECK ADD  CONSTRAINT [FK_ItemCart_DonHang] FOREIGN KEY([idDonHang])
REFERENCES [dbo].[DonHang] ([MaDonHang])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[ItemCart] CHECK CONSTRAINT [FK_ItemCart_DonHang]
GO
ALTER TABLE [dbo].[ItemCart]  WITH CHECK ADD  CONSTRAINT [FK_ItemCart_GioHang] FOREIGN KEY([idGioHang])
REFERENCES [dbo].[GioHang] ([MaGioHang])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[ItemCart] CHECK CONSTRAINT [FK_ItemCart_GioHang]
GO
ALTER TABLE [dbo].[ItemCart]  WITH CHECK ADD  CONSTRAINT [FK_ItemCart_SanPham] FOREIGN KEY([idSanPham])
REFERENCES [dbo].[SanPham] ([ProductID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[ItemCart] CHECK CONSTRAINT [FK_ItemCart_SanPham]
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_ChucNang] FOREIGN KEY([idChucNang])
REFERENCES [dbo].[ChucNang] ([ID])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_ChucNang]
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_KhachHang] FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_KhachHang]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaNhaSanXuat])
REFERENCES [dbo].[NhaSanXuat] ([MaNhaSanXuat])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_Products_Catalogy] FOREIGN KEY([CatalogyID])
REFERENCES [dbo].[LoaiSanPham] ([CatalogyID])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_Products_Catalogy]
GO
ALTER TABLE [dbo].[SanPham_DonHang]  WITH CHECK ADD FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[SanPham_DonHang]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[SanPham] ([ProductID])
GO
