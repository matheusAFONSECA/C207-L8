CREATE DATABASE IF NOT EXISTS aula02Pt2;

USE aula02Pt2;

CREATE TABLE IF NOT EXISTS Cliente(
	cpf VARCHAR(11) NOT NULL PRIMARY KEY,
    nome VARCHAR(45),
    idade int,
    cidade VARCHAR(45),
    totalCompra INT
);

INSERT INTO Cliente(cpf, nome, idade, cidade, totalCompra)
VALUES('12379843256', 'João Lucas', '24', 'Pouso Alegre', '145'); 

INSERT INTO Cliente(cpf, nome, idade, cidade, totalCompra)
VALUES('95487361584', 'Joana', '45', 'Itajubá', '130.25'); 

INSERT INTO Cliente(cpf, nome, idade, cidade, totalCompra)
VALUES('65482751499', 'Pedro', '33', 'Itajubá', '78.9'); 

SELECT nome, cidade, totalCompra FROM Cliente WHERE totalCompra >= 100
AND cidade != 'Itajubá';

SELECT max(totalCompra) FROM Cliente;

SELECT * FROM Cliente WHERE nome LIKE 'J___ %';
SELECT * FROM Cliente WHERE nome LIKE 'P%';
SELECT * FROM Cliente WHERE nome LIKE 'Joa%';

SELECT nome, cidade FROM Cliente LIMIT 2;

SELECT DISTINCT cidade FROM Cliente;

