drop database if exists aula3;
create database aula3;
use aula3;

#COMANDO PARA DESATIVAR O SAFE MODE
SET SQL_SAFE_UPDATES = 0;

#QUESTAO 1
# Uma chave primária identifica exclusivamente cada registro em uma tabela de banco de dados.
# As chaves primárias facilitam a vinculação de informações em tabela separadas.


#QUESTAO 2
create table if not exists pessoa(
	id int not null auto_increment primary key,
    nome varchar(45),
    endereco varchar(45),
    cargo varchar(45)
);

#RESPOSNDA A QUESTÂO 2 AQUI
#A)
INSERT INTO pessoa(nome, endereco, cargo)
VALUES('João Lucas', 'centro - Pouso Alegre', 'Pintor'); 

INSERT INTO pessoa(nome, endereco, cargo)
VALUES('Maciel', 'rua candinha - Conceição dos Ouros', 'Pedreiro'); 

INSERT INTO pessoa(nome, endereco, cargo)
VALUES('Vitor', 'centro - Santa Rita do Sapucaí', 'Carpinteiro'); 

SELECT * FROM pessoa;  # comando para eu ver como esta as modificações na tabela

#B)
UPDATE pessoa SET nome = 'Zezé' WHERE id = '1';

#C)
SELECT nome, endereco FROM pessoa;

#D)
DELETE FROM pessoa WHERE id = 3;


#QUESTAO 3
create table empresa(
	matricula int not null auto_increment primary key,
    nome varchar(45),
    cpf varchar(45),
    cargo varchar(45),
    nProjetos int
);

#RESPOSNDA A QUESTÂO 3 AQUI
#A)
INSERT INTO empresa(nome, cpf, cargo, nProjetos)
VALUES('Junior', '000.000.000-00', 'GP', 2); 

INSERT INTO empresa(nome, cpf, cargo, nProjetos)
VALUES('Maria', '111.111.111-11', 'Desenvolvedor', 3); 

INSERT INTO empresa(nome, cpf, cargo, nProjetos)
VALUES('Carlos', '222.222.222-22', 'Tester', 4); 

INSERT INTO empresa(nome, cpf, cargo, nProjetos)
VALUES('Julia', '333.333.333-33', 'Desenvolvedor', 5); 

SELECT * FROM empresa;  # comando para eu ver como esta as modificações na tabela

#B)
SELECT nome FROM empresa WHERE nProjetos >= 4;

#C)
SELECT AVG(nProjetos) FROM empresa WHERE cargo != 'GP';

#D)
SELECT DISTINCT cargo FROM empresa;

#E)
SELECT nome, cpf, nProjetos FROM empresa WHERE cargo = 'Desenvolvedor';


#QUESTAO 4
create table aluno(
	nome varchar(45),
	matricula int NOT NULL PRIMARY KEY,
    Endereco varchar(45),
    Ano_nasc varchar(45),
    curso varchar(45)
);

# RESPOSNDA A QUESTÂO 4 AQUI
INSERT INTO aluno(nome, matricula, Endereco, Ano_nasc, curso)
VALUES('Janaina', 123, 'Rua 1', '1998', 'GEB');

# Aqui não poderia colocar como default a matricula porque ela é uma chave primária
INSERT INTO aluno(nome, matricula, Endereco, Ano_nasc, curso)
VALUES('Pedro', 124, 'Rua 2', '2000', 'GES');

# Faltou colocar o numero da matricula
INSERT INTO aluno(nome, matricula, Endereco, Ano_nasc, curso)
VALUES('Jander', 125, 'Rua 3', '1999', 'GEC'); 

# Estava com o mesmo numero de matricula, isso não pode acontecer
INSERT INTO aluno(nome, matricula, Endereco, Ano_nasc, curso)
VALUES('Lucca', 126, 'Rua 4', '1998', 'GEB');

# Falotu dizer qual o curso que o aluno pertence
INSERT INTO aluno(nome, matricula, Endereco, Ano_nasc, curso)
VALUES('Laura', 456, 'Rua 5', '1998', 'GEB');

SELECT * FROM aluno;  # comando para eu ver como esta as modificações na tabela

#F)
SELECT nome, matricula, curso FROM aluno WHERE nome LIKE 'Jan____%';

#G)
SELECT nome, curso FROM aluno WHERE nome LIKE 'L%A';

#H)
SELECT DISTINCT Ano_nasc, curso FROM aluno;

#I)
SELECT nome, Ano_nasc, curso FROM aluno WHERE Ano_nasc <= '1998';

#J)
SELECT * FROM aluno LIMIT 3;

#K)
UPDATE aluno SET endereco = 'Barril' WHERE curso = 'GEB';

#L)
DELETE FROM aluno WHERE curso = 'GEB';
