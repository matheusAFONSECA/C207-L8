# DISTINCT
SELECT DISTINCT SSN_Supervisor
FROM empregado;

# FAZENDO O DISTINCT COM UM AUTORELACIONAMENTO DE UMA TABELA
# AUTORELACIONAMENTO ->  uma tabela que se auto relaciona
SELECT DISTINCT s.Pnome
FROM empregado AS e, empregado AS s
WHERE s.SSN = e.SSN_Supervisor;