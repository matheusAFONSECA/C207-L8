# FUNCTION QUE RETORNA O PREÇO TOTAL COM DESCONTO
DELIMITER $$
DROP FUNCTION IF EXISTS preco_total_com_desconto $$
CREATE FUNCTION preco_total_com_desconto(precoKG FLOAT, peso FLOAT) RETURNS FLOAT 
DETERMINISTIC
BEGIN
	RETURN precoKG * peso * 0.9;
END $$
DELIMITER ;

SELECT preco_total_com_desconto(35, 3) AS PrecoComDesconto;