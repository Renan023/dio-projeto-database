create database oficina
default character set utf8
default collate utf8_general_ci;

use oficina;

create table cliente (
ID_cliente int not null auto_increment primary key,
Nome varchar(20) not null,
Sobrenome varchar(15) not null,
Endereço varchar(45) not null, 
CPF char(11) not null,
Tel char(10) not null,
Aprovação enum('aprovado','cancelado') default 'aprovado' not null
) default charset=utf8;

create table veiculo(
ID_Veiculo int not null auto_increment primary key,
Cliente int not null,
Equipe int not null,
Pedido int not null,
Modelo varchar(6) not null, 
Marca varchar(10) not null,
Tipo varchar(10) default 'carro' not null,
foreign key (cliente) references cliente(ID_cliente),
foreign key (equipe) references equipe(ID_equipe),
foreign key (pedido) references OS_serviço(ID_pedido)
)default charset = utf8;

create table equipe (
ID_Equipe int not null auto_increment primary key,
Mecanico int not null,
Etapa enum('avaliação','andamento','encerrado') default 'avaliação' not null,
foreign key(mecanico) references mecanico(ID_mecanico)
) default charset = utf8;

create table mecanico (
ID_mecanico int not null auto_increment primary key,
Nome varchar(15) not null,
Sobrenome varchar(15) not null,
Endereço varchar(15) not null,
RG char(8) not null,
CPF char(11) not null,
Tel char(10) not null, 
Email varchar(15) ,
Especialidade varchar(10) not null
 )default charset = utf8;

create table OS_Serviço(
ID_Pedido int not null auto_increment primary key,
Numero_pedido int not null,
Autorização enum('autorizado','Cancelado')default 'cancelado' not null,
Inicio date not null,
Termino date ,
Serviço enum('Conserto','Troca de oleo','Borracheiro','Pintura','Desamassar lataria') default 'conserto' not null, 
Mão_de_obra decimal (10,2) not null,
Valor_peça decimal (10,2) not null,
Valor_total decimal(10,2) not null
) default charset = utf8;

create table oficina (
Pedido int not null,
Mecanico int not null,
Equipe int not null,
Cliente int not null,
Veiculo int not null,
Pagamento int not null,
foreign key(pedido) references OS_Serviço(ID_pedido),
foreign key(mecanico) references mecanico(ID_mecanico),
foreign key(equipe) references equipe(ID_equipe),
foreign key(cliente) references cliente(ID_cliente),
foreign key(veiculo) references veiculo(ID_veiculo),
foreign key(pagamento) references pagamento(ID_pagamento)
)default charset utf8;

create table pagamento(
ID_pagamento int not null auto_increment primary key,
Pedido int not null,
Pagamento decimal(10,2) not null,
Forma enum ('a vista','débito','crédito','parcelado')default'a vista' not null,
Parcelas decimal(2),
Observação varchar(50)
)default charset =utf8;create table oficina ( Pedido int not null, Mecanico int not null, Equipe int not null, Cliente int not null, Veiculo int not null, Pagamento int not null, foreign key(pedido) references pedido(ID_pedido), foreign key(mecanico) references mecanico(ID_mecanico), foreign key(equipe) references equipe(ID_equipe), foreign key(cliente) references cliente(ID_cliente), foreign key(veiculo) references veiculo(ID_veiculo), foreign key(pagamento) references pagamento(ID_pagamento) )default charset utf8
