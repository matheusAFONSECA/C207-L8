-- MySQL Script generated by MySQL Workbench
-- Mon Mar 27 11:13:58 2023
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
-- Table `mydb`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produto` (
  `idProduto` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `preco` FLOAT NOT NULL,
  `quantidadeDisponivel` INT NOT NULL,
  PRIMARY KEY (`idProduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Loja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Loja` (
  `idLoja` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`idLoja`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCPF` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `senhaUnica` VARCHAR(45) NOT NULL,
  `CEP` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NULL,
  PRIMARY KEY (`idCPF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Correio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Correio` (
  `idCorreio` INT NOT NULL,
  `prazoEntrega` INT NOT NULL,
  `freteCalculado` FLOAT NOT NULL,
  PRIMARY KEY (`idCorreio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Compra` (
  `idCodigoRastreamento` INT NOT NULL,
  `valorTotal` FLOAT NOT NULL,
  `tipoPagamento` VARCHAR(45) NOT NULL,
  `Correio_idCorreio` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  `Cliente_idCPF` INT NOT NULL,
  PRIMARY KEY (`idCodigoRastreamento`, `Correio_idCorreio`, `Produto_idProduto`, `Cliente_idCPF`),
  CONSTRAINT `fk_Compra_Correio1`
    FOREIGN KEY (`Correio_idCorreio`)
    REFERENCES `mydb`.`Correio` (`idCorreio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Compra_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Compra_Cliente1`
    FOREIGN KEY (`Cliente_idCPF`)
    REFERENCES `mydb`.`Cliente` (`idCPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produto_has_Loja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produto_has_Loja` (
  `Produto_idProduto` INT NOT NULL,
  `Loja_idLoja` INT NOT NULL,
  PRIMARY KEY (`Produto_idProduto`, `Loja_idLoja`),
  CONSTRAINT `fk_Produto_has_Loja_Produto`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Loja_Loja1`
    FOREIGN KEY (`Loja_idLoja`)
    REFERENCES `mydb`.`Loja` (`idLoja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Avaliacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Avaliacao` (
  `Produto_idProduto` INT NOT NULL,
  `Cliente_idCPF` INT NOT NULL,
  `nota` VARCHAR(45) NOT NULL,
  `textoSobreNota` VARCHAR(45) NULL,
  PRIMARY KEY (`Produto_idProduto`, `Cliente_idCPF`),
  CONSTRAINT `fk_Produto_has_Cliente_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Cliente_Cliente1`
    FOREIGN KEY (`Cliente_idCPF`)
    REFERENCES `mydb`.`Cliente` (`idCPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;