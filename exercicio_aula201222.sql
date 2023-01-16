SELECT
	avg(tep.valor_unitario) AS median_qtde,
	max(tep.qtde) AS max_qtde,
	data_entrada
FROM tb_entrada_produto AS tep
GROUP BY 3;


SELECT
	avg(tep.valor_unitario) AS median_qtde,
	data_entrada
FROM tb_entrada_produto AS tep
WHERE valor_unitario > 5
GROUP BY 2;


SELECT
	min(tbp.estoque_minimo) AS min_estoque,
	status
FROM tb_produto AS tbp
GROUP BY 2;

SELECT
	estoque_maximo,
	status
FROM tb_produto AS tbp
ORDER BY status ASC, estoque_maximo DESC;


SELECT
	status,
	sum(tbp.estoque_minimo) AS soma_estoque_minimo
FROM tb_produto AS tbp
GROUP BY 1
ORDER BY 2 DESC;




