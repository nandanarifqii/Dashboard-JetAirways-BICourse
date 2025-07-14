CREATE TABLE `dim_airline` (
  `id_Airline` int NOT NULL,
  `Airline_Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_Airline`)
);

CREATE TABLE `dim_city` (
  `id_City` int NOT NULL,
  `City_Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_City`)
);

CREATE TABLE `dim_date` (
  `id_Date` int NOT NULL,
  `Full_Date` date DEFAULT NULL,
  `Days_of_Month` int DEFAULT NULL,
  `Days_Name` varchar(45) DEFAULT NULL,
  `Month` int DEFAULT NULL,
  `Month_Name` varchar(45) DEFAULT NULL,
  `Quarter` int DEFAULT NULL,
  PRIMARY KEY (`id_Date`)
);


CREATE TABLE `dim_route` (
  `id_Route` int NOT NULL,
  `Flight_Route` varchar(255) DEFAULT NULL,
  `Total_Stops` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_Route`)
);

CREATE TABLE `dim_time` (
  `id_Time` int NOT NULL,
  `Clock_Time` time DEFAULT NULL,
  `Hours` char(2) DEFAULT NULL,
  `Minute` char(2) DEFAULT NULL,
  `Time_Period` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_Time`)
);

CREATE TABLE `fact_flights` (
  `id_FactFlights` int NOT NULL AUTO_INCREMENT,
  `id_Airline` int DEFAULT NULL,
  `id_Date` int DEFAULT NULL,
  `id_Source` int DEFAULT NULL,
  `id_Destination` int DEFAULT NULL,
  `id_Dep_Time` int DEFAULT NULL,
  `id_Arrival_Time` int DEFAULT NULL,
  `id_Route` int DEFAULT NULL,
  `Duration_in_Minutes` int DEFAULT NULL,
  `Price` int DEFAULT NULL,
  PRIMARY KEY (`id_FactFlights`),
  KEY `id_Airline` (`id_Airline`),
  KEY `id_Date` (`id_Date`),
  KEY `id_Source` (`id_Source`),
  KEY `id_Destination` (`id_Destination`),
  KEY `id_Dep_Time` (`id_Dep_Time`),
  KEY `id_Arrival_Time` (`id_Arrival_Time`),
  CONSTRAINT `fact_flights_ibfk_1` FOREIGN KEY (`id_Airline`) REFERENCES `dim_airline` (`id_Airline`),
  CONSTRAINT `fact_flights_ibfk_2` FOREIGN KEY (`id_Date`) REFERENCES `dim_date` (`id_Date`),
  CONSTRAINT `fact_flights_ibfk_3` FOREIGN KEY (`id_Source`) REFERENCES `dim_city` (`id_City`),
  CONSTRAINT `fact_flights_ibfk_4` FOREIGN KEY (`id_Destination`) REFERENCES `dim_city` (`id_City`),
  CONSTRAINT `fact_flights_ibfk_5` FOREIGN KEY (`id_Dep_Time`) REFERENCES `dim_time` (`id_Time`),
  CONSTRAINT `fact_flights_ibfk_6` FOREIGN KEY (`id_Arrival_Time`) REFERENCES `dim_time` (`id_Time`)
);
