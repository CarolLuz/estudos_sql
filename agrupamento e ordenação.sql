-- comandos de agregação
	-- min
	-- max
	-- sum
	-- avg
	-- count
	-- stddev (desvio padrão)

--ordenação de dados
	-- order by

-- agrupamento
	--group BY


SELECT   
	MIN(tep.qtde) AS min_qtde,
	MAX(tep.qtde) AS max_qtde,
	SUM(tep.qtde) AS sum_qtde,
	AVG(tep.qtde) AS avg_qtde,
	COUNT(tep.qtde) AS count_qtde  -- count conta sempre o número de linhas. se passar count (*), ele vai contar a quantidade de linhas da tabela. o mesmo não pode ser feito pra sum, ou os outros, pq é preciso passar qual a coluna.  
FROM tb_entrada_produto AS tep; 


SELECT	-- define AS colunas a serem retornadas.
	SUM(qtde) AS soma
FROM tb_entrada_produto AS tep
WHERE qtde > 40;	-- define AS linhas a serem retornadas


-- cria uma lista com os valores de uma determinada coluna
SELECT array_agg(qtde) AS lista_qtde
FROM tb_entrada_produto tep;


SELECT data_entrada, avg(qtde)  -- o SQL vai entender que é pra agregar pela DATA. poderia ser avg e depois DATA
FROM tb_entrada_produto tep
WHERE qtde > 40
GROUP BY 1;  -- 1 pq é a primeira coluna DO select


SELECT max(data_entrada), min(data_entrada)
FROM tb_entrada_produto tep 


SELECT data_entrada
FROM tb_entrada_produto tep
WHERE data_entrada BETWEEN '2010-01-01' AND '2021-02-01'


SELECT qtde, valor_unitario, data_entrada
FROM tb_entrada_produto tep
ORDER BY data_entrada;  -- por padrão, ordena em ordem crescente


SELECT qtde, valor_unitario, data_entrada
FROM tb_entrada_produto tep
ORDER BY 3;  -- pq é a terceira coluna DO SELECT 


SELECT qtde, valor_unitario, data_entrada
FROM tb_entrada_produto tep
ORDER BY 3 DESC;   -- coloca em ordem decrescente


SELECT qtde, valor_unitario, data_entrada
FROM tb_entrada_produto tep
ORDER BY data_entrada, qtde DESC;   -- ordena primeiro por DATA, depois pela qtde em ordem desc















