create database transfer_erd;
use transfer_erd;
create table NHACC(
MaNCC int primary key auto_increment,
TenNCC varchar(45) not null,
DiaChi varchar(45) not null
);
create table SDT(
SoDT varchar(20) primary key,
MaNCC int not null,
foreign key (MaNCC) references NHACC(MaNCC)
);
create table DONDH(
SoDH int primary key auto_increment,
NgayDH datetime not null,
MaNCC int not null,
foreign key (MaNCC) references NHACC(MaNCC)
);
create table vattu_dondh(
SoDH int not null,
MaVTU int not null,
primary key(MaVTU,SoDH),
foreign key(MaVTU) references VATTU(MaVTU),
foreign key(SoDH) references DONDH(SoDH)
);
create table VATTU(
MaVTU int primary key auto_increment,
TenVTU varchar(45) not null
);
create table PHIEUNHAP(
SoPN int primary key auto_increment,
NgayNhap datetime not null
);
create table vattu_phieunhap(
MaVTU int,
SoPN int,
primary key(MaVTU,SoPN),
foreign key(MaVTU) references VATTU(MaVTU),
foreign key(SoPN) references PHIEUNHAP(SoPN),
DGNhap int not null,
SLNhap int not null
);
create table PHIEUXUAT(
SoPX int primary key auto_increment,
NgayXuat datetime not null,
SLXuat int not null
);
create table phieuxuat_vattu(
DGXuat int not null,
SLXuat int not null,
SoPX int,
MaVTU int,
primary key(MaVTU,SoPX),
foreign key(MaVTU) references VATTU(MaVTU),
foreign key(SoPX) references PHIEUXUAT(SoPX)
);





