-- MySQL Script generated by MySQL Workbench
-- Sat Nov 20 21:36:31 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema real-estate
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema real-estate
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `real-estate` DEFAULT CHARACTER SET utf8 ;
USE `real-estate` ;

-- -----------------------------------------------------
-- Table `real-estate`.`building`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `real-estate`.`building` (
  `buildingid` INT NOT NULL AUTO_INCREMENT,
  `bathrooms` INT NULL,
  `appliances` VARCHAR(200) NULL,
  `floor space` INT NULL,
  `amenities` VARCHAR(200) NULL,
  `bedrooms` INT NULL,
  PRIMARY KEY (`buildingid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `real-estate`.`listing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `real-estate`.`listing` (
  `listingid` INT NOT NULL AUTO_INCREMENT,
  `price` VARCHAR(45) NOT NULL,
  `listing type` VARCHAR(45) NOT NULL,
  `description` TEXT(5000) NULL,
  `listingcol` VARCHAR(45) NULL,
  PRIMARY KEY (`listingid`),
  CONSTRAINT `summaryid`
    FOREIGN KEY ()
    REFERENCES `real-estate`.`property summary` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `locationid`
    FOREIGN KEY ()
    REFERENCES `real-estate`.`location` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `buildingid`
    FOREIGN KEY ()
    REFERENCES `real-estate`.`building` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `real-estate`.`location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `real-estate`.`location` (
  `locationid` INT NOT NULL AUTO_INCREMENT,
  `country` VARCHAR(45) NOT NULL,
  `province/state` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `postal code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`locationid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `real-estate`.`property summary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `real-estate`.`property summary` (
  `summaryid` INT NOT NULL AUTO_INCREMENT,
  `property type` VARCHAR(45) NULL,
  `building type` VARCHAR(45) NULL,
  `storeys` INT NULL,
  `property age` INT NULL,
  `annual property taxes` DECIMAL(9,2) NULL,
  `parking type` VARCHAR(45) NULL,
  `listing age` INT NULL,
  PRIMARY KEY (`summaryid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `real-estate`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `real-estate`.`users` (
  `userid` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `role` ENUM('Renter', 'Buyer', 'Landlord', 'Realtor') NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;