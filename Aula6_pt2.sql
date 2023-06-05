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

CREATE VIEW qtd_estoque AS (
	SELECT i.nome 'Item', e.qtd_disponivel 'Quantidade de estoque'
    FROM estoque e, itens_solicitacao i
    WHERE e.cod_item = i.cod_item
);

SELECT * FROM qtd_estoque;

DROP VIEW qtd_compra;
CREATE VIEW qtd_compra AS (
	SELECT i.qtd 'Querem comprar', e.qtd_disponivel 'Podem Vender'
    FROM estoque e, itens_solicitacao i
    WHERE i.nome like "Resistor%" AND e.cod_item = i.cod_item
);

SELECT * FROM qtd_compra;