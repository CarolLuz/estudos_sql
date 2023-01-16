CREATE TABLE produtos (
	id INTEGER NOT NULL,  -- diferente DO serial pq o usuário vai ser responsável pelo auto-incremento da pk
	nome_produto VARCHAR(100),
	valor_produto NUMERIC(16,2),
	data_compra DATE,
	PRIMARY KEY (id)
);


SELECT * FROM produtos;

INSERT INTO produtos (id, nome_produto, valor_produto, data_compra)
VALUES (1, 'Smartphone Moto G30', 1200.40, '19-12-2022');

-- quando eu digo que a chave é primária, ela automaticamente é not null, não precisa colocar
-- se eu adiciono um novo elemento com a mesma chame primária, dá erro

INSERT INTO produtos (id, nome_produto, valor_produto, data_compra)
VALUES (2, 'Smart TV Roku Led Hd 32"', 1114.00, '11-12-2022');

SELECT regexp_match (nome_produto, '\d+') FROM produtos;

INSERT INTO produtos (id, nome_produto, valor_produto, data_compra)
VALUES (6, 'Cadeira Plástico com braço Iguape Tramontina', 113.85, '08-07-2020')

-- passar default pra algum campo sem restrição funciona, o valor fica nulo.

INSERT INTO produtos DEFAULT VALUES;
-- esse comento não funciona pq o id não pode ser nulo/default

INSERT INTO produtos(id) VALUES (10);

-- ATUALIZAR DADOS NAS LINHAS DA TABELA
-- alter table = alterar nome das colunas, inserir uma coluna, excluir uma coluna
-- pra alterar dentro da tabela = update
UPDATE produtos SET valor_produto = 100.00 WHERE id = 10;

UPDATE produtos SET valor_produto = 400.00
WHERE nome_produto LIKE 'Smart%' AND valor_produto < 1200;

UPDATE produtos SET valor_produto = 300.00, nome_produto = 'TV'
WHERE valor_produto < 1200;

UPDATE produtos SET valor_produto = (SELECT avg(valor_produto) FROM produtos), nome_produto = 'TV2'
WHERE valor_produto < 1200;

-- CREATE TABLE DA TABELA
CREATE TABLE produtos_bkup AS SELECT * FROM produtos;
SELECT * FROM produtos_bkup;

WITH produtos_nao_nulos AS (
	SELECT * FROM produtos WHERE valor_produto IS NOT NULL	
)
SELECT * FROM produtos_nao_nulos;  -- tem que ser o SELECT logo embaixo, se não dá erro. aqui não está criando uma tabela, tá fazendo uma subquery

-- alterar tabela
ALTER TABLE produtos ADD nome_fabricante VARCHAR(100);
SELECT * FROM produtos;

ALTER TABLE produtos DROP nome_fabricante;
SELECT * FROM produtos;

ALTER TABLE produtos ADD nome_fabricante VARCHAR(100) DEFAULT 'Motorola';
SELECT * FROM produtos;

ALTER TABLE produtos ALTER COLUMN valor_produto SET DEFAULT 1.00;
SELECT * FROM produtos;


