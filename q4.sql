# VIEW QUE FAZ UMA BUSCA EM RELAÇÃO A PESSOAS QUE FIZERAM COMPRAS ACIMA DE 500 REAIS E SÃO DE SÃO PAULO
CREATE VIEW compraSaoPaulo500 AS (
	SELECT co.nomeProduto 'Nome do Produto', co.precoKG 'Preco do KG', co.peso 'Peso', 
    co.precoTotal 'Preço Total', cl.nome 'Nome do Cliente', cl.cidade 'Cidade do cliente', 
    cl.saldo 'Saldo do cliente'
    FROM compra co, cliente cl
    WHERE co.precoTotal > 500 AND cl.cidade like "São Paulo" AND cl.id = co.idCliente
);

SELECT * FROM compraSaoPaulo500;
