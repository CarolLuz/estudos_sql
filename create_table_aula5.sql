DROP TABLE IF EXISTS tb_titanic;
CREATE TABLE tb_titanic (
	passengerid INTEGER,
	survived INTEGER,
	pclass INTEGER,
	name VARCHAR(100),
	sex VARCHAR(10),
	sibsp INTEGER,
	parch VARCHAR(50),
	ticket VARCHAR(30),
	fare NUMERIC,
	embarked VARCHAR(10)
);

COPY tb_titanic(
	passengerid, survived,
	pclass, name, sex, sibsp,
	parch, ticket, fare, embarked)
FROM
    -- caminho absoluto do arquivo .csv
	'/home/joelson/Documentos/LetsCode/aulas/Banco de Dados/titanic.csv'
DELIMITER ';'
CSV HEADER;

SELECT * FROM tb_titanic tt;
