CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Aluno` (
  `matricula` INT NOT NULL AUTO_INCREMENT,
  `curso` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`matricula`, `curso`))
;


-- -----------------------------------------------------
-- Table `mydb`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Professor` (
  `idProfessor` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProfessor`))
;


-- -----------------------------------------------------
-- Table `mydb`.`Materia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Materia` (
  `idMateria` VARCHAR(5) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `Professor_idProfessor` INT NOT NULL,
  PRIMARY KEY (`idMateria`, `Professor_idProfessor`),
  INDEX `fk_Materia_Professor1_idx` (`Professor_idProfessor` ASC) VISIBLE,
  CONSTRAINT `fk_Materia_Professor1`
    FOREIGN KEY (`Professor_idProfessor`)
    REFERENCES `mydb`.`Professor` (`idProfessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `mydb`.`Nota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Nota` (
  `idNotas` INT NOT NULL AUTO_INCREMENT,
  `nota_obtida` INT NOT NULL,
  `Alunos_matricula` INT NOT NULL,
  `Alunos_curso` VARCHAR(45) NOT NULL,
  `Materia_idMateria` VARCHAR(5) NOT NULL,
  `Materia_Professor_idProfessor` INT NOT NULL,
  PRIMARY KEY (`idNotas`, `Materia_idMateria`, `Materia_Professor_idProfessor`),
  INDEX `fk_Nota_Alunos_idx` (`Alunos_matricula` ASC, `Alunos_curso` ASC) VISIBLE,
  INDEX `fk_Nota_Materia1_idx` (`Materia_idMateria` ASC, `Materia_Professor_idProfessor` ASC) VISIBLE,
  CONSTRAINT `fk_Nota_Alunos`
    FOREIGN KEY (`Alunos_matricula` , `Alunos_curso`)
    REFERENCES `mydb`.`Aluno` (`matricula` , `curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Nota_Materia1`
    FOREIGN KEY (`Materia_idMateria` , `Materia_Professor_idProfessor`)
    REFERENCES `mydb`.`Materia` (`idMateria` , `Professor_idProfessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `mydb`.`Alunos_has_Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Alunos_has_Professor` (
  `Alunos_matricula` INT NOT NULL,
  `Alunos_curso` VARCHAR(45) NOT NULL,
  `Professor_idProfessor` INT NOT NULL,
  PRIMARY KEY (`Alunos_matricula`, `Alunos_curso`, `Professor_idProfessor`),
  INDEX `fk_Alunos_has_Professor_Professor1_idx` (`Professor_idProfessor` ASC) VISIBLE,
  INDEX `fk_Alunos_has_Professor_Alunos1_idx` (`Alunos_matricula` ASC, `Alunos_curso` ASC) VISIBLE,
  CONSTRAINT `fk_Alunos_has_Professor_Alunos1`
    FOREIGN KEY (`Alunos_matricula` , `Alunos_curso`)
    REFERENCES `mydb`.`Aluno` (`matricula` , `curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alunos_has_Professor_Professor1`
    FOREIGN KEY (`Professor_idProfessor`)
    REFERENCES `mydb`.`Professor` (`idProfessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `mydb`.`Monitor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Monitor` (
  `Aluno_matricula` INT NOT NULL,
  `Aluno_curso` VARCHAR(45) NOT NULL,
  `Materia_idMateria` VARCHAR(5) NOT NULL,
  `Materia_Professor_idProfessor` INT NOT NULL,
  PRIMARY KEY (`Aluno_matricula`, `Aluno_curso`, `Materia_idMateria`, `Materia_Professor_idProfessor`),
  INDEX `fk_Aluno_has_Materia_Materia1_idx` (`Materia_idMateria` ASC, `Materia_Professor_idProfessor` ASC) VISIBLE,
  INDEX `fk_Aluno_has_Materia_Aluno1_idx` (`Aluno_matricula` ASC, `Aluno_curso` ASC) VISIBLE,
  CONSTRAINT `fk_Aluno_has_Materia_Aluno1`
    FOREIGN KEY (`Aluno_matricula` , `Aluno_curso`)
    REFERENCES `mydb`.`Aluno` (`matricula` , `curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aluno_has_Materia_Materia1`
    FOREIGN KEY (`Materia_idMateria` , `Materia_Professor_idProfessor`)
    REFERENCES `mydb`.`Materia` (`idMateria` , `Professor_idProfessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;
