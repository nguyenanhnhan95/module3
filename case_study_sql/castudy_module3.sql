create database data_furama;
use data_furama;
CREATE TABLE vi_tri (
    ma_vi_tri INT PRIMARY KEY AUTO_INCREMENT,
    ten_vi_tri VARCHAR(45)
);
CREATE TABLE trinh_do (
    ma_trinh_do INT PRIMARY KEY AUTO_INCREMENT,
    ten_trinh_do VARCHAR(45)
);
CREATE TABLE bo_phan (
    ma_bo_phan INT PRIMARY KEY AUTO_INCREMENT,
    ten_bo_phan VARCHAR(45)
);
CREATE TABLE nhan_vien (
    ma_nhan_vien INT PRIMARY KEY AUTO_INCREMENT,
    ho_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    so_cmnd VARCHAR(45) NOT NULL,
    luong DOUBLE NOT NULL,
    so_dien_thoai VARCHAR(45) NOT NULL,
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    ma_vi_tri INT,
    FOREIGN KEY (ma_vi_tri)
        REFERENCES vi_tri (ma_vi_tri),
    ma_trinh_do INT,
    FOREIGN KEY (ma_trinh_do)
        REFERENCES trinh_do (ma_trinh_do),
    ma_bo_phan INT,
    FOREIGN KEY (ma_bo_phan)
        REFERENCES bo_phan (ma_bo_phan)
);

CREATE TABLE dich_vu_di_kem (
    ma_dich_vu_di_kem INT PRIMARY KEY AUTO_INCREMENT,
    ten_dich_vu_di_kem VARCHAR(45) NOT NULL,
    gia DOUBLE NOT NULL,
    don_vi VARCHAR(10) NOT NULL,
    trang_thai VARCHAR(45)
);
CREATE TABLE loai_khach (
    ma_loai_khach INT PRIMARY KEY AUTO_INCREMENT,
    ten_loai_khach VARCHAR(45)
);
CREATE TABLE loai_dich_vu (
    ma_loai_dich_vu INT PRIMARY KEY AUTO_INCREMENT,
    ten_loai_dich_vu VARCHAR(45)
);
CREATE TABLE kieu_thue (
    ma_kieu_thue INT PRIMARY KEY AUTO_INCREMENT,
    ten_kieu_thue VARCHAR(45)
);
CREATE TABLE dich_vu (
    ma_dich_vu INT PRIMARY KEY AUTO_INCREMENT,
    ten_dich_vu VARCHAR(45) NOT NULL,
    dien_tich INT,
    chi_phi_thue DOUBLE NOT NULL,
    so_nguoi_toi_da INT,
    tieu_chuan_phong VARCHAR(45),
    mo_ta_tien_nghi_khac VARCHAR(45),
    dien_tich_ho_boi DOUBLE,
    so_tang INT,
    ma_kieu_thue INT,
    ma_loai_dich_vu INT,
    FOREIGN KEY (ma_kieu_thue)
        REFERENCES kieu_thue (ma_kieu_thue),
    FOREIGN KEY (ma_loai_dich_vu)
        REFERENCES loai_dich_vu (ma_loai_dich_vu)
);
CREATE TABLE khach_hang (
    ma_khach_hang INT PRIMARY KEY AUTO_INCREMENT,
    ho_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    gioi_tinh BIT(1) NOT NULL,
    so_cmnd VARCHAR(45) NOT NULL,
    so_dien_thoai VARCHAR(45) NOT NULL,
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    ma_loai_khach INT,
    FOREIGN KEY (ma_loai_khach)
        REFERENCES loai_khach (ma_loai_khach)
);
CREATE TABLE hop_dong (
    ma_hop_dong INT PRIMARY KEY AUTO_INCREMENT,
    ngay_lam_hop_dong DATETIME NOT NULL,
    ngay_ket_thuc DATETIME NOT NULL,
    tien_dat_coc DOUBLE NOT NULL,
    ma_nhan_vien INT,
    FOREIGN KEY (ma_nhan_vien)
        REFERENCES nhan_vien (ma_nhan_vien),
    ma_khach_hang INT,
    FOREIGN KEY (ma_khach_hang)
        REFERENCES khach_hang (ma_khach_hang),
    ma_dich_vu INT,
    FOREIGN KEY (ma_dich_vu)
        REFERENCES dich_vu (ma_dich_vu)
);
CREATE TABLE hop_dong_chi_tiet (
    ma_hop_dong_chi_tiet INT PRIMARY KEY AUTO_INCREMENT,
    ma_hop_dong INT,
    FOREIGN KEY (ma_hop_dong)
        REFERENCES hop_dong (ma_hop_dong),
    so_luong INT NOT NULL,
    ma_dich_vu_di_kem INT,
    FOREIGN KEY (ma_dich_vu_di_kem)
        REFERENCES dich_vu_di_kem (ma_dich_vu_di_kem)
);
	

