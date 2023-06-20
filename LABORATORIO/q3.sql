# TRIGGER QUE REALIZA UMA ATUALIZAÇÃO QUANTO AO SALDO DO CLIENTE
DELIMITER $$
CREATE TRIGGER updateSaldo BEFORE INSERT
ON compra
FOR EACH ROW
BEGIN
UPDATE cliente SET saldo = saldo - (compra.peso * compra.precoKG) WHERE id = compra.idCliente;
END; $$
DELIMITER ;

CALL insere_e_calcula_peso("Alcatra", 80, 7, 1);

DROP TRIGGER updateSaldo;