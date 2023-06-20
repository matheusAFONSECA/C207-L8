# PROCEDURE QUE FAZ A INSERÇÃO DE ELEMENTOS NA TABELA COMPRA
DELIMITER $$
DROP PROCEDURE IF EXISTS insere_e_calcula_peso $$
CREATE PROCEDURE insere_e_calcula_peso(IN nomeProduto VARCHAR(45), IN precoKG FLOAT, IN peso FLOAT, IN idCliente INT)
BEGIN
	DECLARE precoTotal FLOAT;

	IF peso > 5
		THEN SET @pesoTotal = @pesoTotal + peso;
	END IF;
    
    SET precoTotal = precoKG * peso;
    
    INSERT INTO compra VALUE (default, nomeProduto, precoKG, peso, precoTotal, idCliente); 
END $$
DELIMITER ;

CALL insere_e_calcula_peso("Carne", 30, 2, 1);
CALL insere_e_calcula_peso("Frango", 20, 7, 3);
CALL insere_e_calcula_peso("Picanha", 100, 6, 2);

SELECT @pesoTotal;