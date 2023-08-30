CREATE DATABASE `dallas`;

CREATE TABLE `dimgeography` (
  `Geography_id` int NOT NULL,
  `Street Number` varchar(254) ,
  `Street Name` varchar(254) ,
  `Street Direction` varchar(254) ,
  `Street Type` varchar(254) ,
  `Street Unit` varchar(254),
  `Street Address` varchar(254) ,
  `Zip Code` varchar(254) ,
  `Lat Long Location` varchar(254),
  Primary key (Geography_id)
) ;

CREATE TABLE `diminspection` (
  `Inspection_id` int NOT NULL,
  `Inspection Type` varchar(254) ,
  `Inspection Date` varchar(254) ,
  `Inspection Month` varchar(254) ,
  `Inspection Year` varchar(254) ,
  Primary key (Inspection_id) 
) ;


-- dallas.dimrestaurant definition

CREATE TABLE `dimrestaurant` (
  `Restaurant_id` int NOT NULL,
  `Restaurant Name` varchar(254) ,
  Primary key (Restaurant_id)
) ;


-- dallas.dimviolationdesc definition

CREATE TABLE `dimviolationdesc` (
  `Violation_Description_id` int NOT NULL,
  `Violation Description - 1` varchar(254) ,
  `Violation Description - 2` varchar(254) ,
  `Violation Description - 3` varchar(254) ,
  `Violation Description - 4` varchar(254) ,
  `Violation Description - 5` varchar(254) ,
  `Violation Description - 6` varchar(254) ,
  `Violation Description - 7` varchar(254),
  `Violation Description - 8` varchar(254) ,
  `Violation Description - 9` varchar(254) ,
  `Violation Description - 10` varchar(254) ,
  `Violation Description - 11` varchar(254),
  `Violation Description - 12` varchar(254) ,
  `Violation Description - 13` varchar(254) ,
  `Violation Description - 14` varchar(254),
  `Violation Description - 15` varchar(254),
  `Violation Description - 16` varchar(254) ,
  `Violation Description - 17` varchar(254) ,
  `Violation Description - 18` varchar(254),
  `Violation Description - 19` varchar(254) ,
  `Violation Description - 20` varchar(254) ,
  `Violation Description - 21` varchar(254) ,
  `Violation Description - 22` varchar(254) ,
  `Violation Description - 23` varchar(254),
  `Violation Description - 24` varchar(254) ,
  `Violation Description - 25` varchar(254) ,
  Primary key (Violation_Description_id)
) ;


-- dallas.dimviolationdetail definition

CREATE TABLE `dimviolationdetail` (
  `Violation_Detail_id` int Not NULL,
  `Violation Detail - 1` varchar(254) ,
  `Violation Detail - 2` varchar(254) ,
  `Violation Detail - 3` varchar(254) ,
  `Violation Detail - 4` varchar(254) ,
  `Violation Detail - 5` varchar(254) ,
  `Violation Detail - 6` varchar(254) ,
  `Violation Detail - 7` varchar(254) ,
  `Violation Detail - 8` varchar(254) ,
  `Violation Detail - 9` varchar(254) ,
  `Violation Detail - 10` varchar(254) ,
  `Violation Detail - 11` varchar(254) ,
  `Violation Detail - 12` varchar(254) ,
  `Violation Detail - 13` varchar(254) ,
  `Violation Detail - 14` varchar(254) ,
  `Violation Detail - 15` varchar(254) ,
  `Violation Detail - 16` varchar(254),
  `Violation Detail - 17` varchar(254) ,
  `Violation Detail - 18` varchar(254) ,
  `Violation Detail - 19` varchar(254),
  `Violation Detail - 20` varchar(254) ,
  `Violation Detail - 21` varchar(254) ,
  `Violation Detail - 22` varchar(254) ,
  `Violation Detail - 23` varchar(254),
  `Violation Detail - 24` varchar(254) ,
  `Violation Detail - 25` varchar(254) ,
  Primary key (Violation_Detail_id)
) ;


-- dallas.dimviolationmemo definition

