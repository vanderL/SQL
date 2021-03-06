--DROP DATABASE EMPRESA;

CREATE DATABASE EMPRESA;

USE EMPRESA;

CREATE TABLE EMPREGADO(PNOME VARCHAR(255), MINICIAL CHAR(2), UNOME VARCHAR(255), SSN INTEGER NOT NULL, DATANASC DATE, ENDERECO VARCHAR(255), SEXO CHAR(2), SALARIO DECIMAL(10,2), SUPERSSN INTEGER, DNO INT NOT NULL, PRIMARY KEY (SSN));

CREATE TABLE DEPARTAMENTO(DNOME VARCHAR(255), DNUMERO INTEGER NOT NULL, GERSSN INTEGER NOT NULL, GERDATAINICIO DATE, PRIMARY KEY (DNUMERO));

CREATE TABLE DEPTO_LOCALIZACOES(DNUMERO INTEGER NOT NULL, DLOCALIZACAO VARCHAR(255), PRIMARY KEY(DNUMERO, DLOCALIZACAO));

CREATE TABLE PROJETO(PJNOME VARCHAR(255), PNUMERO INT NOT NULL, PLOCALIZACAO VARCHAR(255), DNUM INT NOT NULL, PRIMARY KEY(PNUMERO));

CREATE TABLE TRABALHA_EM(ESSN INTEGER NOT NULL, PNO INT NOT NULL, HORAS DECIMAL(3,1), PRIMARY KEY(ESSN, PNO));

CREATE TABLE DEPENDENTE(ESSN INTEGER NOT NULL, NOME_DEPENDENTE VARCHAR(255), SEXO CHAR(1), DATANASC DATE, PARENTESCO VARCHAR(255), PRIMARY KEY(ESSN, NOME_DEPENDENTE));


-- INCLUSÃO DE DADOS EMPREGADO

