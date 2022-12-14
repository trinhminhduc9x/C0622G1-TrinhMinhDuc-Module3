DROP DATABASE IF EXISTS furama;
CREATE DATABASE furama;
USE furama;
CREATE TABLE position (
    position_id INT PRIMARY KEY AUTO_INCREMENT,
    position_name VARCHAR(45)
);

CREATE TABLE education_degree (
    education_degree_id INT PRIMARY KEY AUTO_INCREMENT,
    education_degree_name VARCHAR(45)
);

CREATE TABLE division (
    division_id INT PRIMARY KEY AUTO_INCREMENT,
    division_name VARCHAR(45)
);

CREATE TABLE user (
	uer_name VARCHAR(255) PRIMARY KEY ,
    password VARCHAR(45)
);

CREATE TABLE role (
	role_id int PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(255)
);

CREATE TABLE user_role (
	role_id int,
    uer_name VARCHAR(255),
     FOREIGN KEY (role_id)
        REFERENCES role (role_id)  on delete cascade,
        FOREIGN KEY (uer_name)
        REFERENCES user (uer_name)  on delete cascade
);


CREATE TABLE employee (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(45) NOT NULL,
    date_of_birth DATE NOT NULL,
    id_card VARCHAR(45) NOT NULL,
    salary DOUBLE NOT NULL,
    phone_number VARCHAR(45) NOT NULL,
    email VARCHAR(45),
    address VARCHAR(45),
    position_id INT NOT NULL,
    education_degree_id INT NOT NULL,
    division_id INT NOT NULL,
    uer_name VARCHAR(255) ,
    FOREIGN KEY (position_id)
        REFERENCES position (position_id) on delete cascade,
    FOREIGN KEY (education_degree_id)
        REFERENCES education_degree (education_degree_id)  on delete cascade,
    FOREIGN KEY (division_id)
        REFERENCES division (division_id)  on delete cascade,
         FOREIGN KEY (uer_name)
        REFERENCES user (uer_name)  on delete cascade
);

CREATE TABLE customer_type (
    customer_type_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_type_name VARCHAR(45)
);

CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_type_id INT NOT NULL,
    customer_name VARCHAR(45) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender BIT(1) NOT NULL,
    id_card VARCHAR(45) NOT NULL,
    phone_number VARCHAR(45) NOT NULL,
    email VARCHAR(45),
    address VARCHAR(45),
    FOREIGN KEY (customer_type_id)
        REFERENCES customer_type (customer_type_id)  on delete cascade
);

CREATE TABLE facility_type (
    facility_type_id INT PRIMARY KEY AUTO_INCREMENT,
    facility_type_name VARCHAR(45)
);

CREATE TABLE rent_type (
    rent_type_id INT PRIMARY KEY AUTO_INCREMENT,
    rent_type_name VARCHAR(45)
);

CREATE TABLE facility (
    facility_id INT PRIMARY KEY AUTO_INCREMENT,
    facility_name VARCHAR(45) NOT NULL,
    area INT,
    cost DOUBLE NOT NULL,
    max_people INT,
    rent_type_id INT NOT NULL,
    facility_type_id INT NOT NULL,
    standard_room VARCHAR(45),
    description_other_convenience VARCHAR(45),
    pool_area DOUBLE,
    number_of_floor INT,
    facility_free TEXT,
    FOREIGN KEY (rent_type_id)
        REFERENCES rent_type (rent_type_id)  on delete cascade,
    FOREIGN KEY (facility_type_id)
        REFERENCES facility_type (facility_type_id) on delete cascade
);
    
CREATE TABLE contract (
    contract_id INT PRIMARY KEY AUTO_INCREMENT,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    deposit DOUBLE NOT NULL,
    employee_id INT NOT NULL,
    customer_id INT NOT NULL,
    facility_id INT NOT NULL,
    FOREIGN KEY (employee_id)
        REFERENCES employee (employee_id)  on delete cascade,
    FOREIGN KEY (customer_id)
        REFERENCES customer (customer_id)  on delete cascade,
    FOREIGN KEY (facility_id)
        REFERENCES facility (facility_id)  on delete cascade
);
    