CREATE TABLE `dimviolationmemo` (
  `Violation_Memo_id` int NOT NULL,
  `Violation Memo - 1` varchar(254) ,
  `Violation Memo - 2` varchar(254) ,
  `Violation Memo - 3` varchar(254) ,
  `Violation Memo - 4` varchar(254) ,
  `Violation Memo - 5` varchar(254) ,
  `Violation Memo - 6` varchar(254) ,
  `Violation Memo - 7` varchar(254) ,
  `Violation Memo - 8` varchar(254) ,
  `Violation Memo - 9` varchar(254) ,
  `Violation Memo - 10` varchar(254) ,
  `Violation Memo - 11` varchar(254) ,
  `Violation Memo - 12` varchar(254) ,
  `Violation Memo - 13` varchar(254) ,
  `Violation Memo - 14` varchar(254) ,
  `Violation Memo - 15` varchar(254) ,
  `Violation Memo - 16` varchar(254) ,
  `Violation Memo - 17` varchar(254) ,
  `Violation Memo - 18` varchar(254) ,
  `Violation Memo - 19` varchar(254) ,
  `Violation  Memo - 20` varchar(254) ,
  `Violation Memo - 21` varchar(254) ,
  `Violation Memo - 22` varchar(254) ,
  `Violation Memo - 23` varchar(254) ,
  `Violation Memo - 24` varchar(254) ,
  `Violation Memo - 25` varchar(254) ,
  Primary key (Violation_Memo_id)
) ;


-- dallas.dimviolationpoint definition

CREATE TABLE `dimviolationpoint` (
  `Violation_Point_id` int NOT NULL,
  `Violation Points - 1` varchar(254) ,
  `Violation Points - 2` varchar(254) ,
  `Violation Points - 3` varchar(254) ,
  `Violation Points - 4` varchar(254) ,
  `Violation Points - 5` varchar(254) ,
  `Violation Points - 6` varchar(254) ,
  `Violation Points - 7` varchar(254) ,
  `Violation Points - 8` varchar(254) ,
  `Violation Points - 9` varchar(254) ,
  `Violation Points - 10` varchar(254) ,
  `Violation Points - 11` varchar(254) ,
  `Violation Points - 12` varchar(254) ,
  `Violation Points - 13` varchar(254) ,
  `Violation Points - 14` varchar(254) ,
  `Violation Points - 15` varchar(254) ,
  `Violation Points - 16` varchar(254) ,
  `Violation Points - 17` varchar(254) ,
  `Violation Points - 18` varchar(254) ,
  `Violation Points - 19` varchar(254) ,
  `Violation Points - 20` varchar(254) ,
  `Violation Points - 21` varchar(254) ,
  `Violation Points - 22` varchar(254) ,
  `Violation Points - 23` varchar(254) ,
  `Violation Points - 24` varchar(254) ,
  `Violation Points - 25` varchar(254) ,
  Primary key (Violation_Point_id)
) ;


-- dallas.factdallas definition

CREATE TABLE `factdallas` (
  `Dallas_id` int NOT NULL,
  `Restaurant_id` int DEFAULT NULL,
  `Inspection_id` int DEFAULT NULL,
  `Geography_id` int DEFAULT NULL,
  `Violation_Description_id` int DEFAULT NULL,
  `Violation_Point_id` int DEFAULT NULL,
  `Violation_Detail_id` int DEFAULT NULL,
  `Violation_Memo_id` int DEFAULT NULL,
  `Inspection Score` varchar(254) ,
 Primary key (Dallas_id)
) ;




-- 
-- TABLE: FactDallas 
--

ALTER TABLE FactDallas ADD CONSTRAINT RefDimLocation5 
    FOREIGN KEY (Location_id)
    REFERENCES DimLocation(Location_id)
;

ALTER TABLE FactDallas ADD CONSTRAINT RefDimInspection6 
    FOREIGN KEY (Inspection_id)
    REFERENCES DimInspection(Inspection_id)
;

ALTER TABLE FactDallas ADD CONSTRAINT RefViolation_Description7 
    FOREIGN KEY (Violation_Description_id)
    REFERENCES `Violation Description`(Violation_Description_id)
;

ALTER TABLE FactDallas ADD CONSTRAINT RefDimension_Violation8 
    FOREIGN KEY (Violation_point_id)
    REFERENCES Dimension_Violation(Violation_point_id)
;

ALTER TABLE FactDallas ADD CONSTRAINT RefViolation_Detail9 
    FOREIGN KEY (Violation_Detail_id)
    REFERENCES `Violation Detail`(Violation_Detail_id)
;

ALTER TABLE FactDallas ADD CONSTRAINT RefViolation_Memo10 
    FOREIGN KEY (Violation_id)
    REFERENCES Violation_Memo(Violation_id)
;

ALTER TABLE FactDallas ADD CONSTRAINT RefDimRestaurent11 
    FOREIGN KEY (Restaurent_id)
    REFERENCES DimRestaurent(Restaurent_id)
;