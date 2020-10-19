
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


-- -----------------------------------------------------
-- Create Schema
-- -----------------------------------------------------

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Create Table `mydb`.`Postcode_Historic`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `mydb`.`Postcode_Historic` (
  `ID` INT NOT NULL,
  `Postcode` VARCHAR(4) NULL,
  `SYSDATE` DATE NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


INSERT INTO `mydb`.`Postcode_Historic` (`ID`, `Postcode`, `SYSDATE`)
SELECT *, Now()
  FROM `Other`.`User_Extracts`
 ;


-- -----------------------------------------------------
-- Create Table `mydb`.`URL_Extract_Historic`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `mydb`.`URL_Extract_Historic` (
  `User_ID` INT NOT NULL,
  `URL` LINESTRING NULL,
  `Pageviews_datetime` DATETIME NULL,
  `SYSDATE` DATE NULL,
  PRIMARY KEY (`User_ID`))
ENGINE = InnoDB;

INSERT INTO `mydb`.`URL_Extract_Historic`(`User_ID`, `Url`, `Pageviews_datetime`, `SYSDATE`)
SELECT *, Now()
  FROM `Other`.`Pageviews_Extracts`
 ;
 
 
-- -----------------------------------------------------
-- Create `mydb`.`Table_1`
-- -----------------------------------------------------
  -- Latest Postcode view  
 CREATE TABLE `mydb`.`Table1` 
  SELECT   
	  `ID`,
	  `Postcode`,
	  `URL`,
	  `Pageviews_datetime`
  FROM `Other`.`User_Extracts` as UE 
  LEFT JOIN `mydb`.`URL_Extract_Historic` as UH
  ON UE.`ID` = UH.`User_ID`
  ;
  
  
  -- -----------------------------------------------------
-- Create `mydb`.`Table_2`
-- -----------------------------------------------------
 
 CREATE TABLE `mydb`.`Table2` 
  SELECT   
	  `User_ID`,
	  `Postcode`,
	   UH.`SYSDATE`.
	  `URL`
	  `Pageviews_datetime`
  FROM `mydb`.`Postcode_Historic` as PH 
  LEFT JOIN `mydb`.`URL_Extract_Historic` as UH
  ON PH.`ID` = UH.`User_ID`
  WHERE PH.`SYSDATE` = UH.`SYSDATE` 
  ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
