drop database if exists av1;
create database av1;
use av1;

#COMANDO PARA DESATIVAR O SAFE MODE
set SQL_SAFE_UPDATES = 0;

# QUESTÃO 1
# RESPOSTA: letra A 

# QUESTÃO 2
create table if not exists aluno(
  matricula varchar(15) not null primary key,
  nome varchar(45),
  idade int,
  curso varchar(45),
  periodo int
  );
  
# A)
insert into aluno(matricula, nome, idade, curso, periodo)
values('1234', 'Camila', 22, 'GEC', 2); 
insert into aluno(matricula, nome, idade, curso, periodo)
values('4567', 'Marcelo', 25, 'GEB', 3); 
insert into aluno(matricula, nome, idade, curso, periodo)
values('9876', 'Felipe', 19, 'GES', 2);
insert into aluno(matricula, nome, idade, curso, periodo)
values('1594', 'Mariana', 20, 'GEC', 4);
insert into aluno(matricula, nome, idade, curso, periodo)
values('8462', 'Flávio', 26, 'GEA', 6);
insert into aluno(matricula, nome, idade, curso, periodo)
values('4866', 'Maria', 18, 'GEC', 3);

select * from aluno;	# só pra eu visualizar como está a tabela

# B)
update aluno set periodo = 4 where nome = 'Marcelo';

# C)
select * from aluno where curso = 'GEC';

# D)
delete from aluno where nome = 'Mariana';

# E)
select curso from aluno where periodo = 2;

# F)
select nome, idade, curso from aluno where periodo = 3;

# G)
select * from aluno limit 3;

# H)
select nome from aluno where nome like "M_____%";

# I)
select * from aluno where idade > 21;


  