insert into vi_tri(ten_vi_tri)
value("Quản Lý"),("Nhân Viên");

insert into trinh_do(ten_trinh_do)
value("Trung Cấp"),("Cao Đẳng"),("Đại Học"),("Sau Đại Học");

insert into bo_phan(ten_bo_phan)
value ("Sale-Marketing"),("Hành chính"),("Phục vụ"),("Quản lý");

insert into loai_khach(ten_loai_khach)
value("Diamond"),("Platinium"),("Gold"),("Silver"),("Member");

insert into nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan)
value
	("Nguyễn Văn An",'1970-11-07',456231786,10000000,0901234121,"annguyen@gmail.com","295 Nguyễn Tất Thành, Đà Nẵng",1,3,1),
	("Lê Văn Bình",'1997-04-09',654231234,7000000,0934212314,"binhlv@gmail.com","22 Yên Bái, Đà Nẵng",1,2,2),
	("Hồ Thị Yến",'1995-12-12',999231723,14000000,0412352315,"thiyen@gmail.com","K234/11 Điện Biên Phủ, Gia Lai",1,3,2),
	("Võ Công Toản",'1980-04-04',123231365,17000000,0374443232,"toan0404@gmail.com","77 Hoàng Diệu, Quảng Trị",1,4,4),
	("Nguyễn Bỉnh Phát",'1999-12-09',454363232,6000000,0902341231,"phatphat@gmail.com","43 Yên Bái, Đà Nẵng",2,1,1),
	("Khúc Nguyễn An Nghi",'2000-11-08',964542311,7000000,0978653213,"annghi20@gmail.com","294 Nguyễn Tất Thành, Đà Nẵng",2,2,3),
	("Nguyễn Hữu Hà",'1993-01-01',534323231,8000000,0941234553,"nhh0101@gmail.com","4 Nguyễn Chí Thanh, Huế",2,3,2),
	("Nguyễn Hà Đông",'1989-09-03',234414123,9000000,0642123111,"donghanguyen@gmail.com","111 Hùng Vương, Hà Nội",2,4,4),
	("Tòng Hoang",'1982-09-03',256781231,6000000,0245144444,"hoangtong@gmail.com","213 Hàm Nghi, Đà Nẵng",2,4,4),
	("Nguyễn Công Đạo",'1994-01-08',755434343,8000000,0988767111,"nguyencongdao12@gmail.com","6 Hoà Khánh, Đồng Nai",2,3,2);
    
insert into khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach)
value("Nguyễn Thị Hào",'1970-11-07',0,643431213,0945423362,"thihao07@gmail.com","23 Nguyễn Hoàng, Đà Nẵng",5),
	("Phạm Xuân Diệu",'1992-08-08',1,865342123,0954333333,"xuandieu92@gmail.com","K77/22 Thái Phiên, Quảng Trị",3),
	("Trương Đình Nghệ",'1990-02-27',1,488645199,0373213122,"nghenhan2702@gmail.com","K323/12 Ông Ích Khiêm, Vinh",1),
	("Dương Văn Quan",'1981-07-08',1,543432111,0490039241,"duongquan@gmail.com","K453/12 Lê Lợi, Đà Nẵng",1),
	("Hoàng Trần Nhi Nhi",'1995-12-09',0,795453345,0312345678,"nhinhi123@gmail.com","224 Lý Thái Tổ, Gia Lai",4),
	("Tôn Nữ Mộc Châu",'2005-12-06',0,732434215,0988888844,"tonnuchau@gmail.com","37 Yên Thế, Đà Nẵng",4),
	("Nguyễn Mỹ Kim",'1984-04-08',0,856453123,0912345698,"kimcuong84@gmail.com","K123/45 Lê Lợi, Hồ Chí Minh",1),
	("Nguyễn Thị Hào",'1999-04-08',0,965656433,0763212345,"haohao99@gmail.com","55 Nguyễn Văn Linh, Kon Tum",3),
	("Trần Đại Danh",'1994-07-01',1,432341235,0643343433,"danhhai99@gmail.com","24 Lý Thường Kiệt, Quảng Ngãi",1),
	("Nguyễn Tâm Đắc",'1989-07-01',1,344343432,0987654321,"dactam@gmail.com","22 Ngô Quyền, Đà Nẵng",2);
