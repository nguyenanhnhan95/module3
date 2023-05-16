create database quan_ly_vat_tu;
use quan_ly_vat_tu;
CREATE TABLE nha_cung_cap (
    MaNCC INT PRIMARY KEY AUTO_INCREMENT,
    TenNCC VARCHAR(45) NOT NULL,
    DiaChi VARCHAR(45) NOT NULL
);
CREATE TABLE so_dien_thoai (
    SoDT VARCHAR(20) PRIMARY KEY,
    MaNCC INT NOT NULL,
    FOREIGN KEY (MaNCC)
        REFERENCES nha_cung_cap (MaNCC)
);
CREATE TABLE don_dat_hang (
    SoDH INT PRIMARY KEY AUTO_INCREMENT,
    NgayDH DATETIME NOT NULL,
    MaNCC INT NOT NULL,
    FOREIGN KEY (MaNCC)
        REFERENCES nha_cung_cap (MaNCC)
);
CREATE TABLE phieu_nhap (
    SoPN INT PRIMARY KEY AUTO_INCREMENT,
    NgayNhap DATETIME NOT NULL
);

CREATE TABLE phieu_xuat (
    SoPX INT PRIMARY KEY AUTO_INCREMENT,
    NgayXuat DATETIME NOT NULL,
    SLXuat INT NOT NULL
);

CREATE TABLE vat_tu (
    MaVTU INT PRIMARY KEY AUTO_INCREMENT,
    TenVTU VARCHAR(45) NOT NULL
);
CREATE TABLE vat_tu_don_dat_hang (
    SoDH INT NOT NULL,
    MaVTU INT NOT NULL,
    PRIMARY KEY (MaVTU , SoDH),
    FOREIGN KEY (MaVTU)
        REFERENCES vat_tu (MaVTU),
    FOREIGN KEY (SoDH)
        REFERENCES don_dat_hang (SoDH)
);
CREATE TABLE vat_tu_phieu_nhap (
    MaVTU INT,
    SoPN INT,
    PRIMARY KEY (MaVTU , SoPN),
    FOREIGN KEY (MaVTU)
        REFERENCES vat_tu (MaVTU),
    FOREIGN KEY (SoPN)
        REFERENCES phieu_nhap (SoPN),
    DGNhap INT NOT NULL,
    SLNhap INT NOT NULL
);
CREATE TABLE vat_tu_phieu_xuat (
    DGXuat INT NOT NULL,
    SLXuat INT NOT NULL,
    SoPX INT,
    MaVTU INT,
    PRIMARY KEY (MaVTU , SoPX),
    FOREIGN KEY (MaVTU)
        REFERENCES vat_tu (MaVTU),
    FOREIGN KEY (SoPX)
        REFERENCES phieu_xuat (SoPX)
);








