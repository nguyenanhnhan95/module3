create database quan_ly_vat_tu;
use quan_ly_vat_tu;
create table nha_cung_cap(
MaNCC int primary key auto_increment,
TenNCC varchar(45) not null,
DiaChi varchar(45) not null
);
create table so_dien_thoai(
SoDT varchar(20) primary key,
MaNCC int not null,
foreign key (MaNCC) references nha_cung_cap(MaNCC)
);
create table don_dat_hang(
SoDH int primary key auto_increment,
NgayDH datetime not null,
MaNCC int not null,
foreign key (MaNCC) references nha_cung_cap(MaNCC)
);
create table phieu_nhap(
SoPN int primary key auto_increment,
NgayNhap datetime not null
);

create table phieu_xuat(
SoPX int primary key auto_increment,
NgayXuat datetime not null,
SLXuat int not null
);

create table vat_tu(
MaVTU int primary key auto_increment,
TenVTU varchar(45) not null
);
create table vat_tu_don_dat_hang(
SoDH int not null,
MaVTU int not null,
primary key(MaVTU,SoDH),
foreign key(MaVTU) references vat_tu(MaVTU),
foreign key(SoDH) references don_dat_hang(SoDH)
);
create table vat_tu_phieu_nhap(
MaVTU int,
SoPN int,
primary key(MaVTU,SoPN),
foreign key(MaVTU) references vat_tu(MaVTU),
foreign key(SoPN) references phieu_nhap(SoPN),
DGNhap int not null,
SLNhap int not null
);
create table vat_tu_phieu_xuat(
DGXuat int not null,
SLXuat int not null,
SoPX int,
MaVTU int,
primary key(MaVTU,SoPX),
foreign key(MaVTU) references vat_tu(MaVTU),
foreign key(SoPX) references phieu_xuat(SoPX)
);








