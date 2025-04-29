CREATE DATABASE Cinema;

use cinema;

create table filme(
    id_filme int PRIMARY KEY AUTO_INCREMENT,
    titulo varchar(150) not null,
    duracao_minutos int not null,
    genero varchar (50) not null
);

create table Sessao(
    id_sessao int PRIMARY KEY AUTO_INCREMENT,
    id_filme int not null,
    FOREIGN key (id_filme) references filme(id_filme),
    data_sessao date not NULL,
    horario time not null,
    sala VARCHAR(20) not null,
    capacidade_maxima int not null
);

create table ingresso(
    id_ingresso int PRIMARY key AUTO_INCREMENT,
    id_sessao int not null,
    FOREIGN key (id_sessao) references sessao(id_sessao),
    nome_cliente varchar(100) not null,
    valor_pago  decimal(6,2) not null
);
