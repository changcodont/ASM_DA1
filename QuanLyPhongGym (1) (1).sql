create database QuanLyPhongGym

use QuanLyPhongGym

create table KhachHang(
	MaKH nvarchar(10) primary key not null,
	HoTen nvarchar(50) not null,
	SDT nvarchar(10) not null,
	Email nvarchar(50) not null,
	GioiTinh bit not null,
)


INSERT INTO KhachHang (MaKH, HoTen, SDT, Email, GioiTinh)
VALUES ('KH001', N'Nguyễn Văn A', '0901234567', N'nguyenvana@gmail.com', 1);

INSERT INTO KhachHang (MaKH, HoTen, SDT, Email, GioiTinh)
VALUES ('KH002', N'Trần Thị B', '0912345678', N'tranthib@gmail.com', 0);

INSERT INTO KhachHang (MaKH, HoTen, SDT, Email, GioiTinh)
VALUES ('KH003', N'Lê Văn C', '0923456789', N'levanc@gmail.com', 1);

INSERT INTO KhachHang (MaKH, HoTen, SDT, Email, GioiTinh)
VALUES ('KH004', N'Phạm Thị D', '0934567890', N'phamthid@gmail.com', 0);

INSERT INTO KhachHang (MaKH, HoTen, SDT, Email, GioiTinh)
VALUES ('KH005', N'Trương Văn E', '0945678901', N'truongvane@gmail.com', 1);

create table NhanVien(
	MaNV nvarchar(10) primary key not null,
	HoTen nvarchar(50) not null,
	MatKhau nvarchar(50) not null,
	NgaySinh date not null,
	SDT nvarchar(10) not null,
	Email nvarchar(50) not null,
	VaiTro bit not null,
	GioiTinh bit not null,
	Luong float not null,
	Hinh nvarchar(50) not null
)


INSERT INTO NhanVien (MaNV, HoTen, MatKhau, NgaySinh, SDT, Email, VaiTro, GioiTinh, Luong, Hinh)
VALUES ('NV001', N'Nguyễn Văn A',N'123', '1990-01-05', '0901234567', N'dlehoang415@gmail.com', 1, 1, 15000000, N'anh1.jpg');

INSERT INTO NhanVien (MaNV, HoTen, MatKhau, NgaySinh, SDT, Email, VaiTro, GioiTinh, Luong, Hinh)
VALUES ('NV002', N'Trần Thị B',N'123', '1995-06-10', '0912345678', N'tranthib@gmail.com', 0, 0, 8000000, N'anh2.jpg');

INSERT INTO NhanVien (MaNV, HoTen, MatKhau, NgaySinh, SDT, Email, VaiTro, GioiTinh, Luong, Hinh)
VALUES ('NV003', N'Lê Văn C',N'123', '1992-03-15', '0923456789', N'levanc@gmail.com', 0, 1, 12000000, N'anh3.jpg');

INSERT INTO NhanVien (MaNV, HoTen, MatKhau, NgaySinh, SDT, Email, VaiTro, GioiTinh, Luong, Hinh)
VALUES ('NV004', N'Phạm Thị D',N'123', '1998-12-20', '0934567890', N'phamthid@gmail.com', 0, 0, 9000000, N'anh4.jpg');

INSERT INTO NhanVien (MaNV, HoTen, MatKhau, NgaySinh, SDT, Email, VaiTro, GioiTinh, Luong, Hinh)
VALUES ('NV005', N'Trương Văn E',N'123', '1994-09-25', '0945678901', N'truongvane@gmail.com', 1, 1, 10000000, N'anh5.jpg');


create table GoiTap(
	MaGT nvarchar(10) primary key not null,
	TenGoi nvarchar(50) not null,
	Gia float not null,
	ThoiHan int not null,
	MoTa nvarchar(100) not null
)

INSERT INTO GoiTap (MaGT, TenGoi, Gia, ThoiHan, MoTa)
VALUES ('GT001', N'Gói Tháng', 500000, 30, N'Gói tập trong một tháng');

INSERT INTO GoiTap (MaGT, TenGoi, Gia, ThoiHan, MoTa)
VALUES ('GT002', N'Gói Quý', 1200000, 90, N'Gói tập trong ba tháng');

INSERT INTO GoiTap (MaGT, TenGoi, Gia, ThoiHan, MoTa)
VALUES ('GT003', N'Gói Năm', 4000000, 365, N'Gói tập trong một năm');

INSERT INTO GoiTap (MaGT, TenGoi, Gia, ThoiHan, MoTa)
VALUES ('GT004', N'Gói Ngày', 30000, 1, N'Gói tập trong một ngày');


