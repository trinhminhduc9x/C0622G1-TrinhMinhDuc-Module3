drop database if exists furama_resort;

create database furama_resort;

use furama_resort;

CREATE TABLE vi_tri (
    ma_vi_tri INT AUTO_INCREMENT,
    ten_vi_tri VARCHAR(45) NOT NULL,
    PRIMARY KEY (ma_vi_tri)
);

CREATE TABLE trinh_do (
    ma_trinh_do INT AUTO_INCREMENT,
    ten_trinh_do VARCHAR(45) NOT NULL,
    PRIMARY KEY (ma_trinh_do)
);

CREATE TABLE bo_phan (
    ma_bo_phan INT AUTO_INCREMENT,
    ten_bo_phan VARCHAR(45) NOT NULL,
    PRIMARY KEY (ma_bo_phan)
);

CREATE TABLE nhan_vien (
    ma_nhan_vien INT AUTO_INCREMENT PRIMARY KEY,
    ho_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    so_cmnd VARCHAR(45) NOT NULL,
    luong DOUBLE NOT NULL,
    so_dien_thoai VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    dia_chi VARCHAR(45) NOT NULL,
    ma_vi_tri INT NOT NULL,
    ma_trinh_do INT NOT NULL,
    ma_bo_phan INT NOT NULL,
    `status` bit(1) default 0,
    FOREIGN KEY (ma_vi_tri)
        REFERENCES vi_tri (ma_vi_tri)ON DELETE CASCADE,
    FOREIGN KEY (ma_trinh_do)
        REFERENCES trinh_do (ma_trinh_do)ON DELETE CASCADE,
    FOREIGN KEY (ma_bo_phan)
        REFERENCES bo_phan (ma_bo_phan)ON DELETE CASCADE
);


CREATE TABLE loai_khach (
    ma_loai_khach INT AUTO_INCREMENT PRIMARY KEY,
    ten_loai_khach VARCHAR(45) NOT NULL
);



CREATE TABLE khach_hang (
    ma_khach_hang INT AUTO_INCREMENT PRIMARY KEY,
    ma_loai_khach INT NOT NULL,
    ho_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    gioi_tinh BIT(1) NOT NULL,
    so_cmnd VARCHAR(45) NOT NULL,
    so_dien_thoai VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    dia_chi VARCHAR(45) NOT NULL,
     `status` bit(1) default 0,
    FOREIGN KEY (ma_loai_khach)
        REFERENCES loai_khach (ma_loai_khach)ON DELETE CASCADE
);


CREATE TABLE loai_dich_vu (
    ma_loai_dich_vu INT AUTO_INCREMENT PRIMARY KEY,
    ten_loai_dich_vu VARCHAR(45) NOT NULL
);

CREATE TABLE kieu_thue (
    ma_kieu_thue INT AUTO_INCREMENT PRIMARY KEY,
    ten_kieu_thue VARCHAR(45) NOT NULL
);



CREATE TABLE dich_vu (
    ma_dich_vu INT AUTO_INCREMENT PRIMARY KEY,
    ten_dich_vu VARCHAR(45) NOT NULL,
    dien_tich INT NOT NULL,
    chi_phi_thue DOUBLE NOT NULL,
    so_nguoi_toi_da INT NOT NULL,
    tieu_chuan_phong VARCHAR(45),
    mo_ta_tien_nghi_khac VARCHAR(45),
    dien_tich_ho_boi DOUBLE,
    so_tang INT,
    dich_vu_mien_phi_di_kem TEXT,
    ma_kieu_thue INT NOT NULL,
    ma_loai_dich_vu INT NOT NULL,
    FOREIGN KEY (ma_loai_dich_vu)
        REFERENCES loai_dich_vu (ma_loai_dich_vu)ON DELETE CASCADE,
    FOREIGN KEY (ma_kieu_thue)
        REFERENCES kieu_thue (ma_kieu_thue)ON DELETE CASCADE
);

