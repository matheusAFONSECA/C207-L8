DROP DATABASE IF EXISTS triggerbd;
CREATE DATABASE triggerbd;
USE triggerbd;

CREATE TABLE IF NOT EXISTS conta(
	numero INT PRIMARY KEY,
    total FLOAT
);

CREATE TRIGGER int_soma BEFORE INSERT
ON conta
FOR EACH ROW SET @soma = @soma + NEW.total;

SET @soma = 0;

INSERT INTO conta() VALUES
(1, 20),
(2, 180),
(3, -50);

SELECT @soma;


DELIMITER $$
CREATE TRIGGER update_check BEFORE UPDATE
ON conta
FOR EACH ROW
BEGIN
IF NEW.total < 0 THEN
SET NEW.total = 0;
ELSEIF NEW.total > 100 THEN
SET NEW.total = 100;
END IF;
END; $$
DELIMITER ;

UPDATE conta SET total = 200 WHERE numero = 2;
UPDATE conta SET total = -92 WHERE numero = 3;

SELECT * FROM conta;

