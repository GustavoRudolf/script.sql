-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE tipo_usuario (
cod_tipuser int PRIMARY KEY,
desc_tipuser varchar(250) NOT NULL
);

CREATE TABLE midia (
titulo_midia varchar(100) NOT NULL,
caminho_midia varchar(250) NOT NULL,
cod_midia int PRIMARY KEY,
cod_postagem int
);

CREATE TABLE ong (
email_ong varchar(250) NOT NULL,
telefone_ong varchar(14) NOT NULL,
nome_ong varchar(100) NOT NULL,
cod_ong int PRIMARY KEY
);

CREATE TABLE usuario (
idade int NOT NULL,
nome varchar(250) NOT NULL,
email varchar(250) NOT NULL,
cod_usuario int PRIMARY KEY,
telefone varchar(14) NOT NULL,
cod_tipuser int,
FOREIGN KEY(cod_tipuser) REFERENCES tipo_usuario (cod_tipuser)
);

CREATE TABLE postagem (
titulo_postagem varchar(100) NOT NULL,
categoria varchar(100) NOT NULL,
cod_postagem int PRIMARY KEY,
texto_postagem varchar(1000) NOT NULL,
cod_usuario int,
cod_ong int,
FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario),
FOREIGN KEY(cod_ong) REFERENCES ong (cod_ong)
);

CREATE TABLE comenta (
cod_postagem int,
cod_usuario int,
dathora_coment timestamp NOT NULL,
texto_coment varchar(250) NOT NULL,
FOREIGN KEY(cod_postagem) REFERENCES postagem (cod_postagem),
FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario)
);

CREATE TABLE curtir (
cod_postagem int,
cod_usuario int,
dathora_curtir timestamp NOT NULL,
FOREIGN KEY(cod_postagem) REFERENCES postagem (cod_postagem),
FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario)
);

CREATE TABLE doacao (
cod_ong int,
cod_usuario int,
dt_doacao date NOT NULL,
valor_doacao decimal(10,2) NOT NULL,
FOREIGN KEY(cod_ong) REFERENCES ong (cod_ong),
FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario)
);

CREATE TABLE voluntario (
cod_ong int,
cod_usuario int,
dt_voluntario date NOT NULL,
FOREIGN KEY(cod_ong) REFERENCES ong (cod_ong),
FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario)
);

ALTER TABLE midia ADD FOREIGN KEY(cod_postagem) REFERENCES postagem (cod_postagem);
