USE [master]
GO
CREATE DATABASE [MoonMoonStore] 
GO
USE [MoonMoonStore]

/* Table roles */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
	
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



/* Table users */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[phone] [nvarchar](10) NULL,
	[address] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO	

/* Table order */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [int] NOT NULL,
	[userID] [nvarchar](50) NULL,
	[date] [Date] NULL,
	[total] [float] NULL,
	[payment] [nvarchar](50) NULL
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO	

/* Table order detail */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[detailID] [int] NOT NULL,
	[orderID] [int] NULL,
	[productID] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO	

/* Table category */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO	

/* Table product */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productID] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[image] [nvarchar](50) NULL,
	[price] [float] NULL,
	[categoryID] [nvarchar](50),
	[quantity] [int] NULL
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO	


INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (N'VIP', N'Luxury milk tea')
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (N'Common', N'Common milk tea')

GO

INSERT [dbo].[tblProduct] ([productID], [name], [image], [price], [categoryID], [quantity]) VALUES (1, N'Can Can', N'product_list_1.jpg', 5.0, N'Common', 30) 
INSERT [dbo].[tblProduct] ([productID], [name], [image], [price], [categoryID], [quantity]) VALUES (2, N'Matcha Matcha', N'product_list_2.jpg', 7.0, N'Common', 30) 
INSERT [dbo].[tblProduct] ([productID], [name], [image], [price], [categoryID], [quantity]) VALUES (3, N'Mistine Tea', N'product_list_3.jpg', 20.0, N'VIP', 20) 
INSERT [dbo].[tblProduct] ([productID], [name], [image], [price], [categoryID], [quantity]) VALUES (4, N'Mirin Mirin milk', N'product_list_4.jpg', 15.0, N'VIP', 15)
INSERT [dbo].[tblProduct] ([productID], [name], [image], [price], [categoryID], [quantity]) VALUES (5, N'Milk Cacao', N'product_list_5.jpg', 5.3, N'Common', 100)


INSERT [dbo].[tblRoles] ([roleID], [name]) VALUES (N'AD', N'Admin')
INSERT [dbo].[tblRoles] ([roleID], [name]) VALUES (N'US', N'User')

INSERT [dbo].[tblUsers] ([userID], [fullName], [phone], [address], [email], [password], [roleID]) VALUES (N'thekhoi19', N'Le The Khoi', '0123456789', N'123 La Xuan Oai, Quan 9, TPHCM', N'thekhoi@gmail.com', N'khoi', N'AD')
INSERT [dbo].[tblUsers] ([userID], [fullName], [phone], [address], [email], [password], [roleID]) VALUES (N'kingkong', N'Lee Chong Wei', '0365897421', N'1 Le Hong Phong, Quan 9, TPHCM', N'weiwei@gmail.com', N'1', N'US')
INSERT [dbo].[tblUsers] ([userID], [fullName], [phone], [address], [email], [password], [roleID]) VALUES (N'abcdefg', N'Nguyen The Anh', '0345612378', N'89 Chiaroscuro Rd, Portland, USA', N'anhanh@gmail.com', N'12345', N'US')
INSERT [dbo].[tblUsers] ([userID], [fullName], [phone], [address], [email], [password], [roleID]) VALUES (N'zzzz', N'Giang Cat Luong', '0135555735', N'25, rue Lauriston, Paris, France', N'luongluong@gmail.com', N'1', N'US')
INSERT [dbo].[tblUsers] ([userID], [fullName], [phone], [address], [email], [password], [roleID]) VALUES (N'khoitran', N'khoi cong tran', '0999355411', N'Via Monte Bianco 34, Turin, Italy', N'congcong@gmail.com', N'1', N'US')


