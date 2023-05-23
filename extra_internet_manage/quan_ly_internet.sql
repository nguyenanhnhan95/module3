create database quan_ly_internet;
use quan_ly_internet;

create table loai_khach_hang(
ma_loai_khach_hang int primary key auto_increment,
ten_loai_khach_hang varchar(45) not null
);

create table dich_vu_di_kem(
ma_dich_vu_di_kem int primary key auto_increment,
ten_dich_vu_di_kem varchar(45),
gia_dich_vu double
);

create table may_tinh(
ma_may_tinh int primary key auto_increment,
hang_san_xuat varchar(45),
vi_tri_dat_may int,
tien_gio double
);

create table khach_hang(
ma_khach_hang int primary key auto_increment,
ccdc_khach_hang varchar(12) ,
ten_khach_hang varchar(45) not null,
so_dien_thoai_khach_hang varchar(10) not null,
email_khach_hang varchar(45),
ma_loai_khach_hang int,
foreign key(ma_loai_khach_hang) references loai_khach_hang(ma_loai_khach_hang)
);

create table quan_ly_khach_hang(
ma_quan_ly_khach_hang int primary key auto_increment,
ma_may_tinh int,
foreign key(ma_may_tinh) references may_tinh(ma_may_tinh),
ma_khach_hang int,
foreign key(ma_khach_hang) references khach_hang(ma_khach_hang),
thoi_gian_bat_dau datetime,
thoi_gian_ket_thuc datetime,
ma_dich_vu_di_kem int,
foreign key(ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem)
);
create table quan_ly_dich_vu_di_kem(
ma_quan_ly_khach_hang int,
foreign key(ma_quan_ly_khach_hang) references quan_ly_khach_hang(ma_quan_ly_khach_hang),
ma_dich_vu_di_kem int,
foreign key(ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem)
);

