-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema evp
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema evp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `evp` ;
USE `evp` ;

-- -----------------------------------------------------
-- Table `evp`.`Make`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evp`.`Make` (
  `make_id` INT NOT NULL,
  `make_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`make_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evp`.`Model`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evp`.`Model` (
  `model_id` INT NOT NULL,
  `model_name` VARCHAR(45) NOT NULL,
  `make_id` INT NOT NULL,
  PRIMARY KEY (`model_id`),
  INDEX `fk_Model_Make1_idx` (`make_id` ASC) VISIBLE,
  CONSTRAINT `fk_Model_Make1`
    FOREIGN KEY (`make_id`)
    REFERENCES `evp`.`Make` (`make_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evp`.`Vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evp`.`Vehicle` (
  `vehicle_id` INT NOT NULL,
  `ev_type` VARCHAR(45) NOT NULL,
  `electric_range_miles` INT NOT NULL,
  `cafv_eligibility_status` VARCHAR(45) NOT NULL,
  `model_id` INT NOT NULL,
  `model_year` SMALLINT NOT NULL,
  PRIMARY KEY (`vehicle_id`),
  INDEX `fk_Vehicle_Model1_idx` (`model_id` ASC) VISIBLE,
  CONSTRAINT `fk_Vehicle_Model1`
    FOREIGN KEY (`model_id`)
    REFERENCES `evp`.`Model` (`model_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evp`.`Location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evp`.`Location` (
  `location_id` INT NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `county` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `zip_code` VARCHAR(10) NOT NULL,
  `census_tract` VARCHAR(10) NOT NULL,
  `legislative_district` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`location_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evp`.`Vehicle_Inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evp`.`Vehicle_Inventory` (
  `dol_vehicle_id` INT NOT NULL,
  `vin` VARCHAR(45) NOT NULL,
  `vehicle_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  PRIMARY KEY (`dol_vehicle_id`),
  INDEX `fk_Vehicle_Inventory_Vehicle1_idx` (`vehicle_id` ASC) VISIBLE,
  INDEX `fk_Vehicle_Inventory_Location1_idx` (`location_id` ASC) VISIBLE,
  CONSTRAINT `fk_Vehicle_Inventory_Vehicle1`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `evp`.`Vehicle` (`vehicle_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vehicle_Inventory_Location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `evp`.`Location` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evp`.`Utility`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evp`.`Utility` (
  `utility_id` INT NOT NULL,
  `utility_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`utility_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evp`.`Location_Utility`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evp`.`Location_Utility` (
  `location_id` INT NOT NULL,
  `utility_id` INT NOT NULL,
  PRIMARY KEY (`location_id`, `utility_id`),
  INDEX `fk_Location_has_Utility_Utility1_idx` (`utility_id` ASC) VISIBLE,
  INDEX `fk_Location_has_Utility_Location1_idx` (`location_id` ASC) VISIBLE,
  CONSTRAINT `fk_Location_has_Utility_Location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `evp`.`Location` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Location_has_Utility_Utility1`
    FOREIGN KEY (`utility_id`)
    REFERENCES `evp`.`Utility` (`utility_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
