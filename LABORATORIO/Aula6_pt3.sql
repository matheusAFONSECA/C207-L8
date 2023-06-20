DROP DATABASE IF EXISTS loja;
CREATE DATABASE loja;
USE loja;

SET GLOBAL log_bin_trust_function_creators = 1;

CREATE TABLE compra(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    preco FLOAT,
    pagamento FLOAT
);

INSERT INTO compra VALUES
(id, 9.5, 10.25),
(id, 18.99, 25),
(id, 3.99, 5),
(id, 0.05, 0.09),
(id, 19.49, 20);

CREATE VIEW qtd_compras AS (
	SELECT c.id, c.preco 'Preço'
    FROM compra c
    WHERE c.preco >= 10
);

SELECT * FROM qtd_compras;


