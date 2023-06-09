-- MySQL Script generated by MySQL Workbench
-- Mon May  8 10:44:32 2023
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
-- Table `mydb`.`Agente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Agente` (
  `idAgente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NULL,
  `nascimento` DATE NULL,
  `habilidade` VARCHAR(45) NULL,
  `sexo` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`idAgente`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`vilao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`vilao` (
  `idvilao` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `num_crimes` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idvilao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`missao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`missao` (
  `idmissao` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `local` VARCHAR(45) NULL,
  `duracao` INT NULL,
  `vilao_idvilao` INT NOT NULL,
  PRIMARY KEY (`idmissao`),
  CONSTRAINT `fk_missao_vilao`
    FOREIGN KEY (`vilao_idvilao`)
    REFERENCES `mydb`.`vilao` (`idvilao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Agente_has_missao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Agente_has_missao` (
  `Agente_idAgente` INT NOT NULL,
  `missao_idmissao` INT NOT NULL,
  PRIMARY KEY (`Agente_idAgente`, `missao_idmissao`),
  CONSTRAINT `fk_Agente_has_missao_Agente1`
    FOREIGN KEY (`Agente_idAgente`)
    REFERENCES `mydb`.`Agente` (`idAgente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Agente_has_missao_missao1`
    FOREIGN KEY (`missao_idmissao`)
    REFERENCES `mydb`.`missao` (`idmissao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

# AQUI COMEÇA A INSERÇÃO DE DADOS NAS TEBELAS -> 5 registros
INSERT INTO agente values 
('Vivi', 'Conceição-dos-Ouros', '2003-05-08', 'finanças', 'feminino', 'vivi@agente.com'),
('Juju', 'Zoro', '2000-05-08', 'porradaria', 'feminino', 'juju@agente.com'),
('Char', 'Paraíso', '1982-05-08', 'roubar', 'feminino', 'char@agente.com'),
('Vini', 'Santa Rita', '2003-05-08', 'força', 'masculino', 'vini@agente.com'),
('Gad', 'Poços', '2003-05-08', 'piloto-carro', 'masculino', 'gad@agente.com');

INSERT INTO vilao values 
("Estevan", 2000),
("LF", 400),
("Japa", 4000),
("Marcelo", 300),
("Renan", 5000);

INSERT INTO missao values
('2024-12-08', 'missao finanças', 'Santa-Rita', 2, 1),
('2024-06-08', 'missao roubo', 'Pouso Alegre', 4, 3),
('2024-05-08', 'missao piloto', 'São Paulo', 6, 2),
('2024-07-08', 'missao briga', 'Rio de Janeiro', 7, 5),
('2024-09-08', 'missao fuga', 'Belo Horizonte', 1, 4);

INSERT INTO agente_has_missao values 
(1, 2),
(2, 1),
(3, 4),
(4, 5),
(5, 3);

# Selecionando o nome, email do agente e data e nome das missões onde cada um atuou
SELECT Agente.nome, Agente.email, missao.data, missao.nome
FROM Agente
INNER JOIN agente_has_missao ON Agente.idAgente = agente_has_missao.Agente_idAgente
INNER JOIN missao ON agente_has_missao.missao_idmissao = missao.idmissao;

# Selecionando a data, duração e nome do vilão de cada missão
SELECT missao.data, missao.nome, missao.duracao, vilao.nome
FROM missao
INNER JOIN vilao ON vilao_idvilao = idvilao;

# Selecionando os nomes do agente, da missão e do vilão
SELECT Agente.nome, missao.nome, vilao.nome
FROM Agente
INNER JOIN agente_has_missao ON Agente.idAgente = agente_has_missao.Agente_idAgente
INNER JOIN missao ON agente_has_missao.missao_idmissao = missao.idmissao
INNER JOIN vilao ON vilao_idvilao = idvilao;