insert into kieu_thue(ten_kieu_thue)
value("year"),("month"),("day"),("hour");
insert into loai_dich_vu(ten_loai_dich_vu)
value("Villa"),("House"),("Room");

insert into dich_vu(ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,ma_kieu_thue,ma_loai_dich_vu)
value("Villa Beach Front",25000,10000000,10,"vip","Có hồ bơi",500,4,3,1),
("House Princess 01",14000,5000000,7,"vip","Có thêm bếp nướng",null,3,2,2),
("Room Twin 01",5000,1000000,2,"normal","Có tivi",null,null,4,3),
("Villa No Beach Front",22000,9000000,8,"normal","Có hồ bơi",300,3,3,1),
("House Princess 02",10000,4000000,5,"normal","Có thêm bếp nướng",null,2,3,2),
("Room Twin 02",3000,900000,2,"normal","Có tivi",null,null,4,3);

insert into dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi,trang_thai)
value("Karaoke",10000,"giờ","tiện nghi,hiện tại"),
("Thuê xe máy",10000,"chiếc","hỏng 1 xe"),	
("Thuê xe đạp",20000,"chiếc","tốt"),	
("Buffet buổi sáng",15000,"suất","đầy đủ đồ ăn, tráng miệng	"),
("Buffet buổi trưa",90000,"suất","đầy đủ đồ ăn, tráng miệng"),
("Buffet buổi tối",16000,"suất","đầy đủ đồ ăn, tráng miệng");

insert into hop_dong(ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu)
value('2020-12-08','2020-12-08',0,3,1,3),
	('2020-07-14','2020-07-21',200000,7,3,1),
	('2021-03-15','2021-03-17',50000,3,4,2),
	('2021-01-14','2021-01-18',100000,7,5,5),
	('2021-07-14','2021-07-15',0,7,2,6),
	('2021-06-01','2021-06-03',0,7,7,6),
	('2021-09-02','2021-09-05',100000,7,4,4),
	('2021-06-17','2021-06-18',150000,3,4,1),
	('2020-11-19','2020-11-19',0,3,4,3),
	('2021-04-12','2021-04-14',0,10,3,5),
	('2021-04-25','2021-04-25',0,2,2,1),
	('2021-05-25','2021-05-27',0,7,10,1);
insert into hop_dong_chi_tiet(ma_hop_dong,so_luong,ma_dich_vu_di_kem)
value(2,5,4),(2,8,5),(2,15,6),(3,1,1),(3,11,2),(1,1,3),(1,2,2),(12,2,2);

SELECT 
    *
FROM
    nhan_vien
WHERE
    (SUBSTRING_INDEX(ho_ten, ' ', - 1) LIKE 'H%'
        OR SUBSTRING_INDEX(ho_ten, ' ', - 1) LIKE 'T%'
        OR SUBSTRING_INDEX(ho_ten, ' ', - 1) LIKE 'K%')
        AND (CHAR_LENGTH(ho_ten) < 16);

SELECT 
    *
FROM
    khach_hang
WHERE
    TIMESTAMPDIFF(YEAR,
        ngay_sinh,
        CURDATE()) > 18
        AND TIMESTAMPDIFF(YEAR,
        ngay_sinh,
        CURDATE()) < 50
        AND (dia_chi LIKE '%Đà Nẵng%'
        OR dia_chi LIKE '%Quảng Trị%');

SELECT 
    khach_hang.ma_khach_hang,
    khach_hang.ho_ten,
    COUNT(*) AS 'Số lần đặt '
FROM
    khach_hang
        JOIN
    hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
WHERE
    khach_hang.ma_loai_khach = 1
GROUP BY ma_khach_hang
ORDER BY COUNT(*);

SELECT 
    k.ma_khach_hang,
    k.ho_ten,
    lk.ten_loai_khach,
    hp.ma_hop_dong,
    dv.ten_dich_vu,
    hp.ngay_lam_hop_dong,
    hp.ngay_ket_thuc,
   IFNULL((SUM(IFNULL((ht.so_luong * dk.gia), 0)) + dv.chi_phi_thue),
    0) AS 'tong_tien'
            -- sum((ht.so_luong * dk.gia) + dv.chi_phi_thue)
