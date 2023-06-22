insert into aluno values (1, "GEC", "Virginia Leticia Afonso");
insert into aluno values (2, "GEC", "Lucas Gadbem");
insert into aluno values (1, "GEA", "Marco Antonio");

insert into professor values (1, "Daniela Barude");
insert into professor values (2, "Renan Sthel Duque");
insert into professor values (3, "Luis Felipe Godoy");

insert into materia values ("M001", "Matematica", 2);
insert into materia values ("F201", "Física 1", 1);
insert into materia values ("M005", "Calculo 3", 3);

insert into monitor values (1, "GEC", "M001", 2);
insert into monitor values (2, "GEC", "M001", 2);

insert into nota(nota_obtida, Alunos_matricula, Alunos_curso,
Materia_idMateria, Materia_Professor_idProfessor) 
values (100, "1", "GEC", "M001", 2);
insert into nota(nota_obtida, Alunos_matricula, Alunos_curso,
Materia_idMateria, Materia_Professor_idProfessor) 
values (80, "1", "GEC", "F201", 1);
insert into nota(nota_obtida, Alunos_matricula, Alunos_curso,
Materia_idMateria, Materia_Professor_idProfessor) 
values (75, "1", "GEA", "M005", 3);