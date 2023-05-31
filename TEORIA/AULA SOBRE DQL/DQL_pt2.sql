# SELECT ENVOLVENDO MAIS DE UMA TABELA
# UM JOIN (OU JUNÇÃO) - USANDO O WHERE
SELECT DNome, PNome
FROM departamento, empregado
WHERE DNumero_Departamento = DNumero;

# UM JOIN - USANDO O INNNER JOIN
SELECT DNome, PNome
FROM departamento INNER JOIN empregado
WHERE DNumero_Departamento = DNumero;