INSERT INTO EMPREGADO (PNOME, MINICIAL, UNOME, SSN, DATANASC, ENDERECO, SEXO, SALARIO, SUPERSSN, DNO) VALUES ('John', 'B', 'Smith', 123456789, '1995-01-09', '731 Fondren, Houston, TX', 'M', 30000, 333445555, 5);
INSERT INTO EMPREGADO VALUES ('Frankllin', 'T', 'Wong', 333445555, '1955-12-08', '638 Voss, Houston, TX', 'M', 40000, 888665555, 5);
INSERT INTO EMPREGADO VALUES ('Alicia', 'J', 'Zelaya', 999887777, '1968-01-19', '3321 Castle, Spring, TX', 'F', 25000, 987654321, 4);
INSERT INTO EMPREGADO VALUES ('Jennifer', 'S', 'Wallace', 987654321, '1941-06-20', '291 Berry, Bellaire, TX', 'F', 43000, 888665555, 4);
INSERT INTO EMPREGADO VALUES ('Ramesh', 'K', 'Narayan', 666884444, '1962-09-15', '975 Fire Oak, Humble, TX', 'M', 38000, 333445555, 5);
INSERT INTO EMPREGADO VALUES ('Joyce', 'A', 'English', 453453453, '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000, 333445555, 5);
INSERT INTO EMPREGADO VALUES ('Ahmad', 'V', 'Jabbar', 987987987, '1968-03-29', '980 Dallas, Houston, TX', 'M', 25000, 987654321, 4);
INSERT INTO EMPREGADO (PNOME, MINICIAL, UNOME, SSN, DATANASC,ENDERECO,SEXO,SALARIO,DNO) VALUES ('James', 'E', 'Borg', 888665555, '1937-11-10', '450 Stone, Houston, TX', 'M', 55000, 1);

SELECT * FROM EMPREGADO;

-- INCLUSÃO DE DADOS DEPARTAMENTO
INSERT INTO DEPARTAMENTO VALUES ('Pesquisa', 5, 333445555, '1988-05-22');
INSERT INTO DEPARTAMENTO VALUES ('Administração', 4, 987654321, '1995-01-01');
INSERT INTO DEPARTAMENTO VALUES ('Sede administrativa', 1, 888665555, '1981-06-19');

-- INCLUSÃO DE DADOS DEPTO LOCALIZAÇÕES
INSERT INTO DEPTO_LOCALIZACOES VALUES (1, 'Houston');
INSERT INTO DEPTO_LOCALIZACOES VALUES (4, 'Stafford');
INSERT INTO DEPTO_LOCALIZACOES VALUES (5, 'Bellaire');
INSERT INTO DEPTO_LOCALIZACOES VALUES (5, 'Sugarland');
INSERT INTO DEPTO_LOCALIZACOES VALUES (0,'Houston');

-- INCLUSÃO DE DADOS TRABALHA_EM
INSERT INTO TRABALHA_EM VALUES (123456789, 1, 32.5);
INSERT INTO TRABALHA_EM VALUES (123456789, 2, 7.5);
INSERT INTO TRABALHA_EM VALUES (666884444, 3, 40.0); 
INSERT INTO TRABALHA_EM VALUES (453453453, 1, 20.0);
INSERT INTO TRABALHA_EM VALUES (453453453, 2, 20.0);
INSERT INTO TRABALHA_EM VALUES (333445555, 2, 10.0);
INSERT INTO TRABALHA_EM VALUES (333445555, 3, 10.0);
INSERT INTO TRABALHA_EM VALUES (333445555, 10, 10.0);
INSERT INTO TRABALHA_EM VALUES (333445555, 20, 10.0);
INSERT INTO TRABALHA_EM VALUES (999887777, 30, 30.0);
INSERT INTO TRABALHA_EM VALUES (999887777, 10, 10.0);
INSERT INTO TRABALHA_EM VALUES (987987987, 10, 35.0);
INSERT INTO TRABALHA_EM VALUES (987987987, 30, 5.0);
INSERT INTO TRABALHA_EM VALUES (987654321, 30, 20.0);
INSERT INTO TRABALHA_EM VALUES (987654321, 20, 15.0);
INSERT INTO TRABALHA_EM (ESSN,PNO) VALUES (888665555, 20);

-- INCLUSÃO DE DADOS PROJETO
INSERT INTO PROJETO VALUES('ProdutoX', 1, 'Bellaire', 5);
INSERT INTO PROJETO VALUES('ProdutoY', 2, 'Suharland', 5);
INSERT INTO PROJETO VALUES('ProdutoZ', 3, 'Houston', 5);
INSERT INTO PROJETO VALUES('Automatização', 10, 'Stafford', 4);
INSERT INTO PROJETO VALUES('Reorganização', 20, 'Houston', 1);
INSERT INTO PROJETO VALUES('Novos Benefícios', 30, 'Stafford', 4);

-- INCLUSÃO DE DADOS DEPENDENTE
INSERT INTO DEPENDENTE VALUES(333445555, 'Alice', 'F', '1986-04-05', 'FILHA');
INSERT INTO DEPENDENTE VALUES(333445555, 'Theodore', 'M', '1983-10-25', 'FILHO');
INSERT INTO DEPENDENTE VALUES(333445555, 'Joy', 'F', '1958-05-03', 'CÔNJUGE');
INSERT INTO DEPENDENTE VALUES(987654321, 'Abner', 'M', '1942-02-28', 'CÔNJUGE');
INSERT INTO DEPENDENTE VALUES(123456789, 'Micheal', 'M', '1988-01-04', 'FILHO');
INSERT INTO DEPENDENTE VALUES(123456789, 'Alice', 'F', '1988-12-30', 'FILHA');
INSERT INTO DEPENDENTE VALUES(123456789, 'Elizabeth', 'F', '1967-05-05', 'CÔNJUGE');

-- ALTERAÇÕES NAS TABELAS
ALTER TABLE EMPREGADO ADD FOREIGN KEY (SUPERSSN) REFERENCES EMPREGADO(SSN);

-- ALTER TABLE DEPARTAMENTO ADD FOREIGN KEY(DNUMERO) REFERENCES EMPREGADO(DNO);

ALTER TABLE EMPREGADO ADD FOREIGN KEY (DNO) REFERENCES DEPARTAMENTO(DNUMERO);

ALTER TABLE DEPARTAMENTO ADD FOREIGN KEY(GERSSN) REFERENCES EMPREGADO(SSN);

ALTER TABLE DEPTO_LOCALIZACOES ADD FOREIGN KEY(DNUMERO) REFERENCES DEPARTAMENTO(DNUMERO);

ALTER TABLE PROJETO ADD FOREIGN KEY(DNUM) REFERENCES DEPARTAMENTO(DNUMERO);

ALTER TABLE TRABALHA_EM ADD FOREIGN KEY(ESSN) REFERENCES EMPREGADO(SSN);

ALTER TABLE TRABALHA_EM ADD FOREIGN KEY(PNO) REFERENCES PROJETO(PNUMERO);

ALTER TABLE DEPENDENTE ADD FOREIGN KEY(ESSN) REFERENCES EMPREGADO(SSN); 

SELECT * FROM EMPREGADO WHERE DNO = (SELECT DNUMERO FROM DEPARTAMENTO WHERE DEPARTAMENTO.DNUMERO = 4);
SELECT * FROM EMPREGADO WHERE (DNO = (SELECT DNUMERO FROM DEPARTAMENTO WHERE DEPARTAMENTO.DNUMERO = 4) AND SALARIO > 25000) OR (DNO = (SELECT DNUMERO FROM DEPARTAMENTO WHERE DEPARTAMENTO.DNUMERO = 5) AND SALARIO > 30000);
SELECT PNOME, UNOME, SALARIO FROM EMPREGADO;
SELECT SSN FROM EMPREGADO WHERE DNO = (SELECT DNUMERO FROM DEPARTAMENTO WHERE DNUMERO = 5);
SELECT D.NOME_DEPENDENTE FROM DEPENDENTE D, EMPREGADO E WHERE D.ESSN = E.SSN AND E.SEXO = 'F';
SELECT PNOME, MINICIAL, UNOME FROM EMPREGADO E, DEPARTAMENTO D WHERE D.GERSSN = E.SSN;
SELECT PNOME, ENDERECO FROM EMPREGADO E, DEPARTAMENTO D WHERE D.DNUMERO = E.DNO AND D.DNOME = 'Pesquisa';
SELECT PNUMERO, DNUMERO, UNOME, ENDERECO, DATANASC FROM PROJETO P, DEPARTAMENTO D, EMPREGADO E WHERE P.DNUM = D.DNUMERO AND D.GERSSN = E.SSN AND P.PLOCALIZACAO = 'Stafford';
SELECT PNOME FROM EMPREGADO E WHERE E.SSN NOT IN (SELECT ESSN FROM DEPENDENTE);
SELECT DATANASC, ENDERECO FROM EMPREGADO WHERE PNOME = 'John' AND MINICIAL = 'B' AND UNOME = 'Smith';
SELECT * FROM EMPREGADO WHERE ENDERECO LIKE '%Houston, Tx%';
SELECT * FROM EMPREGADO E WHERE DNO = (SELECT DNUMERO FROM DEPARTAMENTO WHERE DNUMERO = 5) AND SALARIO >= 30000 AND SALARIO <= 40000;
SELECT PNOME FROM EMPREGADO E WHERE E.SSN NOT IN (SELECT ESSN FROM DEPENDENTE);
SELECT SUM(SALARIO) AS 'SOMA_SAL', MAX(SALARIO), MIN(SALARIO), AVG(SALARIO) FROM EMPREGADO E, DEPARTAMENTO D WHERE E.DNO = D.DNUMERO AND DNOME = 'Pesquisa';
SELECT COUNT(*) FROM EMPREGADO;
SELECT COUNT(*) FROM EMPREGADO E, DEPARTAMENTO D WHERE E.DNO = D.DNUMERO AND DNOME = 'Pesquisa';
SELECT DISTINCT(COUNT(*)), SALARIO FROM EMPREGADO GROUP BY SALARIO;
SELECT DNUMERO, COUNT(*), AVG(SALARIO) FROM EMPREGADO E, DEPARTAMENTO D WHERE E.DNO = D.DNUMERO GROUP BY DNOME;
SELECT PNUMERO, PJNOME, COUNT(*) FROM EMPREGADO E, PROJETO P WHERE E.DNO = P.DNUM GROUP BY SSN;