CREATE DATABASE IF NOT EXISTS aula02;

USE aula02;

CREATE TABLE IF NOT EXISTS Usuario(
	idUsuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    ana_nasc INT,
    pais VARCHAR(45)
);

INSERT INTO Usuario(nome, ana_nasc, pais)
VALUES('Fulano', 2, 'Brasil');

INSERT INTO Usuario(nome) VALUES ('Pedro');

INSERT INTO Usuario() VALUES (default, 'Rafael', 3, 'Italia');

UPDATE Usuario SET nome = 'Joaquim' WHERE idUsuario = '1';

UPDATE Usuario SET ana_nasc = 1, pais = 'EUA'
WHERE idUsuario = '3';

DELETE FROM Usuario WHERE idUsuario = 3;

SELECT * FROM Usuario;

SELECT pais, ana_nasc FROM Usuario
WHERE nome = 'Joaquim';

