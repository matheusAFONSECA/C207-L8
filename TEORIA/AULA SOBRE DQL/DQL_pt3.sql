# JOIN COM 3 TABELAS -> envolve as três tabelas porque existe um relacionamento 
# N para M, ou seja, as informações de duas tabelas se relacionam e então surge
# uma tercira tabela que contem as chaves necessárias para fazer o filtro que 
# queremos com o SELECT
SELECT e.PNome, p.PNome
FROM empregado AS e, projeto AS p, trabalha_em AS te
WHERE te.SSN_Empregado = e.SSN AND te.PNumero_Projeto = p.PNumero
