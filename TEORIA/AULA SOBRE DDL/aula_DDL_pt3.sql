# criando uma segunda tabela empregado
CREATE TABLE Empregado
(
  PNome VARCHAR(15) NOT NULL,		# NOT NULL -> esse atributo não pode ser vazio
  MInicial CHAR,
  UNome VARCHAR(15) NOT NULL,
  SSN BIGINT NOT NULL,
  DataNasc DATE,
  Endereco VARCHAR(80),				# VARCHAR -> atributo que aceita Strings
  Sexo BIT,
  Salario DECIMAL(10,2),
  SSN_Supervisor BIGINT,
  DNumero_Departamento INT,	# chave estrangeira da tabela Departamento
  
  PRIMARY KEY (SSN),
  CONSTRAINT fk1
	FOREIGN KEY (SSN_Supervisor) 
    REFERENCES empregado (SSN)
    ON DELETE CASCADE ON UPDATE CASCADE,	# deleta o empregado se o supervisor for deletado
											# CASCADE -> efeito cascata
  
  CONSTRAINT fk2
	FOREIGN KEY (DNumero_Departamento) 
    REFERENCES departamento (DNumero)
    ON DELETE SET NULL ON UPDATE CASCADE
);
