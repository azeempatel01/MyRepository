SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


USE `mydb` ;

-- -----------------------------------------------------
-- Code for analysis PART1
-- -----------------------------------------------------

CREATE TEMPORARY TABLE Question_1
 SELECT 
 `Postcode`,
  CONVERT(`Pageviews_datetime`, DATE ),
  count(`URL`) as Count_URL
 FROM `mydb`.`Table1`
 GROUP BY  `Postcode`, CONVERT(`Pageviews_datetime`, DATE )
LIMIT 0;


-- -----------------------------------------------------
-- Code for analysis PART2
-- -----------------------------------------------------

CREATE TEMPORARY TABLE Question_2
 SELECT 
 `Postcode`,
  CONVERT(`Pageviews_datetime`, DATE ),
  count(`URL`) as Count_URL
 FROM `mydb`.`Table_2`
 GROUP BY  `Postcode`, CONVERT(`Pageviews_datetime`, DATE )
LIMIT 0;

