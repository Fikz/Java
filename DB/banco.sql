SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

create database pedidos;
use pedidos;
-- -----------------------------------------------------
-- Table `pedidos`.`tbl_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedidos`.`tbl_produto` (
  `cod_produto` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome_produto` VARCHAR(100) NOT NULL,
  `desc_produto` TEXT NOT NULL,
  `valor` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`cod_produto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pedidos`.`tbl_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedidos`.`tbl_cliente` (
  `cod_cliente` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome_cliente` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pedidos`.`tbl_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedidos`.`tbl_pedido` (
  `cod_pedido` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `cod_cliente` INT UNSIGNED NOT NULL,
  `data_pedido` DATETIME NOT NULL,
  `data_entrega` DATETIME NULL,
  PRIMARY KEY (`cod_pedido`),
  INDEX `fk_tbl_pedido_tbl_cliente1_idx` (`cod_cliente` ASC),
  CONSTRAINT `fk_tbl_pedido_tbl_cliente1`
    FOREIGN KEY (`cod_cliente`)
    REFERENCES `pedidos`.`tbl_cliente` (`cod_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pedidos`.`tbl_itempedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedidos`.`tbl_itempedido` (
  `qtd` INT UNSIGNED NOT NULL,
  `cod_produto` INT UNSIGNED NOT NULL,
  `cod_pedido` INT UNSIGNED NOT NULL,
  INDEX `fk_tbl_itempedido_tbl_produto_idx` (`cod_produto` ASC),
  INDEX `fk_tbl_itempedido_tbl_pedido1_idx` (`cod_pedido` ASC),
  CONSTRAINT `fk_tbl_itempedido_tbl_produto`
    FOREIGN KEY (`cod_produto`)
    REFERENCES `pedidos`.`tbl_produto` (`cod_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_itempedido_tbl_pedido1`
    FOREIGN KEY (`cod_pedido`)
    REFERENCES `pedidos`.`tbl_pedido` (`cod_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
