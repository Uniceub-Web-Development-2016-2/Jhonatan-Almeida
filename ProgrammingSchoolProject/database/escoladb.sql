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
-- Table `escoladb`.`user_profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `escoladb`.`user_profile` ;

CREATE TABLE IF NOT EXISTS `escoladb`.`user_profile` (
  `id_user_profile` INT NOT NULL AUTO_INCREMENT,
  `rank` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`id_user_profile`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escoladb`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `escoladb`.`user` ;

CREATE TABLE IF NOT EXISTS `escoladb`.`user` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(15) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `date` DATE NOT NULL,
  `points` INT NOT NULL,
  `user_profile` INT NOT NULL,
  PRIMARY KEY (`id_user`),
  INDEX `fk_tb_user_tb_user_profile1_idx` (`user_profile` ASC),
  CONSTRAINT `fk_tb_user_tb_user_profile1`
    FOREIGN KEY (`user_profile`)
    REFERENCES `escoladb`.`user_profile` (`id_user_profile`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escoladb`.`tutorial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `escoladb`.`tutorial` ;

CREATE TABLE IF NOT EXISTS `escoladb`.`tutorial` (
  `id_tutorial` INT NOT NULL,
  `user` INT NOT NULL,
  `guide` TEXT NOT NULL,
  PRIMARY KEY (`id_tutorial`),
  INDEX `fk_tb_tutorial_tb_user1_idx` (`user` ASC),
  CONSTRAINT `fk_tb_tutorial_tb_user1`
    FOREIGN KEY (`user`)
    REFERENCES `escoladb`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escoladb`.`forum`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `escoladb`.`forum` ;

CREATE TABLE IF NOT EXISTS `escoladb`.`forum` (
  `id_forum` INT NOT NULL AUTO_INCREMENT,
  `topic` VARCHAR(48) NOT NULL,
  PRIMARY KEY (`id_forum`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escoladb`.`topic`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `escoladb`.`topic` ;

CREATE TABLE IF NOT EXISTS `escoladb`.`topic` (
  `id_topic` INT NOT NULL AUTO_INCREMENT,
  `forum` INT NOT NULL,
  `title` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id_topic`),
  INDEX `fk_tb_topic_td_forum1_idx` (`forum` ASC),
  CONSTRAINT `fk_tb_topic_td_forum1`
    FOREIGN KEY (`forum`)
    REFERENCES `escoladb`.`forum` (`id_forum`)
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
    REFERENCES `escoladb`.`forum` (`id_forum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escoladb`.`ta_production`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `escoladb`.`ta_production` ;

CREATE TABLE IF NOT EXISTS `escoladb`.`ta_production` (
  `id_production` INT NOT NULL AUTO_INCREMENT,
  `tutorial` INT NOT NULL,
  `cont_production` TEXT NOT NULL,
  PRIMARY KEY (`id_production`),
  INDEX `fk_ta_producao_tb_tutorial1_idx` (`tutorial` ASC),
  CONSTRAINT `fk_ta_producao_tb_tutorial1`
    FOREIGN KEY (`tutorial`)
    REFERENCES `escoladb`.`tutorial` (`id_tutorial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escoladb`.`competition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `escoladb`.`competition` ;

CREATE TABLE IF NOT EXISTS `escoladb`.`competition` (
  `id_competition` INT NOT NULL AUTO_INCREMENT,
  `user` INT NOT NULL,
  `rules` TEXT NOT NULL,
  PRIMARY KEY (`id_competition`),
  INDEX `fk_tb_competition_tb_user1_idx` (`user` ASC),
  CONSTRAINT `fk_tb_competition_tb_user1`
    FOREIGN KEY (`user`)
    REFERENCES `escoladb`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escoladb`.`Workshop`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `escoladb`.`Workshop` ;

CREATE TABLE IF NOT EXISTS `escoladb`.`Workshop` (
  `idt_shop` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idt_shop`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escoladb`.`post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `escoladb`.`post` ;

CREATE TABLE IF NOT EXISTS `escoladb`.`post` (
  `id_post` INT NOT NULL AUTO_INCREMENT,
  `user` INT NOT NULL,
  `topic` INT NOT NULL,
  `content` TEXT NOT NULL,
  PRIMARY KEY (`id_post`),
  INDEX `fk_ta_post_tb_user1_idx` (`user` ASC),
  INDEX `fk_ta_post_tb_topic1_idx` (`topic` ASC),
  CONSTRAINT `fk_ta_post_tb_user1`
    FOREIGN KEY (`user`)
    REFERENCES `escoladb`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ta_post_tb_topic1`
    FOREIGN KEY (`topic`)
    REFERENCES `escoladb`.`topic` (`id_topic`)
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
  `idt_compType` INT NOT NULL AUTO_INCREMENT,
  `cod_competition` INT NOT NULL,
  PRIMARY KEY (`idt_compType`),
  INDEX `fk_ta_compType_tb_competition1_idx` (`cod_competition` ASC),
  CONSTRAINT `fk_ta_compType_tb_competition1`
    FOREIGN KEY (`cod_competition`)
    REFERENCES `escoladb`.`competition` (`id_competition`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escoladb`.`chat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `escoladb`.`chat` ;

CREATE TABLE IF NOT EXISTS `escoladb`.`chat` (
  `id_chat` INT NOT NULL AUTO_INCREMENT,
  `user` INT NOT NULL,
  `chat_text` TEXT NOT NULL,
  PRIMARY KEY (`id_chat`),
  INDEX `fk_tb_chat_user1_idx` (`user` ASC),
  CONSTRAINT `fk_tb_chat_user1`
    FOREIGN KEY (`user`)
    REFERENCES `escoladb`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
