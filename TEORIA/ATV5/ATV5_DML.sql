# inserindo dois novos resgistros no departamneto -> INSERT PARCIAL
INSERT INTO departamento (DNome, DNumero, SSN_Empregado)
VALUES ('T.I.', 8, 1), ('Marketing', 7, 2);

# inserindo mais um departamento, mas somente com o nome e numero
INSERT INTO departamento (DNome, DNumero)
VALUES ('CyberSegunrança', 9);

# adicionando mais dois empregados -> registro incompleto
INSERT INTO empregado(PNome, MInicial, UNome, SSN, Sexo, Salario) 
VALUES ('Julia', 'C', 'Fonseca', 6, 0, 3500), 
('Charleny', 'S', 'Fonseca', 7, 0, 2000);

# adicionando mais dois empregados -> registro completo
INSERT INTO empregado(PNome, MInicial, UNome, SSN, DataNasc, Endereco, Sexo, Salario, SSN_Supervisor, DNumero_Departamento) 
VALUES ('Matheus', 'H', 'Fonseca', 10, '2003-02-01', 'Zoro City', 1, 5000, 7, 8),
('Vivi', 'L', 'Afonso', 11, '2003-08-04', 'Zoro City', 0, 6000, 6, 8);

# adcionando mais 3 projetos, somente nome e numero
INSERT INTO projeto(PNome, PNumero)
VALUES ('Projeto F', 5),
('Projeto V', 6),
('Projeto A', 8);

# atualizando o supervisor de três empregados
UPDATE empregado
SET SSN_Supervisor = 1
WHERE SSN = 7;
UPDATE empregado
SET SSN_Supervisor = 1
WHERE SSN = 10;
UPDATE empregado
SET SSN_Supervisor = 1
WHERE SSN = 11;

# atualizando o supervisor dos departamento cadastrados
UPDATE departamento
SET SSN_Empregado = 11
WHERE DNumero >= 7;

# atualizando a localização e o departamento de cada projeto cadastrado
UPDATE projeto
SET PLocalizacao = 'Morumbi - São Paulo', DNumero_Departamento = 9
WHERE PNumero >= 5;

# excluindo os projetos de um determindo departamento
DELETE FROM projeto
WHERE DNumero_Departamento = 9;