# DEFINE O BD QUE IREMOS USAR
USE empresabd;

# BUSCAR DIFERENTES TIPOS DE PARENTESCO NA TABELA DEPENDENTE
SELECT DISTINCT parentesco FROM dependente;

# BUSCANDO O ULTIMO NOME, DATA_NASC DOS EMPREGADOS HOMENS DO MAIS VELHOS PARA OS MAIS NOVOS
SELECT UNome, DataNasc FROM empregado WHERE Sexo = 1 ORDER BY DataNasc ASC;

# BUSCANDO O PRIMEIRO NOME DO DEPENDENTE E DO RESPONSAVEL
SELECT dep.Nome_Dependente, emp.PNome
FROM Empregado AS emp, Dependente AS dep
WHERE dep.SSN_Empregado = emp.SSN;

# BUSCANDO A MEDIA SALARIAL DE TODOS OS EMPREGADOS QUE RESIDEM EM SÃO PAULO E TRABALHAM NO DEP. DE ENGENHARIA
SELECT AVG(emp.salario) as "Média Salarial"
FROM Empregado AS emp, departamento AS dep
WHERE dep.DNome like "Engenharia" and emp.Endereco like "%São Paulo";

# BUSCANDO O NOME DO SUPERVISOR, O PRIMEIRO NOME DOS EMPREGADOS QUE ELE GERENCIA E A DIFERENÇA SALARIAL
SELECT sup.PNome AS "Surpervisor", emp.PNome AS "Empregado", emp.salario - sup.Salario AS "Diferença Salarial"
FROM Empregado AS emp, Empregado AS sup 
WHERE emp.SSN_Supervisor = sup.SSN;

# BUSCANDO O NOME DO EMPREGADO, NOME DOS PROJETO QUE ELE TRABALHA E AS HORAS QUE ELE GASTA EM CADA UM
SELECT emp.PNome AS "Nome do empregado", pro.PNome AS "Nome do projeto", tra.Horas AS "Horas"
FROM Empregado AS emp, projeto AS pro, trabalha_em AS tra
WHERE tra.SSN_Empregado = emp.SSN AND tra.PNumero_Projeto = pro.PNumero;


