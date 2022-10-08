DROP DATABASE IF EXISTS Household;
CREATE DATABASE Household;
USE Household;
CREATE TABLE member (
	id_member INT AUTO_INCREMENT,
    CMND INT ,
    name_member VARCHAR(45) NOT NULL,
	DateOfBirth DATE NOT NULL,
    PRIMARY KEY (id_member)
);



CREATE TABLE House_Hold (
    id_House_Hold INT AUTO_INCREMENT,
    id_member INT ,
    name_House_Hold VARCHAR(45) NOT NULL,
    number_House_Hold INt,
    founding DATE NOT NULL,
    Address VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_House_Hold),
     FOREIGN KEY (id_member)
      REFERENCES member (id_member)
);
INSERT INTO `household`.`house_hold` (`id_House_Hold`, `id_member`, `name_House_Hold`, `number_House_Hold`, `founding`, `Address`) VALUES ('1', '1', 'ASD', '3', '2000-03-06', 'dsaf');