CREATE TABLE attach_facility (
    attach_facility_id INT PRIMARY KEY AUTO_INCREMENT,
    attach_facility_name VARCHAR(45) NOT NULL,
    price DOUBLE NOT NULL,
    unit VARCHAR(10) NOT NULL,
    status VARCHAR(45)
);

CREATE TABLE contract_detail (
    contract_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    contract_id INT NOT NULL,
    attach_facility_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (contract_id)
        REFERENCES contract (contract_id)  on delete cascade,
    FOREIGN KEY (attach_facility_id)
        REFERENCES attach_facility (attach_facility_id)  on delete cascade
);




-- Th??m th??ng tin
INSERT INTO position (position_name)
VALUE ('Qu???n l??'), 
('Nh??n vi??n');

INSERT INTO education_degree (education_degree_name)
VALUE ('Trung c???p'),
('Cao ?????ng'), 
('?????i h???c'), 
('Sau ?????i h???c');

INSERT INTO division (division_name)
VALUE ('Sale - Marketing'),
('H??nh ch??nh'),
('PH???c v???'),
('Qu???n l??');

INSERT INTO employee (employee_name,date_of_birth,id_card,salary,phone_number,email,address,position_id,education_degree_id,division_id)
VALUE ('Nguy???n V??n Anh','1970-11-07', '456231786',10000000,'0901234121','annguyen@gMAIL.COM','295 Nguy???n T???t Th??nh, ???? N???ng',1,3,1),
 ('L?? V??n B??nh','1997-04-09', '654231234',7000000,'0934212314','binhlv@gmaIl.com','22 Y??N B??I, ???? N???ng',1,2,2),
 ('H??? Th??? Y???n','1995-12-12', '999231723',14000000,'0412352315','thiyen@gMail.com','K234/11 ??i???n Bi??N PH???, GIa Lai',1,3,2),
 ('V?? C??ng To???n','1980-04-04', '123231365',17000000,'0374443232','toan0404@gmail.com','77 Ho??ng DI???u, Qu???ng Tr???',1,4,4),
 ('Nguy???n B???nh Ph??t','1999-12-09', '454363232',6000000,'0902341231','PHATPhaT@gmail.com','43 Y??n B??i, ???? N???ng',2,1,1),
 ('Kh??c NGUY???N An Nghi','2000-11-08', '964542311',7000000,'0978653213','annghI20@GMAIl.Com','294 Nguy???n T???t Th??nH, ???? N???ng',2,3,3),
 ('NguY???N H???U H??','1993-01-01', '534323231',8000000,'0941234553','nhh0101@gmail.com','4 NGUY???N CH?? Thanh, Hu???',2,3,2),
 ('Nguy???n H?? ????ng','1989-09-03', '232414123',9000000,'0642123111','dOnghanguyen@gmail.com','111 H??nG V????NG, H?? N???i',2,4,4),
 ('T??ng Hoang','1982-09-03', '256781231',6000000,'0245144444','hoangtong@gmail.Com','213 H??m Nghi, ???? N???ng',2,4,4),
 ('NGuy???n C??ng ?????o','1994-01-08', '755434343',8000000,'0988767111','nguyencongdao@gmail.com','6 Ho?? Kh??nh, ?????ng Nai',2,3,2);

