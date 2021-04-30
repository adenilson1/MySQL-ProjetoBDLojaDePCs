/*Atividade de Avaliacao */

/*1 - crie um schema
 de banco de dados chamado Computacao_SeuNome:*/

 DROP DATABASE LOJA_PC;

 SHOW DATABASES;

 CREATE DATABASE LOJA_PC;

  SHOW DATABASES;

 USE LOJAPC;

 SHOW DATABASES;

 SHOW TABLES;



/* 2 - crie as tabelas desse banco de dados definindo
os campos para chaves primária e estrangeira
(observe as cardinalidades do modelo):*/

#MAQUINA
CREATE TABLE Maquina (
	idMaquina INT PRIMARY KEY AUTO_INCREMENT,
	tipo VARCHAR(20) NOT NULL,
	velocidade_Ghz DECIMAL(5,2) NOT NULL,
	hardDisk_GB DECIMAL(7,2) NOT NULL,
	placaDeRede_Mbs DECIMAL(7,2) NOT NULL,
	memoriaRam_GB DECIMAL(5,2) NOT NULL
);

DESC Maquina;

#USUARIO
CREATE TABLE Usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
	password VARCHAR(20) NOT NULL,
	nomeUsuario VARCHAR(50) NOT NULL,
	ramal INT NOT NULL,
	especialidade VARCHAR(30) NOT NULL
);
DESC Usuario;


#SOFTWARE
CREATE TABLE Software (
	idSoftware INT PRIMARY KEY AUTO_INCREMENT,
	produto VARCHAR(20) NOT NULL,
	hardDisk_GB DECIMAL(5,2) NOT NULL,
	memoriaRam_GB DECIMAL(7,2) NOT NULL
);
DESC Software;

#POSSUEM
CREATE TABLE Possuem (
	idMaquina_fk INT,
	idUsuario_fk INT,
	CONSTRAINT fk_Maquina_1 FOREIGN KEY (idMaquina_fk)
	REFERENCES Maquina(idMaquina),
	CONSTRAINT fk_Usuario FOREIGN KEY (idUsuario_fk)
	REFERENCES Usuario (idUsuario)

);
DESC Possuem;

#CONTEM
CREATE TABLE Contem (
	idMaquina_fk INT,
	idSoftware_fk INT,
	CONSTRAINT fk_Maquina_2 FOREIGN KEY (idMaquina_fk)
	REFERENCES Maquina (idMaquina),
	CONSTRAINT fk_Software FOREIGN KEY (idSoftware_fk)
	REFERENCES Software (idSoftware)
);

DESC Contem;

/* 3 - insira dados nas tabelas (dê uma passada pelo
contexto das outras questões a fim de verificar
alguns dados específicos e inserir em sua tabela):*/

#INSERIR DADOS NA MAQUINA

INSERT INTO Maquina (tipo, velocidade_Ghz, hardDisk_GB,
placaDeRede_Mbs,memoriaRam_GB)
VALUES
('Core i7', 4.8,1000,300,16),
('Celeron N4500', 2.8,500,10,2),
('AMD V2748', 2.4,570,100,4),
('Core i5', 4.2,1000,10,4),
('Core 2 Duo',2.0,500,1000,2),
('Core i3', 4.1,250,2500,2),
('Pentium N6005', 3.3,1000,10,4),
('Pentium J5040', 3.2,500,300,2),
('COre i3', 4.3,300,100,4),
('Core i5', 3.0,500,2500,8),
('Core 2 Duo', 1.6,250,5000,2),
('Core i3', 3.9,500,100,2),
('Core i5', 4.4,300,5000,8),
('Pentium G5650', 4.0,500,10,4),
('Celeron N4505', 2.9,500,100,2),
('Core i7', 4.6,500,5000,8),
('AMD V2718', 1.7,300,1000,2),
('Core i3', 4.2,500,100,2),
('AMD V2546', 3.0,300,300,8),
('AMD V2516', 2.1,500,10,2);

SELECT * FROM Maquina;

/* 3 - insira dados nas tabelas (dê uma passada pelo contexto das outras questões a fim de verificar
alguns dados específicos e inserir em sua tabela):*/

#INSERIR DADOS EM USUARIO

INSERT INTO Usuario(password, nomeUsuario, ramal,
especialidade)
VALUES
('da1137','David',123456781,'Auxiliar Financeiro'),
('004ke02','Kelly',123456782,'Tecnico Programador'),
('ed11son3','Edson',123456783,'Tecnico Informatica'),
('ga213bri00','Gabrielly',123456782,'Auxiliar RH'),
('17mar081','Marcos',123456781,'Tecnico RH'),
('76clau135','Claudia',123456781,'Tecnico Administrativo'),
('ale081a4','Alessandra',123456783,'Tecnico Manutenção'),
('51ana17','Ana',123456783,'Auxiliar de Manutenção'),
('21rute60','Rute',123456781,'Tecnico Programador'),
('02lu70cas','Lucas',123456783,'Tecnico de Manutenção'),
('ra007mundo','Raimundo',123456781,'Tecnico Informatica'),
('007nardy173','Nardy',123456781,'Auxliar Financeiro');