FROM
    khach_hang k
         JOIN
    loai_khach lk ON lk.ma_loai_khach = k.ma_loai_khach
        LEFT JOIN
    hop_dong hp ON hp.ma_khach_hang = k.ma_khach_hang
        LEFT JOIN
    dich_vu dv ON dv.ma_dich_vu = hp.ma_dich_vu
        LEFT JOIN
    hop_dong_chi_tiet ht ON ht.ma_hop_dong = hp.ma_hop_dong
        LEFT JOIN
    dich_vu_di_kem dk ON dk.ma_dich_vu_di_kem = ht.ma_dich_vu_di_kem
GROUP BY  k.ma_khach_hang,hp.ma_hop_dong ;
-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, 
-- ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

SELECT 
    hd.ma_dich_vu,
    dv.ten_dich_vu,
    dv.dien_tich,
    dv.chi_phi_thue,
    loai_dich_vu.ten_loai_dich_vu
FROM
    dich_vu dv
        JOIN
    hop_dong hd ON hd.ma_dich_vu = dv.ma_dich_vu
        JOIN
    loai_dich_vu ON loai_dich_vu.ma_loai_dich_vu = dv.ma_loai_dich_vu
WHERE dv.ma_dich_vu not in (
    select dich_vu.ma_dich_vu from dich_vu
    join hop_dong hd on hd.ma_dich_vu=dich_vu.ma_dich_vu
    where quarter(hd.ngay_lam_hop_dong)=1 and year(hd.ngay_lam_hop_dong)>=2021
    )
group by dv.ma_dich_vu ;
-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, 
-- ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 
-- 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
SELECT 
    dv.ma_dich_vu,
    dv.ten_dich_vu,
    dv.dien_tich,
    dv.so_nguoi_toi_da,
    dv.chi_phi_thue,
    ldv.ten_loai_dich_vu
FROM
    dich_vu dv
        JOIN
    loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
WHERE
    dv.ma_dich_vu IN (SELECT 
            dich_vu.ma_dich_vu
        FROM
            dich_vu
                JOIN
            hop_dong hd ON hd.ma_dich_vu = dich_vu.ma_dich_vu
        WHERE
            YEAR(hd.ngay_lam_hop_dong) = 2020
                AND dich_vu.ma_dich_vu NOT IN (SELECT 
                    dich_vu.ma_dich_vu
                FROM
                    dich_vu
                        JOIN
                    hop_dong hd ON hd.ma_dich_vu = dich_vu.ma_dich_vu
                WHERE
                    YEAR(hd.ngay_lam_hop_dong) = 2021));

-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
SELECT 
    kh.ho_ten
FROM
    khach_hang kh
GROUP BY kh.ho_ten;

SELECT 
    khach_hang.ho_ten
FROM
    khach_hang 
UNION SELECT 
    khach_hang.ho_ten
FROM
    khach_hang;

SELECT DISTINCT
    khach_hang.ho_ten
FROM
    khach_hang;

-- 9.	Thực hiện thống kê doanh thu theo tháng, 
-- nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
SELECT 
    MONTH(hd.ngay_lam_hop_dong) AS 'thang',
    COUNT(MONTH(hd.ngay_lam_hop_dong)) AS 'So_luong_khach_hang'
FROM
    hop_dong hd
WHERE
    YEAR(hd.ngay_lam_hop_dong) = 2021
GROUP BY MONTH(hd.ngay_lam_hop_dong)
ORDER BY MONTH(hd.ngay_lam_hop_dong);

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, 
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
SELECT 
    hd.ma_hop_dong,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    hd.tien_dat_coc,
    IFNULL(SUM(ht.so_luong), 0) AS 'Số lượng dịch vụ đi kèm'
FROM
    hop_dong hd
        LEFT JOIN
    hop_dong_chi_tiet ht ON ht.ma_hop_dong = hd.ma_hop_dong
GROUP BY hd.ma_hop_dong;

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng
--  có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
SELECT 
    dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem
FROM
    dich_vu_di_kem dvdk
        JOIN
    hop_dong_chi_tiet ht ON ht.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
        JOIN
    hop_dong hd ON hd.ma_hop_dong = ht.ma_hop_dong
        JOIN
    khach_hang kh ON kh.ma_khach_hang = hd.ma_khach_hang
        JOIN
    loai_khach lk ON lk.ma_loai_khach = kh.ma_loai_khach
WHERE
    lk.ten_loai_khach = 'Diamond'
        AND (kh.dia_chi LIKE '%Vinh%'
        OR kh.dia_chi LIKE '%Quảng Ngãi%');
        