CREATE TABLE hop_dong (
    ma_hop_dong INT AUTO_INCREMENT PRIMARY KEY,
    ngay_lam_hop_dong DATETIME NOT NULL,
    ngay_ket_thuc DATETIME NOT NULL,
    tien_dat_coc DOUBLE NOT NULL,
    ma_nhan_vien INT NOT NULL,
    ma_khach_hang INT NOT NULL,
    ma_dich_vu INT NOT NULL,
    FOREIGN KEY (ma_nhan_vien)
        REFERENCES nhan_vien (ma_nhan_vien) ON DELETE CASCADE,
    FOREIGN KEY (ma_khach_hang)
        REFERENCES khach_hang (ma_khach_hang) ON DELETE CASCADE,
    FOREIGN KEY (ma_dich_vu)
        REFERENCES dich_vu (ma_dich_vu) ON DELETE CASCADE
);


CREATE TABLE dich_vu_di_kem (
    ma_dich_vu_di_kem INT AUTO_INCREMENT PRIMARY KEY,
    ten_dich_vu_di_kem VARCHAR(45) NOT NULL,
    gia DOUBLE NOT NULL,
    don_vi VARCHAR(45) NOT NULL,
    trang_thai VARCHAR(45) NOT NULL
);


CREATE TABLE hop_dong_chi_tiet (
    ma_hop_dong_chi_tiet INT AUTO_INCREMENT PRIMARY KEY,
    so_luong INT NOT NULL,
    ma_hop_dong INT NOT NULL,
    ma_dich_vu_di_kem INT NOT NULL,
    FOREIGN KEY (ma_hop_dong)
        REFERENCES hop_dong (ma_hop_dong)ON DELETE CASCADE,
    FOREIGN KEY (ma_dich_vu_di_kem)
        REFERENCES dich_vu_di_kem (ma_dich_vu_di_kem)ON DELETE CASCADE
);

insert into vi_tri (ten_vi_tri)
 values ("Qu???n l??"),("Nh??n vi??n");
 
 insert into trinh_do(ten_trinh_do)
 values ('Trung c???p'),('Cao ?????ng'),('?????i H???c'),('Sau ?????i h???c');
 
 insert into bo_phan(ten_bo_phan)
 values ('Sale_Maketing'),('H??nh ch??nh'),('Ph???c v???'),('Qu???n l??');


insert into nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan)
values ('Nguy???n V??n An','1970-11-07','456231786',10000000,'0901234121','annguyen@gmail.com','295 Nguy???n T???t Th??nh, ???? N???ng',1,3,1),
('L?? V??n B??nh','1997-04-09','654231234',7000000,'0934212314','binhlv@gmail.com','22 Y??n B??i, ???? N???ng',1	,2,2),
('H??? Th??? Y???n','1995-12-12','999231723',14000000,'0412352315','thiyen@gmail.com','K234/11 ??i???n Bi??n Ph???, Gia Lai',1,3,2),
('V?? C??ng To???n','1980-04-04','123231365',17000000,'0374443232','toan0404@gmail.com','77 Ho??ng Di???u, Qu???ng Tr???',1,4,4),
('Nguy???n B???nh Ph??t','1999-12-09','454363232',6000000,'0902341231','	phatphat@gmail.com','43 Y??n B??i, ???? N???ng',2,1,1),
('Kh??c Nguy???n An Nghi','2000-11-08','964542311',7000000	,'0978653213','annghi20@gmail.com','294 Nguy???n T???t Th??nh, ???? N???ng',2,2,3),
('Nguy???n H???u H??','1993-01-01','534323231',8000000,'0941234553','nhh0101@gmail.com','4 Nguy???n Ch?? Thanh, Hu???',2,3,2),
('Nguy???n H?? ????ng','1989-09-03','234414123',9000000,'0642123111','donghanguyen@gmail.com','111 H??ng V????ng, H?? N???i',2,4,4),
('T??ng Hoang','1982-09-03','256781231',6000000,'0245144444','hoangtong@gmail.com','213 H??m Nghi, ???? N???ng',2,4,4),
('Nguy???n C??ng ?????o','1994-01-08','755434343',8000000	,'0988767111','	nguyencongdao12@gmail.com','6 Ho?? Kh??nh, ?????ng Nai',2,3,2);

