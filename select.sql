SELECT
	e.id,
	e.nome,
	e.uf
	
FROM tb_estado AS e WHERE e.uf LIKE '%R%';


SELECT
	e.id,
	e.nome,
	e.uf
	
FROM tb_estado AS e WHERE e.uf ILIKE 'r%';


SELECT * FROM tb_estado te 