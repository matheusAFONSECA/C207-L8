# criando esquema do BD do exercício do Capítulo 4 - DDL
CREATE SCHEMA IF NOT EXISTS `Exercicio4`;

# usando o BD "Exercicio4"
USE `Exercicio4` ;

# tabela de Departamento
CREATE TABLE Departamento (

	DNumero INT NOT NULL,					# numero do departamento
	DNome VARCHAR(45) NOT NULL,				# nome do departamento
	SSN_Empregado INT,				# SSN do empregado responsável pelo departamento
	DataInicio DATE NOT NULL,				# data de inicio do departamento
	
    PRIMARY KEY (DNumero),					# chave primaria -> numero do departamento
	
    FOREIGN KEY (SSN_Empregado)				# chave estrangeira -> SSN do empregado responsável
		REFERENCES Empregado(SSN)
		ON DELETE SET NULL					# se deletar a SSN do empregado, seta como nula
		ON UPDATE CASCADE					# se atualizar SSN do empregado, atualiza aqui
);

# tabela das localizações do departamento
CREATE TABLE Depto_localizacoes (
	# atributos
	LNumero INT PRIMARY KEY,					# numero da localização
	DLocalizacao VARCHAR(45) NOT NULL,			# localização do departamento
	DNumero_Departamento INT NOT NULL,			# numero do departamento
    
	FOREIGN KEY (DNumero_Departamento)			# chave estrangeira -> numero do departamento
		REFERENCES Departamento(DNumero)
		ON DELETE CASCADE						# se deletar o departamento, delatar localização também
		ON UPDATE CASCADE						# se atualizar o departamento, atualizar localização também
);


# tabela de projetos
CREATE TABLE Projeto (
	# atributos
	PNome VARCHAR(45) NOT NULL,				# nome do projeto
	PNumero INT NOT NULL,					# numero do projeto
	PLocalizacao VARCHAR(45) NOT NULL,		# localizacao do projeto
	DNumero_Departamento INT NOT NULL,		# numero do departamento responsável pelo projeto
	
    PRIMARY KEY (PNumero),					# chave primária -> numero do projeto
	
    FOREIGN KEY (DNumero_Departamento)		# chave estrangeira -> numeo do departamento
		REFERENCES Departamento(DNumero)
		ON DELETE SET NULL					# se deletar o departamento, seta como nulo
		ON UPDATE CASCADE					# se atualizar o departamento, atualiza aqui
);

# tabela de empregado
CREATE TABLE Empregado(
	# atributos
	PNome VARCHAR(45) NOT NULL,			# nome do projeto que o empregado está
	MInicial VARCHAR(45) NOT NULL,		# primeiro nome do empregado
	UNome VARCHAR(45) NOT NULL,			# último nome - sobrenome - do empregado
	SSN BIGINT NOT NULL,					# SSN do empregado
	DataNasc DATE NOT NULL,				# data de nascimento do empregado
	Endereco VARCHAR(45) NOT NULL,		# endereço de moradia do empregado
	Sexo BIT NOT NULL,					# sexo do empregado -> 0 - masculino e 1 -> feminino
	Salario DECIMAL(10,2) NOT NULL,		# salário do empregado
	SSN_Supervisor BIGINT NOT NULL,	    # SSN do supervisor do empregado
	DNumero_Departamento INT NOT NULL,	# numero do departamento que o empregado trabalha
  
	PRIMARY KEY (SSN),					# chave primária -> SSN do empregado
  
	CONSTRAINT fk1
		FOREIGN KEY (SSN_Supervisor) 		# chave estrangeira -> SSN do surpervusor
		REFERENCES empregado (SSN)
		ON DELETE CASCADE 					# deleta o empregado se o supervisor for deletado
		ON UPDATE CASCADE,					# atualiza os dados do supervisor do empregado
											
  
	CONSTRAINT fk2
		FOREIGN KEY (DNumero_Departamento) 	# chave estrangeira -> numero do departamento
		REFERENCES departamento (DNumero)
		ON DELETE SET NULL 					# seta o departamento do empregado como nulo se o mesmo for apagado
		ON UPDATE CASCADE					# se atualizar o departamento, atualiza o do empregado
);

# tabela de dependente
CREATE TABLE Dependente (
	# atributos
	SSN_Empregado INT NOT NULL,					# SSN do empregado que o dependente tem relação
	Nome_Departamento VARCHAR(45) NOT NULL,		# nome do departamento do empregado que o dependente tem relação
	Sexo BIT NOT NULL,							# sexo do dependente -> 0 - masculino e 1 -> feminino
	DataNasc DATE NOT NULL,						# data de nascimento do dependente
	Parentesco VARCHAR(45) NOT NULL,			# grau de parentesco do dependente com o empregado
    
    CONSTRAINT fk3
		FOREIGN KEY (Nome_Departamento)			# chave estrangeira -> nome do departamento do empregado
		REFERENCES Departamento(DNome)
		ON DELETE SET NULL						# se o departamento for deletado, setar nulo
		ON UPDATE CASCADE,						# se o departamento for atualizado, atualizar também
        
	CONSTRAINT fk4
		FOREIGN KEY (SSN_Empregado)				# chave estrangeira ->  SSN do empregado que o dependente tem relação
		REFERENCES Empregado(SSN)
		ON DELETE CASCADE						# se deletar o empregado, deleta o dependente
		ON UPDATE CASCADE						# se atualizar o empreagdo, atualiza o dependente
);

# tabela de trabalha_em -> onde o empreagdo trabalha -> correlaciona o projeto e o empregado
CREATE TABLE Trabalha_em (
	# atributos
	SSN_Empregado INT NOT NULL,				# SSN do empregado
	PNumero_Projeto INT NOT NULL,			# numero do projeto onde o empregado trabalha
	Horas INT NOT NULL,						# horas que o empregado trabalha no projeto
    
    CONSTRAINT fk5
		FOREIGN KEY (PNumero_Projeto)		# chave estrangeira -> numero do projeto
		REFERENCES Projeto(PNumero)
		ON DELETE SET NULL					# se deletar o projeto, setar como nulo
		ON UPDATE CASCADE,					# se atualizar, atualiza aqui
        
    CONSTRAINT fk6
		FOREIGN KEY (SSN_Empregado)			# chave estrangeira -> SSN do empregado
		REFERENCES Empregado(SSN)
		ON DELETE SET NULL					# se deletar o empregado, setar como nulo
		ON UPDATE CASCADE					# se atualizar o empregado, atualiza aqui
)


