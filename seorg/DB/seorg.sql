-- MySQL Script generated by MySQL Workbench
-- Mon Jun 13 07:39:16 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `id` INT NOT NULL,
  `nickname` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `nick_UNIQUE` (`nickname` ASC) VISIBLE,
  UNIQUE INDEX `correo electronico_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`evaluacionOrganizacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`evaluacionOrganizacion` (
  `id` INT NOT NULL,
  `comentarios` VARCHAR(45) NULL,
  `tiempo de espera` VARCHAR(45) NOT NULL,
  `calificacion general` INT NOT NULL,
  `usuarios_id` INT NOT NULL,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  INDEX `fk_evaluacionOrganizacion_usuarios1_idx` (`usuarios_id` ASC) VISIBLE,
  CONSTRAINT `fk_evaluacionOrganizacion_usuarios1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `mydb`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`organizacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`organizacion` (
  `id` INT NOT NULL,
  `nickname` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `nombreOrganizacion` VARCHAR(45) NULL,
  `detalleOrganizacion` VARCHAR(500) NULL,
  `horarioAtenci??n` VARCHAR(45) NULL,
  `ciudad` VARCHAR(45) NULL,
  `calle` VARCHAR(45) NULL,
  `numero` INT NULL,
  `evaluacionOrganizacion_id` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_organizacion_evaluacionOrganizacion1_idx` (`evaluacionOrganizacion_id` ASC) VISIBLE,
  CONSTRAINT `fk_organizacion_evaluacionOrganizacion1`
    FOREIGN KEY (`evaluacionOrganizacion_id`)
    REFERENCES `mydb`.`evaluacionOrganizacion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`administrador` (
  `id` INT NOT NULL,
  `nickname` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `usuario_id` INT NOT NULL,
  `organizacion_id` INT NOT NULL,
  `organizacion_eva org_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_administrador_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  INDEX `fk_administrador_organizacion1_idx` (`organizacion_id` ASC, `organizacion_eva org_id` ASC) VISIBLE,
  CONSTRAINT `fk_administrador_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `mydb`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_administrador_organizacion1`
    FOREIGN KEY (`organizacion_id`)
    REFERENCES `mydb`.`organizacion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