-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), 
-- ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), 
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 
-- nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

SELECT 
    hd.ma_hop_dong,
    nv.ho_ten,
    kh.ho_ten,
    kh.so_dien_thoai,
    hd.tien_dat_coc,
    SUM(IFNULL(ht.so_luong, 0)) as "tong_so_luong"
FROM
    hop_dong hd
        JOIN
    khach_hang kh ON kh.ma_khach_hang = hd.ma_khach_hang
        JOIN
    nhan_vien nv ON nv.ma_nhan_vien = hd.ma_nhan_vien
        JOIN
    dich_vu dv ON dv.ma_dich_vu = hd.ma_dich_vu
        LEFT JOIN
    hop_dong_chi_tiet ht ON ht.ma_hop_dong = hd.ma_hop_dong
        LEFT JOIN
    dich_vu_di_kem dk ON dk.ma_dich_vu_di_kem = ht.ma_dich_vu_di_kem
WHERE
    hd.ma_hop_dong IN (SELECT 
            hop_dong.ma_hop_dong
        FROM
            hop_dong
        WHERE
            (MONTH(hop_dong.ngay_lam_hop_dong) > 9
                AND YEAR(hop_dong.ngay_lam_hop_dong) = 2020))
        AND hd.ma_hop_dong NOT IN (SELECT 
            hop_dong.ma_hop_dong
        FROM
            hop_dong
        WHERE
            (MONTH(hop_dong.ngay_lam_hop_dong) < 7
                AND YEAR(hop_dong.ngay_lam_hop_dong) = 2021))
GROUP BY hd.ma_hop_dong;
-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
SELECT 
    dk.ma_dich_vu_di_kem,
    dk.ten_dich_vu_di_kem,
    dk.gia,
    dk.don_vi,
    dk.trang_thai,
    SUM(ht.so_luong) as "tong_so_luong"
FROM
    dich_vu_di_kem dk
        JOIN
    hop_dong_chi_tiet ht ON ht.ma_dich_vu_di_kem = dk.ma_dich_vu_di_kem
        JOIN
    hop_dong hd ON hd.ma_hop_dong = ht.ma_hop_dong
    group by ht.ma_dich_vu_di_kem
having sum(ht.so_luong)  = (
select sum(ht.so_luong) from
    dich_vu_di_kem dk
        JOIN
    hop_dong_chi_tiet ht ON ht.ma_dich_vu_di_kem = dk.ma_dich_vu_di_kem
        JOIN
    hop_dong hd ON hd.ma_hop_dong = ht.ma_hop_dong
    GROUP BY dk.ma_dich_vu_di_kem
    ORDER BY SUM(ht.so_luong) DESC
    limit 1
);

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong, 
-- ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

SELECT hd.ma_hop_dong,lv.ten_loai_dich_vu,
    dk.ten_dich_vu_di_kem,dk.ma_dich_vu_di_kem
FROM hop_dong hd 
JOIN dich_vu dv ON dv.ma_dich_vu = hd.ma_dich_vu
        JOIN
    loai_dich_vu lv ON lv.ma_loai_dich_vu = dv.ma_loai_dich_vu
        JOIN
    hop_dong_chi_tiet ht ON ht.ma_hop_dong = hd.ma_hop_dong
        JOIN
    dich_vu_di_kem dk ON dk.ma_dich_vu_di_kem = ht.ma_dich_vu_di_kem
    where ht.ma_dich_vu_di_kem in (
		select ht.ma_dich_vu_di_kem from
			hop_dong_chi_tiet ht 
			join dich_vu_di_kem dk on dk.ma_dich_vu_di_kem=ht.ma_dich_vu_di_kem
			group by ht.ma_dich_vu_di_kem having
			count(ht.ma_dich_vu_di_kem)=1
		)
		order by hd.ma_hop_dong;


-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan,
--  so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

SELECT 
    nv.ma_nhan_vien,
    td.ten_trinh_do,
    nv.dia_chi,
    bp.ten_bo_phan,
    nv.so_dien_thoai,
    COUNT(nv.ma_nhan_vien)
FROM
    nhan_vien nv
        JOIN
    trinh_do td ON td.ma_trinh_do = nv.ma_trinh_do
        JOIN
    bo_phan bp ON bp.ma_bo_phan = nv.ma_bo_phan
        JOIN
    hop_dong hd ON hd.ma_nhan_vien = nv.ma_nhan_vien
