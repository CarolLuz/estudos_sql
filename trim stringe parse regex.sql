mundo -- split de strings = seleciona qual nome quer pegar. O SQL NÃO É ZERO INDEX.
SELECT name, 
	split_part(name, ',', 1) AS last_name,
	split_part(split_part(name, ',', 2), '. ', 2) AS first_name, 
	split_part(split_part(name, ',', 2), '. ', 1) AS mister 
FROM tb_titanic tt ; 


SELECT name, 
	split_part(name, ',', 1) AS last_name,
	split_part(split_part(name, ',', 2), '. ', 2) AS first_name, 
	split_part(split_part(name, ',', 2), '. ', 1) AS mister,
	LENGTH(split_part(split_part(name, ',', 2), '. ', 1)) AS tamanho,
	CASE
		WHEN trim(split_part(split_part(name, ',', 2), '. ', 1)) = 'Mr'
			THEN 'masculino'
		WHEN trim(split_part(split_part(name, ',', 2), '. ', 1)) = 'Master'
			THEN 'masculino'
		ELSE 'feminino'
	END
FROM tb_titanic tt
ORDER BY mister; 


SELECT
	name,
	ticket,
	concat(name, ticket) AS concat_function,
	name||ticket AS conc_pipe
FROM tb_titanic tt ;


-- replace convencional = tenho que saber a substring que eu quero remover
-- replace com regexp = não preciso saber exatamente a substring, mas tenho que saber como chegar neles
SELECT
	ticket,
	REPLACE(ticket, '(\.|\/)', 'AAAAA') AS replace_conv, -- quero remover o ponto ou a barra
	regexp_replace(ticket, '(\.|\/)', 'AAAAA') AS replace_regex
FROM tb_titanic tt ;  --> esse REPLACE convencional não tá pegando.
	




