DROP DATABASE IF EXISTS `view`;
CREATE DATABASE `view`;
USE `view`;

 

CREATE TABLE IF NOT EXISTS `view`.`itens_solicitacao` (
  `id_solicitacao` INT NOT NULL,
  `cod_item` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `qtd` INT NULL,
  PRIMARY KEY (`id_solicitacao`));

 

CREATE TABLE IF NOT EXISTS `view`.`estoque` (
  `cod_item` INT NOT NULL,
  `qtd_disponivel` INT NULL,
  PRIMARY KEY (`cod_item`));
  
INSERT INTO itens_solicitacao(id_solicitacao,cod_item,nome,qtd) VALUES 
(1,100,'Resistor 100k',5),
(2,110,'Resistor 1k',2),
(3,120,'Capacitor 100n',2),
(4,130,'Transistor TBJ',1);

 

INSERT INTO estoque(cod_item,qtd_disponivel) VALUES 
(100,1500),
(110,500),
(120,300),
(130,600);