SELECT * FROM Usuario;

#INSERIR DADOS SOFTWARE

INSERT INTO Software (produto, hardDisk_GB, memoriaRam_GB)
VALUES
('C++',0.05,1),
('Workbench',0.3,2),
('NetBeans',0.5,4),
('Ubuntu',1.5,4),
('Microsoft Windows 7',1.5,4),
('AutoCad',16,8),
('Microsoft Office 10',3.5,0.3),
('Eclipse',0.5,4),
('Oracle',12,2),
('SolidWork',5,8),
('Visual Studio',5,8),
('Lotus',0.4,1);

SELECT * FROM Software;

#INSERIR DADOS POSSUEM

INSERT INTO Possuem(idUsuario_fk, idMaquina_fk)
VALUES
(1,10),
(6,6),
(9,20),
(2,14),
(8,7),
(2,5),
(3,5),
(1,15),
(3,16),
(5,11),
(4,1),
(9,2),
(5,8),
(3,17),
(6,7),
(4,7),
(10,13),
(7,14),
(8,9),
(1,13),
(8,8),
(9,19),
(7,3),
(2,2),
(10,12),
(5,18);

SELECT * FROM Possuem;

#INSERIR DADOS CONTEM

INSERT INTO Contem (idMaquina_fk, idSoftware_fk)
VALUES
(1,5),(1,6),(1,2),(1,7),(1,10),
(2,4),(2,1),(2,9),(2,8),(2,8),
(3,4),(3,6),(3,11),(3,1),(3,2),
(4,5),(4,3),(4,2),(4,7),(4,6),(4,12),
(5,5),(5,11),(5,10),(5,1),(5,9),
(6,4),(6,2),(6,8),(6,10),(6,8),
(7,5),(7,7),(7,3),(7,11),(7,2),(7,12),
(8,5),(8,2),(8,7),(8,1),(8,10),(8,12),
(9,4),(9,9),(9,6),(9,3),(9,11),(9,12),
(10,5),(10,1),(10,7),(10,8),(10,8),
(11,5),(11,7),(11,11),(11,2),(11,1),
(12,4),(12,9),(12,11),(12,6),(11,2),(11,12),
(13,4),(13,1),(13,9),(13,3),(13,2),(12,12),
(14,5),(14,6),(14,11),(14,7),(14,10),
(15,4),(15,2),(15,8),(15,10),(15,3),
(16,5),(16,7),(16,1),(16,8),(16,10),
(17,4),(17,2),(17,11),(17,10),(17,1),(17,12),
(18,5),(18,7),(18,9),(18,2),(18,8),
(19,4),(19,6),(19,10),(19,9),(19,8),
(20,11),(20,10),(20,5),(20,1),(20,7);

SELECT * FROM Contem;

#TESTE

SELECT u.nomeUsuario, m.tipo, s.produto
FROM Usuario u INNER JOIN Possuem p 
ON (u.idUsuario = p.idUsuario_fk)
INNER JOIN Maquina m ON (m.idMaquina = p.idMaquina_fk)
INNER JOIN Contem c ON (c.idMaquina_fk = m.idMaquina)
INNER JOIN Software s ON (s.idSoftware = c.idSoftware_fk)
WHERE u.idUsuario = 4;

/* 4 - Realize uma consulta que traga todos os atributos 
de Usuários cuja especialidade é igual a
técnico.*/

SELECT nomeUsuario, password, ramal, especialidade
FROM Usuario
WHERE especialidade LIKE 'Tecnico%';


/* 5 - Realize uma consulta que traga todos os tipos e 
velocidades das máquinas.*/

SELECT tipo, velocidade_Ghz AS GHZ 
FROM Maquina
ORDER BY tipo;

/* 6 - Realize uma consulta que traga todos os tipos e
velocidades dos computadores dos tipos Core II e
Pentium*/

SELECT tipo, velocidade_Ghz AS GHZ 
FROM Maquina 
WHERE tipo LIKE 'Core 2%'
OR tipo LIKE 'Pentium%'
ORDER BY tipo;

/* 7 - Realize uma consulta que traga a identificação, o
tipo dos computadores e a taxa de transmissão
da placa de rede, para máquinas com placa de rede com
taxa maior que 10Mb/s.*/

