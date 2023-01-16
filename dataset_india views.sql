ALTER TABLE python_tb_credit_card
RENAME COLUMN "Card Type" TO card_type;

ALTER TABLE python_tb_credit_card
RENAME COLUMN "Exp Type" TO exp_type;

-- quantos tipos de cartão temos
SELECT
	DISTINCT ptcc.card_type
FROM python_tb_credit_card ptcc;

-- quantas cidades temos
SELECT
	DISTINCT "City"
FROM python_tb_credit_card ptcc;

-- quantos tipos de gastos temos
SELECT
	DISTINCT ptcc.exp_type
FROM python_tb_credit_card ptcc;

--média de compras por categoria do cartão
SELECT
	card_type,
	round(avg("Amount")) AS average_amount,
	round(stddev("Amount"), 2) AS deviation
FROM python_tb_credit_card
GROUP BY card_type
ORDER BY average_amount;

-- criar uma tabela a partir do SELECT
CREATE TABLE card_average_amount AS (
SELECT
	card_type,
	round(avg("Amount")) AS average_amount,
	round(stddev("Amount"), 2) AS deviation
FROM python_tb_credit_card
GROUP BY card_type
ORDER BY average_amount
); 

SELECT * FROM card_average_amount;

-- criar um view a partir do select. parece uma tabela, mas não propriamente. o view vai criar sempre um select da tabela original, o que significa que se a tabela é atualizada, o view tbm é.
CREATE VIEW card_average_amount_view AS (
SELECT
	card_type,
	round(avg("Amount")) AS average_amount,
	round(stddev("Amount"), 2) AS deviation
FROM python_tb_credit_card
GROUP BY card_type
ORDER BY average_amount
); 

-- perfil de consumo por região
SELECT
	"City",
	exp_type,
	card_type,
	round(avg("Amount"), 2) AS median_amount,
	count(*) AS transaction_count
FROM python_tb_credit_card 
GROUP BY "City", exp_type, card_type
ORDER BY "City", exp_type;


-- view perfil compras região
CREATE VIEW perfil_compras AS (
SELECT
	"City",
	exp_type,
	card_type,
	round(avg("Amount"), 2) AS median_amount,
	count(*) AS transaction_count
FROM python_tb_credit_card 
GROUP BY "City", exp_type, card_type
ORDER BY "City", exp_type
);

-- número de transações por dia
SELECT
	DISTINCT date("Date") AS data
FROM python_tb_credit_card
ORDER BY 1;

SELECT
	date("Date") AS DATA,
	count(*) AS numero_transacoes,
	max("Amount") AS valor_max_transacao
FROM python_tb_credit_card 
WHERE date("Date") BETWEEN "2015-01-01" AND "2015-01-31"
GROUP BY 1
ORDER BY 1;

CREATE VIEW pico_transacoes AS (
SELECT date(t."Date") AS data,
	count(*) AS numero_transacoes,
	max(t."Amount") AS valor_maximo_transacao
FROM python_tb_credit_card AS t
WHERE date(t."Date") BETWEEN '2015-01-01' AND '2015-01-31'
GROUP BY 1
ORDER BY 1
);





