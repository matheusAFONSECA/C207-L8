ALTER TABLE nota
DROP FOREIGN KEY fk_Nota_Alunos;

ALTER TABLE nota
ADD CONSTRAINT fk_Nota_Alunos
FOREIGN KEY (Alunos_matricula, Alunos_curso)
REFERENCES aluno (matricula, curso)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE monitor
DROP FOREIGN KEY fk_Aluno_has_Materia_Aluno1;

ALTER TABLE monitor
ADD CONSTRAINT fk_Aluno_has_Materia_Aluno1
FOREIGN KEY (Aluno_matricula, Aluno_curso)
REFERENCES aluno (matricula, curso)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE materia
DROP FOREIGN KEY fk_Materia_Professor1;

ALTER TABLE materia
ADD CONSTRAINT fk_Materia_Professor1
FOREIGN KEY (Professor_idProfessor)
REFERENCES professor (idProfessor)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE nota
DROP FOREIGN KEY fk_Nota_Materia1;

ALTER TABLE nota
ADD CONSTRAINT fk_Nota_Materia1
FOREIGN KEY (Materia_idMateria, Materia_Professor_idProfessor)
REFERENCES materia (idMateria, Professor_idProfessor)
ON DELETE CASCADE
ON UPDATE CASCADE;