SELECT idMaquina AS ID, tipo AS COMPUTADOR,
placaDeRede_Mbs AS TAXA_TRANSMISSAO
FROM Maquina
WHERE placaDeRede_Mbs > 10;

/* 8 - Realize uma consulta que traga os nomes dos usuários
que utilizam computadores do tipo Core III
e Core V.*/

SELECT u.nomeUsuario AS USUARIO,
m.tipo AS TIPO FROM Usuario u
INNER JOIN Possuem p ON (u.idUsuario = p.idUsuario_fk)
INNER JOIN Maquina m ON (p.idMaquina_fk = m.idMaquina)
WHERE m.tipo LIKE 'Core i3%'
OR m.tipo LIKE 'Core i5%'
ORDER BY u.nomeUsuario;


/* 9 - Realize uma consulta que traga a identificação das
máquinas com C++ instalado8*/

SELECT m.idMaquina AS ID, m.tipo AS MAQUINA,
s.produto AS SOFTWARE FROM Maquina m
INNER JOIN Contem c ON (m.idMaquina = c.idMaquina_fk)
INNER JOIN Software s ON (s.idSoftware = c.idSoftware_fk)
WHERE s.produto = 'C++';

/* 10 - Realize uma consulta que traga o número total de
máquina com velocidade maior do que 2,4
GHz*/

SELECT COUNT(idMaquina) AS TOTAL_MAQUINAS
FROM Maquina WHERE velocidade_Ghz > 2.4;

/* 12 - Realize uma consulta que traga a quantidade de
 disco rígido necessária para instalar Word e
Lotus juntos na mesma máquina: */



SELECT SUM(hardDisk_GB) AS QUANTIDADE_HD
FROM Software
WHERE produto = 'Microsoft Office 10'
OR produto = 'Lotus';


/* 13 - Realize uma consulta que traga os
 produtos que que contenham a letra “o” no meio do nome*/

 SELECT produto FROM Software
 WHERE produto LIKE '%_o_%';


/* 14 - Realize uma consulta que traga a relação
 dos produtos instalados em pelo menos uma máquina.*/


SELECT tipo, produto FROM Software
INNER JOIN Contem ON (idSoftware_fk = idSoftware)
INNER JOIN Maquina ON (idMaquina_fk = idMaquina)
ORDER BY idMaquina;


/* 15 - Realize uma consulta que traga
 o id e o nome dos usuários, ordenados pelo nome.*/
 
SELECT idUsuario AS ID, nomeUsuario AS USUARIO
FROM Usuario 
ORDER BY nomeUsuario; 

 
/* 16 – Exclua da tabela Software aqueles
 com Hard-Disk menor do que 200MB.*/

 #200 MB é 0.2 GB

 SELECT * FROM Software;

#DESABILITAR CONSTRAINS
SET FOREIGN_KEY_CHECKS=0
#DELETAR
DELETE FROM Software WHERE hardDisk_GB < 0.2;
#HABLITAR CONSTRAINS
SET FOREIGN_KEY_CHECKS=1;

/* 17 - construa uma função que permita aumentar 
a capacidade de memória RAM. A função deve
receber o tipo da máquina e % do valor de aumento
 como parâmetro:*/

 SELECT * FROM Maquina;

 DELIMITER $

 CREATE FUNCTION fn_aumentaCapacidadeRAM(id INT, 
 taxa DECIMAL(5,2))
 RETURNS DECIMAL(5,2) READS SQL DATA 
 BEGIN
 	DECLARE valor DECIMAL(5,2);
 	SELECT Maquina.memoriaRam_GB FROM Maquina
 	WHERE Maquina.idMaquina= id INTO valor;
 	RETURN valor * (taxa/100);

END $

DELIMITER ;

SELECT fn_aumentaCapacidadeRAM(1,30) AS AUMENTO_DE_RAM;

/* 18 - construa uma View que retorne a identificação das
 máquinas, sua quantidade de memória RAM,
o produto e a sua quantidade memória RAM necessária dos
produtos que não podem rodar, devido à
quantidade exigida dessa RAM:*/

CREATE VIEW vw_retornaAtributosMaquina AS

SELECT m.idMaquina AS ID, m.memoriaRam_GB AS
QUANTIDADE_RAM_MAQUINA, s.produto AS PRODUTO,
s.memoriaRam_GB AS MEMORIA_RAM_NECESSARIA 
FROM Maquina m INNER JOIN Contem c 
ON  (c.idMaquina_fk = m.idMaquina)
INNER JOIN Software s ON (c.idSoftware_fk = s.idSoftware)
WHERE  s.memoriaRam_GB > m.memoriaRam_GB
ORDER BY m.idMaquina;

SELECT * FROM vw_retornaAtributosMaquina;