INSERT INTO customer_type (customer_type_name)
VALUE ('Diamond'),
 ('Platinium'),
 ('Gold'),
 ('silver'),
 ('Member');

 INSERT INTO customer (customer_name,date_of_birth,gender,id_card,phone_number,email,address,customer_type_id)
 VALUE ('Nguy???n Th??? H??o','1970-11-07',0,'643431213','0945423362','thihao07@gmail.com','23 Nguy???n Ho??ng, ???? N???ng',5),
  ('Ph???m Xu??n Di???u','1992-08-08',1,'865342123','0954333333','xuandieu92@gmail.com','K77/22 Th??i Phi??n, Qu???ng Tr???',3),
  ('Tr????ng ????nh Ngh???','1990-02-27',1,'488645199','0373213122','nghenhan2702@gmail.com','K323/12 ??ng ??ch Khi??m, Vinh',1),
  ('D????ng V??n Quang','1981-07-08',0,'543432111','0490039241','duongquan@gmail.com','K453/12 L?? L???i, ???? N???ng',1),
  ('Ho??ng Tr???n Nhi Nhi','1995-12-09',0,'795453345','0312345678','nhinhi123@gmail.com','224 L?? Th??i T???, Gia Lai',4),
  ('T??n N??? M???c Ch??u','2005-12-06',0,'732434215','0988888844','tonnuchau@gmail.com','37 Y??n Th???, ???? N???ng',4),
  ('Nguy???n M??? Kim','1984-04-08',0,'856453123','0912345698','kimcuong84@gmail.com','K123/45 L?? L???i, H??? Ch?? Minh',1),
  ('Nguy???n Th??? H??o','1999-04-08',0,'965656433','0763212345','haohao99@gmail.com','55 Nguy???n V??n Linh, Kon Tum',3),
  ('Tr???n ?????i Danh','1994-07-01',1,'432341235','0643343433','danhhai99@gmail.com','24 L?? Th?????ng Ki???t, Qu???ng Ng??i',1),
  ('Nguy???n T??m ?????c','1989-07-01',1,'344343432','0987654321','dactam@gmail.com','22 Ng?? Quy???n, ???? N???ng',2);
  
  INSERT INTO rent_type (rent_type_name) 
  VALUE ('year'),
   ('month'),
   ('day'),
   ('hour');
    
   INSERT INTO facility_type(facility_type_name)
   VALUE ('Villa'),
    ('House'),
    ('Room');
        
   INSERT INTO facility(facility_name,area,cost,max_people,standard_room,description_other_convenience,pool_area,number_of_floor,facility_free,rent_type_id,facility_type_id)
    VALUE ('Villa Beach Front',25000,1000000,10,'vip','C?? h??? b??i',500,4,null,3,1),
     ('House Princess 01',14000,5000000,7,'vip','C?? th??m b???p n?????ng',null,3,null,2,2),
     ('Room Twin 01',5000,1000000,2,'normal','C?? tivi',null,null,'1 Xe m??y, 1 Xe ?????p',4,3),
     ('Villa No Beach Front',22000,9000000,8,'normal','C?? h??? b??i',300,3,null,3,1),
     ('House Princess 02',10000,4000000,5,'normal','C?? th??m b???p n?????ng',null,2,null,3,2),
     ('Room Twin 02',3000,900000,2,'normal','C?? tivi',null,null,'1 Xe m??y',4,3);
     
     INSERT INTO attach_facility (attach_facility_name,price, unit,status)
     VALUE ('Karaoke',10000,'Gi???','Ti???n nghi, hi???n ?????i'),
      ('Thu?? xe m??y',10000,'chi???c','H???ng 1 xe'),
      ('Thu?? xe ?????p',20000,'chi???c','T???t'),
      ('Buffet bu???i s??ng',15000,'su???t','?????y ????? ????? ??n, tr??ng mi???ng'),
      ('Buffet bu???i tr??a',90000,'su???t','?????y ????? ????? ??n, tr??ng mi???ng'),
      ('Buffet bu???i t???i',16000,'su???t','?????y ????? ????? ??n, tr??ng mi???ng');

     INSERT INTO contract (start_date,end_date,deposit,employee_id,customer_id,facility_id)
     VALUE ('2020-12-08','2020-12-08',0,3,1,3),
      ('2020-07-14','2020-07-21',200000,7,3,1),
      ('2021-03-15','2021-03-17',50000,3,4,2),
      ('2021-01-14','2021-01-18',100000,7,5,5),
      ('2021-07-14','2021-07-15',0,7,2,6),
      ('2021-06-01','2021-06-03',0,7,7,6),
      ('2021-09-02','2021-09-05',100000,7,4,4),
      ('2021-06-17','2021-06-18',150000,3,4,1),
      ('2020-11-19','2020-11-19',0,3,4,3),
      ('2020-04-12','2020-04-14',0,10,3,5),
	  ('2021-04-25','2021-04-25',0,2,2,1),
      ('2021-05-25','2021-05-27',0,7,10,1);

INSERT INTO contract_detail (quantity,contract_id,attach_facility_id)
VALUE (5,2,4),
 (8,2,5),
 (15,2,6),
 (1,3,1),
 (11,3,2),
 (1,1,3),
 (2,1,2),
 (2,12,2);
 
 
