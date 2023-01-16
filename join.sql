SELECT * FROM produtos p ;

SELECT * FROM vendas v LIMIT 20;


SELECT
	"Codigo",
	count(*) AS n_vendas
	FROM vendas v
GROUP BY 1
ORDER BY 1 DESC;


-- JOIN (inner, left, right...)

SELECT
	v."Order ID",
	v."Date",
	p."Produto",
	v."Codigo",
	v."Courier Status"
FROM vendas v 
INNER JOIN produtos p 
	ON v."Codigo" = p."Codigo"
	

SELECT 
	count(*)
FROM vendas v 
INNER JOIN produtos p 
	ON v."Codigo" = p."Codigo"
	

SELECT DISTINCT "Produto" FROM produtos p 

------------------------------------------------------------------

ALTER TABLE produtos ADD marca VARCHAR(100);

SELECT * FROM produtos p 

UPDATE produtos SET marca = split_part("Produto", ' ', 1);

UPDATE produtos p SET marca = NULL
WHERE "Codigo" = "BS001889";