insert into loai_khach(ten_loai_khach)
value('Diamond'),('Platinium'),('Gold'),('Silver'),('Member');	


insert into khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach)
values ('Nguy???n Th??? H??o','1970-11-07',0,'643431213','0945423362','thihao07@gmail.com','23 Nguy???n Ho??ng, ???? N???ng',5),
('Ph???m Xu??n Di???u','1992-08-08',1,'865342123','0954333333','xuandieu92@gmail.com','K77/22 Th??i Phi??n, Qu???ng Tr???',3),
('Tr????ng ????nh Ngh???','1990-02-27',1,'488645199','0373213122','nghenhan2702@gmail.com	','K323/12 ??ng ??ch Khi??m, Vinh',1),
('D????ng V??n Quan','1981-07-08',1,'543432111','0490039241','duongquan@gmail.com','K453/12 L?? L???i, ???? N???ng',1),
('Ho??ng Tr???n Nhi Nhi','199-12-09',0,'795453345','0312345678','nhinhi123@gmail.com','224 L?? Th??i T???, Gia Lai',4),
('T??n N??? M???c Ch??u','2005-12-06',0,'732434215','0988888844','tonnuchau@gmail.com','37 Y??n Th???, ???? N???ng',4),
('Nguy???n M??? Kim','1984-04-08',0,'856453123','0912345698','kimcuong84@gmail.com','K123/45 L?? L???i, H??? Ch?? Minh',1),
('Nguy???n Th??? H??o','1999-04-08',0,'965656433','0763212345','haohao99@gmail.com','55 Nguy???n V??n Linh, Kon Tum',3),
('Tr???n ?????i Danh','1994-07-01',1,'432341235','0643343433','danhhai99@gmail.com','24 L?? Th?????ng Ki???t, Qu???ng Ng??i',1),
('Nguy???n T??m ?????c','1989-07-01',1,'344343432','0987654321','dactam@gmail.com','22 Ng?? Quy???n, ???? N???ng',2);

insert into kieu_thue(ten_kieu_thue) 
value('year'),('month'),('day'),('hour');

insert into loai_dich_vu(ten_loai_dich_vu)
value ('Villa'),('House'),('Room');

	
insert into dich_vu(ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,dich_vu_mien_phi_di_kem,ma_kieu_thue,ma_loai_dich_vu)
values ('Villa Beach Front',25000,1000000,10,'vip','C?? h??? b??i',500,4,null,3,1),
('House Princess 01',14000,5000000,7,'vip','C?? th??m b???p n?????ng',	null,3,null,2,2),
('Room Twin 01',5000,1000000,2,'normal','C?? tivi',null,null,'1 Xe m??y,1 Xe ?????p',4,3),
('Villa No Beach Front',22000,9000000,8,'normal','C?? h??? b??i',300,3,null,3,1),
('House Princess 02',10000,	4000000,5,'	normal','C?? th??m b???p n?????ng',null,2,	null,3,2),
('Room Twin 02',3000,900000,2,'normal','C?? tivi',null,null,'1 Xe m??y',4,3);


insert into dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi,trang_thai)
values('Karaoke',10000,'gi???','ti???n nghi,hi???n ?????i'),
('Thu?? xe m??y',10000,'chi???c','h???ng 1 xe'),
('Thu?? xe ?????p',20000,'chi???c','t???t'),
('Buffet bu???i s??ng',15000,'su???t','?????y ????? ????? ??n,tr??ng mi???ng'),
('Buffet bu???i tr??a',90000,'su???t','?????y ????? ????? ??n,tr??ng mi???ng'),
('Buffet bu???i t???i',16000,'su???t','?????y ????? ????? ??n,tr??ng mi???ng');


insert into hop_dong(ngay_lam_hop_dong, ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu)
values('2020-12-08','2020-12-08',0,3,1,3),
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

insert into hop_dong_chi_tiet(so_luong,ma_hop_dong,ma_dich_vu_di_kem)
value(5,2,4),(8,2,5),(15,2,6),(1,3,1),(11,3,2),(1,1,3),(2,1,2),(2,12,2);





 
 

 
 
 
 

























	

 
 



 















