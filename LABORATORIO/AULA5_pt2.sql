DROP DATABASE IF EXISTS aula_procedure;
CREATE DATABASE aula_procedure;
USE aula_procedure;

CREATE TABLE Aluno(
	id int not null auto_increment primary key,
    nome varchar(50),
    idade int,
    curso varchar(3),
    email varchar(100)
);

# FUNCTION QUE CRIA O EMAIL DO ALUNO
DELIMITER $$
DROP FUNCTION IF EXISTS criarEmail $$
CREATE FUNCTION criarEmail(nome VARCHAR(15), curso VARCHAR(3)) RETURNS VARCHAR(45)
DETERMINISTIC
BEGIN
    
    RETURN concat(nome, "@", curso, ".inatel.br");
    
END $$
DELIMITER ;

SELECT criarEmail('Pedro', 'gec') AS Email;

# UM PROCEDURE QUE INSERE DADOS NA TABELA ALUNO
DELIMITER $$
DROP PROCEDURE IF EXISTS inserirDados $$
CREATE PROCEDURE inserirDados(IN nome VARCHAR(15), IN idade INT, IN curso VARCHAR(3))
BEGIN
	DECLARE email VARCHAR(45);
    
    SET email = criarEmail(nome, curso);
    
    INSERT INTO Aluno VALUE (default, nome, idade, curso, email);
    
END $$
DELIMITER ;

CALL inserirDados('Pedro', 21, 'gec');