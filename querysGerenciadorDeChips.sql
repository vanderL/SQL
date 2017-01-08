# lista todos os chips
SELECT * FROM TB_CHIP; 
# Lista todos os chips com o nome da operadora
SELECT c.*, o.DESCRICAO as operadora_nome from TB_CHIP as c join TB_OPERADORA as o on c.OPERADORA = o.CD_OPERADORA;
SELECT c.*, o.DESCRICAO as OPERADORA from TB_CHIP as c join TB_OPERADORA as o on c.OPERADORA = o.CD_OPERADORA;
# Insere na tabela chip os valores  DDD, TELEFONE, OPERADORA, STATUS
INSERT INTO TB_CHIP (DDD, TELEFONE, OPERADORA, STATUS) values ('85', '985858585', 2, 0);
#Remover o chip pelo o ID
DELETE FROM TB_CHIP WHERE ID_CHIP = 13;
#Atualiza o chip pelo o ID
UPDATE TB_CHIP SET DDD = '85', TELEFONE = '988445522', OPERADORA = 12, STATUS = 0 WHERE ID_CHIP = 13;
#Lista todas as OPERADORAS
SELECT * FROM TB_OPERADORA;
#Seleciona o Chip pelo o ID
SELECT * FROM TB_CHIP WHERE ID_CHIP = 15;
#lista somente dos chips
select DESCRICAO FROM TB_CHIP join TB_OPERADORA on OPERADORA = CD_OPERADORA;
#selecione todos da tabela chip filtrando pelo o telefone especifico.
select * from TB_CHIP where TELEFONE = '857744101';
ALTER TABLE TB_CHIP ADD COLUMN GATEWAY BOOLEAN DEFAULT FALSE;
#selecione a descricao 
select count(DESCRICAO) FROM TB_CHIP join TB_OPERADORA on OPERADORA = CD_OPERADORA;
# inseri dados na tabala chips
insert into TB_CHIP 
(DDD, TELEFONE, OPERADORA, STATUS, GATEWAY, CPF, DATA_ATIVACAO, SALDO)
 values 
 ('85', '988333287', '10', '1', 'true', '04816804387', '2015-07-21', '0');
#seleciona todos os campos da tabela chip juntando com a tb operadora limitando em 10 ocultando os 15 primeiro.
select c.*, o.DESCRICAO as operadora_nome from TB_CHIP as c join TB_OPERADORA as o on c.OPERADORA = o.CD_OPERADORA LIMIT 10 OFFSET 15;
#seleciona todos os campos da tabela chip juntando com a tb operadora limitando em 10 ocultando os 15 primeiro ordernando por ID_CHIP
select c.*, o.DESCRICAO as operadora_nome from TB_CHIP as c join TB_OPERADORA as o on c.OPERADORA = o.CD_OPERADORA ORDER BY ID_CHIP LIMIT 5, 10 ;
select * from TB_CHIP where ID_CHIP = 14;
select count(*) from TB_CHIP where OPERADORA = 12;

#ATUALIZA SALDO EM GRUPO.
update TB_CHIP set SALDO = 8 where OPERADORA = 10 and STATUS != 0 and DDD = 81;
update TB_chip set SALDO = 14 where OPERADORA = 11 and STATUS != 0 and DDD = 85;
update TB_chip set SALDO = 14 where OPERADORA = 11 and STATUS != 0 and DDD = 81;
update TB_chip set SALDO = 14 where OPERADORA = 11 and STATUS != 0 and DDD = 85;
update TB_chip set SALDO = 10 where OPERADORA = 12 and STATUS != 0 and DDD = 85;
update TB_chip set SALDO = 15 where OPERADORA = 13 and STATUS != 0 and DDD = 81;

############## INICIO DA TRIGGER MONITORAMENTO DE AÇÕES ########################

CREATE TABLE TB_MONITORAMENTO_ACOES (
id_user integer(4) primary key auto_increment not null,
acao varchar(50) not null,
usuario varchar(50) not null,
data_acao date
);

CREATE TABLE TB_USUARIO_LOGADO (
id_login integer(2) primary key auto_increment not null,
usuario varchar(50) not null
);

DELIMITER $$
CREATE TRIGGER MONITORAMENTO_ACOES_UPDATE
AFTER UPDATE ON TB_CHIP
FOR EACH ROW BEGIN
DECLARE logado VARCHAR(50);
SELECT usuario into logado FROM TB_USUARIO_LOGADO WHERE id_login = 1;
SET
@usuario = logado,
@data_atual = NOW();
INSERT INTO TB_MONITORAMENTO_ACOES (acao, usuario, data_acao) values ('atualizacao', @usuario, @data_atual);
 END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER MONITORAMENTO_ACOES_DELETE
AFTER DELETE ON TB_CHIP
FOR EACH ROW BEGIN
DECLARE logado VARCHAR(50);
SELECT usuario into logado FROM TB_USUARIO_LOGADO WHERE id_login = 1;
SET
@usuario = logado,
@data_atual = NOW(); 
INSERT INTO TB_MONITORAMENTO_ACOES (acao, usuario, data_acao) values ('remover', @usuario, @data_atual);
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER MONITORAMENTO_ACOES_INSERT
AFTER INSERT ON TB_CHIP
FOR EACH ROW BEGIN
DECLARE logado VARCHAR(50);
SELECT usuario into logado FROM TB_USUARIO_LOGADO WHERE id_login = 1;
SET
@usuario = logado,
@data_atual = NOW();
INSERT INTO TB_MONITORAMENTO_ACOES (acao, usuario, data_acao) values ('Inserção', @usuario, @data_atual);
 END$$
DELIMITER ;


 select count(*) as chips_adicionados from TB_MONITORAMENTO_ACOES WHERE acao = 'Inserção';
 
drop trigger MONITORAMENTO_ACOES_INSERT;
DROP TRIGGER MONITORAMENTO_ACOES_UPDATE;
DROP TRIGGER MONITORAMENTO_ACOES_DELETE;
select * FROM TB_MONITORAMENTO_ACOES;

# Ao fazer login chamará uma função que atualiza a tabela usuario logado.

SELECT * FROM TB_USUARIO_LOGADO;
select * from TB_MONITORAMENTO_ACOES where usuario = 'vander@aptalaser.com.br';
insert into TB_CHIP (DDD, TELEFONE, OPERADORA, STATUS, GATEWAY, CPF, DATA_ATIVACAO, SALDO) values ('01', '85669977', '12', '1', '1', '2003366554', '2015-04-05', 0);


update TB_USUARIO_LOGADO SET usuario = 'ayrton@aptalaser.com.br' where id_login = 1;

# cria lógica de atualização para usuario logado
# Ao fazer login chamará uma função que atualiza a tabela usuario logado.
