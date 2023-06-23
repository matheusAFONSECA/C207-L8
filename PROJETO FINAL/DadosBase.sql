insert into aluno values (1, "GEC", "Virginia Leticia Afonso");
insert into aluno values (2, "GEC", "Lucas Gadbem");
insert into aluno values (1, "GEA", "Marco Antonio");
insert into aluno values (3, "GEC", "Vinicius de Souza");
insert into aluno values (4, "GEC", "Predo Dionisio");
insert into aluno values (5, "GEC", "Predo de Souza");
insert into aluno values (6, "GEC", "Peterson Mendes");
insert into aluno values (2, "GEA", "Predo de Souza");
insert into aluno values (3, "GEA", "Matheus Fonseca");
insert into aluno values (4, "GEA", "Julia Fonseca");
insert into aluno values (5, "GEA", "Virginia Leticia");
insert into aluno values (1, "GEB", "Isadora Auad");
insert into aluno values (2, "GEB", "Samira Castro");

insert into professor values (1, "Daniela Barude");
insert into professor values (2, "Renan Sthel Duque");
insert into professor values (3, "Luis Felipe Godoy");
insert into professor values (4, "Rodrigo Guaracy");
insert into professor values (5, "Renzo");

insert into materia values ("M001", "Matematica", 2);
insert into materia values ("F201", "Física 1", 1);
insert into materia values ("M005", "Calculo 3", 3);
insert into materia values ("M007", "Sinais e Sistemas", 4);
insert into materia values ("C207", "Banco de Dados I", 5);

insert into monitor values (1, "GEC", "M001", 2);
insert into monitor values (4, "GEC", "M007", 4);
insert into monitor values (1, "GEC", "C207", 5);
insert into monitor values (1, "GEB", "F201", 1);

insert into nota(nota_obtida, Alunos_matricula, Alunos_curso,
Materia_idMateria, Materia_Professor_idProfessor) 
values (100, "1", "GEC", "M001", 2);
insert into nota(nota_obtida, Alunos_matricula, Alunos_curso,
Materia_idMateria, Materia_Professor_idProfessor) 
values (80, "1", "GEC", "F201", 1);
insert into nota(nota_obtida, Alunos_matricula, Alunos_curso,
Materia_idMateria, Materia_Professor_idProfessor) 
values (75, "1", "GEA", "M005", 3);
insert into nota(nota_obtida, Alunos_matricula, Alunos_curso,
Materia_idMateria, Materia_Professor_idProfessor) 
values (50, "2", "GEA", "M005", 3);
insert into nota(nota_obtida, Alunos_matricula, Alunos_curso,
Materia_idMateria, Materia_Professor_idProfessor) 
values (70, "5", "GEC", "M007", 4);
insert into nota(nota_obtida, Alunos_matricula, Alunos_curso,
Materia_idMateria, Materia_Professor_idProfessor) 
values (40, "4", "GEC", "F201", 1);
insert into nota(nota_obtida, Alunos_matricula, Alunos_curso,
Materia_idMateria, Materia_Professor_idProfessor) 
values (65, "2", "GEB", "C207", 5);

insert into alunos_has_professor values (1, "GEC", 2);
insert into alunos_has_professor values (2, "GEC", 5);
insert into alunos_has_professor values (1, "GEA", 3);
insert into alunos_has_professor values (1, "GEB", 4);
insert into alunos_has_professor values (4, "GEC", 1);