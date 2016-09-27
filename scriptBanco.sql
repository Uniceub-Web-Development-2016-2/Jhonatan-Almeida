-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema escoladb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `escoladb` ;

-- -----------------------------------------------------
-- Schema escoladb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `escoladb` DEFAULT CHARACTER SET utf8 ;
USE `escoladb` ;

-- -----------------------------------------------------
-- Table `escoladb`.`tb_user_profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `escoladb`.`tb_user_profile` ;

CREATE TABLE IF NOT EXISTS `escoladb`.`tb_user_profile` (
  `idt_user_profile` INT NOT NULL AUTO_INCREMENT,
  `rnk_user` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`idt_user_profile`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escoladb`.`tb_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `escoladb`.`tb_user` ;

CREATE TABLE IF NOT EXISTS `escoladb`.`tb_user` (
  `idt_user` INT NOT NULL AUTO_INCREMENT,
  `lgn_user` VARCHAR(15) NOT NULL,
  `psw_user` VARCHAR(32) NOT NULL,
  `eml_user` VARCHAR(50) NOT NULL,
  `dte_user` DATE NOT NULL,
  `gnd_user` VARCHAR(1) NOT NULL,
  `pnt_user` INT NULL,
  `cod_user_profile` INT NOT NULL,
  PRIMARY KEY (`idt_user`),
  INDEX `fk_tb_user_tb_user_profile1_idx` (`cod_user_profile` ASC),
  CONSTRAINT `fk_tb_user_tb_user_profile1`
    FOREIGN KEY (`cod_user_profile`)
    REFERENCES `escoladb`.`tb_user_profile` (`idt_user_profile`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escoladb`.`tb_tutorial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `escoladb`.`tb_tutorial` ;

CREATE TABLE IF NOT EXISTS `escoladb`.`tb_tutorial` (
  `idt_tutorial` INT NOT NULL,
  `cod_user` INT NOT NULL,
  `tpe_tutorial` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`idt_tutorial`),
  INDEX `fk_tb_tutorial_tb_user1_idx` (`cod_user` ASC),
  CONSTRAINT `fk_tb_tutorial_tb_user1`
    FOREIGN KEY (`cod_user`)
    REFERENCES `escoladb`.`tb_user` (`idt_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escoladb`.`td_forum`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `escoladb`.`td_forum` ;

CREATE TABLE IF NOT EXISTS `escoladb`.`td_forum` (
  `idt_forum` INT NOT NULL AUTO_INCREMENT,
  `thm_forum` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`idt_forum`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escoladb`.`tb_topic`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `escoladb`.`tb_topic` ;

CREATE TABLE IF NOT EXISTS `escoladb`.`tb_topic` (
  `idt_topic` INT NOT NULL AUTO_INCREMENT,
  `cod_forum` INT NOT NULL,
  `titl_topic` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`idt_topic`),
  INDEX `fk_tb_topic_td_forum1_idx` (`cod_forum` ASC),
  CONSTRAINT `fk_tb_topic_td_forum1`
    FOREIGN KEY (`cod_forum`)
    REFERENCES `escoladb`.`td_forum` (`idt_forum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escoladb`.`tb_subject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `escoladb`.`tb_subject` ;

CREATE TABLE IF NOT EXISTS `escoladb`.`tb_subject` (
  `idt_assunto` INT NOT NULL AUTO_INCREMENT,
  `cod_assunto` INT NOT NULL,
  PRIMARY KEY (`idt_assunto`, `cod_assunto`),
  INDEX `fk_tb_assunto_tb_forum1_idx` (`cod_assunto` ASC),
  CONSTRAINT `fk_tb_assunto_tb_forum1`
    FOREIGN KEY (`cod_assunto`)
    REFERENCES `escoladb`.`td_forum` (`idt_forum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escoladb`.`ta_production`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `escoladb`.`ta_production` ;

CREATE TABLE IF NOT EXISTS `escoladb`.`ta_production` (
  `idt_production` INT NOT NULL AUTO_INCREMENT,
  `cod_tutorial` INT NOT NULL,
  `cont_production` TEXT NOT NULL,
  PRIMARY KEY (`idt_production`),
  INDEX `fk_ta_producao_tb_tutorial1_idx` (`cod_tutorial` ASC),
  CONSTRAINT `fk_ta_producao_tb_tutorial1`
    FOREIGN KEY (`cod_tutorial`)
    REFERENCES `escoladb`.`tb_tutorial` (`idt_tutorial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escoladb`.`tb_competition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `escoladb`.`tb_competition` ;

CREATE TABLE IF NOT EXISTS `escoladb`.`tb_competition` (
  `idt_competition` INT NOT NULL AUTO_INCREMENT,
  `cod_user` INT NOT NULL,
  `tpe_competition` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`idt_competition`),
  INDEX `fk_tb_competition_tb_user1_idx` (`cod_user` ASC),
  CONSTRAINT `fk_tb_competition_tb_user1`
    FOREIGN KEY (`cod_user`)
    REFERENCES `escoladb`.`tb_user` (`idt_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escoladb`.`tb_shop`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `escoladb`.`tb_shop` ;

CREATE TABLE IF NOT EXISTS `escoladb`.`tb_shop` (
  `idt_shop` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idt_shop`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escoladb`.`ta_post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `escoladb`.`ta_post` ;

CREATE TABLE IF NOT EXISTS `escoladb`.`ta_post` (
  `idt_post` INT NOT NULL AUTO_INCREMENT,
  `cod_user` INT NOT NULL,
  `cod_topic` INT NOT NULL,
  `cnt_post` TEXT NULL,
  PRIMARY KEY (`idt_post`),
  INDEX `fk_ta_post_tb_user1_idx` (`cod_user` ASC),
  INDEX `fk_ta_post_tb_topic1_idx` (`cod_topic` ASC),
  CONSTRAINT `fk_ta_post_tb_user1`
    FOREIGN KEY (`cod_user`)
    REFERENCES `escoladb`.`tb_user` (`idt_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ta_post_tb_topic1`
    FOREIGN KEY (`cod_topic`)
    REFERENCES `escoladb`.`tb_topic` (`idt_topic`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escoladb`.`ta_c`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `escoladb`.`ta_c` ;

CREATE TABLE IF NOT EXISTS `escoladb`.`ta_c` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escoladb`.`ta_compRules`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `escoladb`.`ta_compRules` ;

CREATE TABLE IF NOT EXISTS `escoladb`.`ta_compRules` (
  `idt_compRules` INT NOT NULL AUTO_INCREMENT,
  `cod_competition` INT NOT NULL,
  `rls_compRules` TEXT NOT NULL,
  PRIMARY KEY (`idt_compRules`),
  INDEX `fk_ta_compType_tb_competition1_idx` (`cod_competition` ASC),
  CONSTRAINT `fk_ta_compType_tb_competition1`
    FOREIGN KEY (`cod_competition`)
    REFERENCES `escoladb`.`tb_competition` (`idt_competition`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escoladb`.`tb_chat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `escoladb`.`tb_chat` ;

CREATE TABLE IF NOT EXISTS `escoladb`.`tb_chat` (
  `idt_chat` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idt_chat`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
