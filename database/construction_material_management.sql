
CREATE TABLE `client` (
  `CLIENT_ID` int NOT NULL AUTO_INCREMENT,
  `CLIENT_NAME` varchar(60) DEFAULT NULL,
  `CITY` varchar(60) DEFAULT NULL,
  `COMPANY` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`CLIENT_ID`)
);

CREATE TABLE `contact_details` (
  `CLIENT_ID` int DEFAULT NULL,
  `PHONE_NO` varchar(13) DEFAULT NULL,
  `EMAIL` varchar(60) DEFAULT NULL,
  `CONTACT_ID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`CONTACT_ID`),
  KEY `CLIENT_ID` (`CLIENT_ID`),
  CONSTRAINT `contact_details_ibfk_1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`CLIENT_ID`) ON DELETE CASCADE
);


CREATE TABLE `employee` (
  `EMP_ID` int DEFAULT NULL,
  `EMP_NAME` varchar(20) DEFAULT NULL
);

CREATE TABLE `login_details` (
  `LOGIN_ID` int NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(60) DEFAULT NULL,
  `EMAIL` varchar(60) DEFAULT NULL,
  `PASSWORD` varchar(60) DEFAULT NULL,
  `ISACTIVE` varchar(2) DEFAULT 'N',
  PRIMARY KEY (`LOGIN_ID`)
);

CREATE TABLE `material` (
  `MATERIAL_ID` int NOT NULL AUTO_INCREMENT,
  `MATERIAL_NAME` varchar(60) DEFAULT NULL,
  `MATERIAL_TYPE` varchar(60) DEFAULT NULL,
  `MATERIAL_GRADE` varchar(60) DEFAULT NULL,
  `COST` int DEFAULT NULL,
  PRIMARY KEY (`MATERIAL_ID`)
);

CREATE TABLE `requirement` (
  `ORDER_NO` int NOT NULL AUTO_INCREMENT,
  `CLIENT_ID` int DEFAULT NULL,
  `MATERIAL_ID` int DEFAULT NULL,
  `QUANTITY` int DEFAULT NULL,
  `AMOUNT` int DEFAULT NULL,
  PRIMARY KEY (`ORDER_NO`),
  KEY `CLIENT_ID` (`CLIENT_ID`),
  KEY `MATERIAL_ID` (`MATERIAL_ID`),
  CONSTRAINT `requirement_ibfk_1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`CLIENT_ID`),
  CONSTRAINT `requirement_ibfk_2` FOREIGN KEY (`MATERIAL_ID`) REFERENCES `material` (`MATERIAL_ID`)
);

CREATE TABLE `stock` (
  `MATERIAL_ID` int DEFAULT NULL,
  `STOCK` int DEFAULT NULL,
  KEY `MATERIAL_ID` (`MATERIAL_ID`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`MATERIAL_ID`) REFERENCES `material` (`MATERIAL_ID`)
);

CREATE TABLE `temp_req` (
  `CLIENT_ID` int DEFAULT NULL,
  `MATERIAL_ID` int DEFAULT NULL,
  `QUANTITY` int DEFAULT NULL,
  KEY `CLIENT_ID` (`CLIENT_ID`),
  KEY `MATERIAL_ID` (`MATERIAL_ID`),
  CONSTRAINT `temp_req_ibfk_1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`CLIENT_ID`),
  CONSTRAINT `temp_req_ibfk_2` FOREIGN KEY (`MATERIAL_ID`) REFERENCES `material` (`MATERIAL_ID`)
) ;

INSERT INTO `material` VALUES (1,'UltraTech Cement','Cement','33',340),(2,'UltraTech Cement','Cement','43',370),(3,'UltraTech Cement','Cement','53',390),(4,'Ambuja Cement','Cement','33',325),(5,'Ambuja Cement','Cement','43',345),(6,'Ambuja Cement','Cement','53',370),(7,'Bharat Bricks','Bricks','Fly Ash - 4 inch',5),(8,'Bharat Bricks','Bricks','Fly Ash - 6 inch',7),(9,'Bharat Bricks','Bricks','AAC - 150',27),(10,'Sumit Bricks','Blocks','AAC - 200',30),(11,'Sumit Bricks','Blocks','AAC - 250',35),(12,'Jindal Steel','Steel','FE - 500',48000),(13,'Asian Paints','Paint','OBD',140);
