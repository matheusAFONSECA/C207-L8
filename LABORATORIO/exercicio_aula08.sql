DROP DATABASE IF EXISTS EXERCICIO;

CREATE DATABASE IF NOT EXISTS EXERCICIO;

USE EXERCICIO;

CREATE TABLE IF NOT EXISTS cliente(
	idCliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cpf INT,
    nome VARCHAR(45),
    endereco VARCHAR(45)
);

INSERT INTO cliente(nome, cpf, endereco) VALUES('Fulano', 222222, 'Pouso Alegre');
INSERT INTO cliente(nome, cpf, endereco) VALUES('Ciclano', 111111, 'Santa Rita');

ALTER TABLE cliente ADD ano_nasc INT;

UPDATE cliente SET ano_nasc = 1994 WHERE idCliente = 1;
UPDATE cliente SET ano_nasc = 2000 WHERE idCliente = 2;

DELETE FROM cliente WHERE idCliente = 1;

SELECT * FROM cliente;