WHERE
    nv.ma_nhan_vien IN (SELECT 
            nhan_vien.ma_nhan_vien
        FROM
            nhan_vien
                JOIN
            hop_dong ON hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
        WHERE
            YEAR(hop_dong.ngay_lam_hop_dong) = 2020
                OR YEAR(hop_dong.ngay_lam_hop_dong) = 2021)
GROUP BY nv.ma_nhan_vien
HAVING COUNT(nv.ma_nhan_vien) < 4;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
set sql_safe_updates = 0;
	delete from 
		nhan_vien  
where nhan_vien.ma_nhan_vien not in (
	select * from (
		select nhan_vien.ma_nhan_vien
			from nhan_vien 
			join hop_dong hd on hd.ma_nhan_vien=nhan_vien.ma_nhan_vien
				where year(hd.ngay_lam_hop_dong)>2018 and year(hd.ngay_lam_hop_dong)<2022)
			as table_nhan_vien
);

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

update khach_hang
set khach_hang.ma_loai_khach =1
where khach_hang.ma_khach_hang in (
select *from(
select kh.ma_khach_hang
from 
	khach_hang kh 
	join loai_khach lk on lk.ma_loai_khach=kh.ma_loai_khach
	join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang

	join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu

	join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong

	join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
    
		where year(hd.ngay_lam_hop_dong)=2021 and lk.ten_loai_khach ='Platinium'
			group by kh.ma_khach_hang
			having sum(dv.chi_phi_thue+ifnull(dvdk.gia*hdct.so_luong,0))>10000000
			) as table_khach_hang
) ;

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

alter table khach_hang
add is_delete int(1) default 1;

set sql_safe_updates = 0;
update khach_hang kh
set
	kh.is_delete =0
where kh.ma_khach_hang  in (
select *from (
	select
		khach_hang.ma_khach_hang from 
		khach_hang
	join hop_dong hd on hd.ma_khach_hang=khach_hang.ma_khach_hang
	where year(hd.ngay_lam_hop_dong)<2021) as table_khach_hang
);

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
set sql_safe_updates = 0;
update dich_vu_di_kem dvdk
set dvdk.gia= dvdk.gia*2
where dvdk.ma_dich_vu_di_kem in(
select *from (
	select hdct.ma_dich_vu_di_kem from 
    dich_vu_di_kem dvdk
		join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem
        
		join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
        
    where year(hd.ngay_lam_hop_dong)=2020 and hdct.so_luong>10
		group by hdct.ma_dich_vu_di_kem
		)
			as table_dich_vu_di_kem
);

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, 
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select nv.ma_nhan_vien id,nv.ho_ten,nv.so_dien_thoai,nv.ngay_sinh,nv.dia_chi
	from nhan_vien nv
union
select kh.ma_khach_hang,kh.ho_ten,kh.so_dien_thoai,kh.ngay_sinh,kh.dia_chi
	from khach_hang kh;

-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là 
-- “Hải Châu” và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.ma_vi_tri
create view v_nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) as
select ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan
from nhan_vien nv
join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
where nv.dia_chi='4 Nguyễn Chí Thanh, Huế' and hd.ngay_lam_hop_dong= '2021-06-01';

select *from v_nhan_vien;

-- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với 
-- ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.

DELIMITER //
CREATE PROCEDURE sp_xoa_khach_hang( ma_khach_hang int )
BEGIN 
	update khach_hang
    set khach_hang.is_delete=0
    where khach_hang.ma_khach_hang=ma_khach_hang;
END //
DELIMITER ;

call sp_xoa_khach_hang(3);

-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với 
-- yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung,
--  với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.

DELIMITER //
CREATE procedure sp_them_moi_hop_dong(ngay_lam_hop_dong datetime,ngay_ket_thuc datetime ,tien_dat_coc double,ma_nhan_vien int,ma_khach_hang int ,ma_dich_vu int)
begin
IF ma_nhan_vien not in (select nhan_vien.ma_nhan_vien from nhan_vien)
then SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Mã nhân viên không tồn tai mã hơp đồng';
      END IF;
      if ma_khach_hang not in (select nhan_vien.ma_nhan_vien from nhan_vien)
then SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Mã khách hàng không tồn tai mã hơp đồng';
      END IF;
      if ma_dich_vu not in (select dich_vu.ma_dich_vu from dich_vu)
then SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Mã dịch vụ không tồn tai mã hơp đồng';
      END IF;
      insert into hop_dong(ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu)
      value (ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu);
END //
DELIMITER ;

call sp_them_moi_hop_dong('2020-04-15','2020-05-01',200000,10,5,5)