create table DonHang(
	MaDH nvarchar(10) primary key not null,
	MaNV nvarchar(10) not null,
	MaKH nvarchar(10) null,
	NgayTao date not null,
	TrangThai bit not null,
	TongTien float not null,
	TienNhan float not null,
	TienThua float not null,
	foreign key (MaNV) references NhanVien(MaNV),
	foreign key (MaKH) references KhachHang(MaKH)
)

create table DonHang(
	MaDH INT IDENTITY(1,1) PRIMARY KEY,
	MaNV nvarchar(10) not null,
	MaKH nvarchar(10) null,
	NgayTao date not null,
	TrangThai bit not null,
	TongTien float not null,
	TienNhan float not null,
	TienThua float not null,
	foreign key (MaNV) references NhanVien(MaNV),
	foreign key (MaKH) references KhachHang(MaKH)
)

drop table DonHang

set identity_insert DonHang on

create table ChiTietGoiTap(
	MaCTGT nvarchar(10) primary key not null,
	MaKH nvarchar(10) not null,
	MaGT nvarchar(10) not null,
	MaDH nvarchar(10) not null,
	NgayDK date not null,
	NgayKT date not null,
	Gia float not null,
	foreign key(MaKH) references KhachHang(MaKH),
	foreign key(MaGT) references GoiTap(MaGT),
	foreign key(MaDH) references DonHang(MaDH)
)

drop table ChiTietGoiTap

create table ThuePT(
	MaThue nvarchar(10) primary key not null,
	MaKH nvarchar(10) not null,
	MaNV nvarchar(10) null,
	NgayThue date not null,
	NgayKT date null,
	Gia float not null,
	foreign key(MaKH) references KhachHang(MaKH),
	foreign key (MaNV) references NhanVien(MaNV)
)



create table DungCu(
	MaDC nvarchar(10) primary key not null,
	TenDungCu nvarchar(50) not null,
	Gia float not null,
	SoLuong int not null,
	Hinh nvarchar(50) not null
)

INSERT INTO DungCu (MaDC, TenDungCu, Gia, SoLuong,Hinh)
VALUES ('DC001', 'Kiềm bóp tay 50kg', 200000, 10,N'anh1.jpg');

INSERT INTO DungCu (MaDC, TenDungCu, Gia, SoLuong,Hinh)
VALUES ('DC002', N'Đồ long đao 100KG', 300000, 20,N'anh1.jpg');

INSERT INTO DungCu (MaDC, TenDungCu, Gia, SoLuong,Hinh)
VALUES ('DC003', N'Đồ long đao 150kg', 50000, 30,N'anh1.jpg');

INSERT INTO DungCu (MaDC, TenDungCu, Gia, SoLuong,Hinh)
VALUES ('DC004', N'Găng tay bảo hộ', 150000, 15,N'anh1.jpg');

INSERT INTO DungCu (MaDC, TenDungCu, Gia, SoLuong,Hinh)
VALUES ('DC005', N'Đai lưng', 5000000, 5,N'anh1.jpg');

create table ChiTietDonHang(
	MaCTDH nvarchar(10) primary key not null,
	MaDC nvarchar(10) not null,
	MaDH nvarchar(10) not null,
	SoLuong int not null,
	Gia float not null,
	ThanhTien float not null,
	foreign key(MaDC) references DungCu(MaDC),
	foreign key (MaDH) references DonHang(MaDH)
)

drop table ChiTietDonHang

create table MayMoc(
	MaMay nvarchar(10) primary key not null,
	TenMay nvarchar(50) not null,
	SoLuong int not null
)

INSERT INTO MayMoc (MaMay, TenMay, SoLuong)
VALUES ('M001', N'Máy Tập Xe Đạp', 5);

INSERT INTO MayMoc (MaMay, TenMay, SoLuong)
VALUES ('M002', N'Máy Chạy Bộ', 3);

INSERT INTO MayMoc (MaMay, TenMay, SoLuong)
VALUES ('M003', N'Máy Tập Cơ Bụng', 10);

INSERT INTO MayMoc (MaMay, TenMay, SoLuong)
VALUES ('M004', N'Máy Tập Chân', 7);

INSERT INTO MayMoc (MaMay, TenMay, SoLuong)
VALUES ('M005', N'Máy Tập Tay', 2);

create table KiemKeTinhTrang(
	MaKiemKe nvarchar(10) primary key not null,
	MaNV nvarchar(10) not null,
	NgayKiemKe date not null
	foreign key (MaNV) references NhanVien(MaNV)
)

create table KiemKeChiTiet(
	MaKKCT nvarchar(10) primary key not null,
	MaMay nvarchar(10) not null,
	MaKiemKe nvarchar(10) not null,
	TinhTrang bit not null,
	foreign key (MaMay) references MayMoc(MaMay),
	foreign key (MaKiemKe) references KiemKeTinhTrang(MaKiemKe)
)