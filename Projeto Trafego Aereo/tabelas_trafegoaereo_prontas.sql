USE trafegoaereo;

create database trafegoaereo;

CREATE table Pessoa(
nome varchar(60),
cpf char(11) not null,
telefone int(11),
primary key(cpf)
);

create table fiscal_de_patio(
id_fiscal_de_patio int auto_increment,
cpf_pessoa char (11),
area_de_atuacao int (1),
disponibilidade time,
primary key (id_fiscal_de_patio),
constraint fk_pesfiscal foreign key (cpf_pessoa) references Pessoa (cpf)
);

create table Aeroporto(
nome varchar(100) not null,
endereco varchar(60),
capacidade int(11),
quantidade_de_pontes int(11),
torre_de_controle varchar(60),
primary key(nome)
);

create table operador_aereo(
id_operador_aereo int auto_increment,
nome_aeroporto varchar (60),
turno varchar(10),
cpf_pessoa char(11),
salario int(20),
portoes_de_servico varchar(10),
primary key (id_operador_aereo),
constraint fk_pesoperador foreign key (cpf_pessoa) references Pessoa (cpf),
constraint fk_aeropoperador foreign key (nome_aeroporto) references Aeroporto(nome)
);

create table Centro_de_controle_de_area(
id_centro_de_controles_aerea int,
endereco varchar(60),
quantidade_de_controladores int(11),
primary key (id_centro_de_controles_aerea)
);

create table controlador(
id_controlador int auto_increment,
centro_de_controle_de_aerea_id int,
nome_aeroporto varchar (60),
cpf_pessoa char(11),
turno varchar(10),
primary key (id_controlador),
constraint fk_pescontrolador foreign key (cpf_pessoa) references Pessoa(cpf),
constraint fk_contaeroporto foreign key (nome_aeroporto) references Aeroporto(nome),
constraint fk_contcentro foreign key (centro_de_controle_de_aerea_id) references Centro_de_controle_de_area(id_centro_de_controles_aerea)
);

create table Piloto(
id_piloto int auto_increment,
cpf_pessoa char (11),
licenca varchar (60),
disponibilidade time,
primary key (id_piloto),
constraint fk_pespiloto foreign key (cpf_pessoa) references Pessoa (cpf)
);

create table Plano_de_voo(
id_plano_de_voo int auto_increment,
destino varchar(20),
horario_de_chegada time,
origem varchar(60),
horario_de_partida time,
primary key (id_plano_de_voo)
);

create table r_entre_pi(
plano_de_voo_id int,
incidente_id int,
constraint fk_pi1 foreign key (plano_de_voo_id) references plano_de_voo(id_plano_de_voo),
constraint fk_pi2 foreign key (incidente_id) references incidente(id_incidente)
);

create table incidente(
id_incidente int auto_increment,
plano_de_voo_id int,
descricao varchar(255),
grau_de_perigo varchar(10),
primary key (id_incidente)
);

create table Companhia_aerea(
nome varchar(100),
cnpj char(14)not null,
quantidade_de_avioes int(11),
quantidade_de_pilotos int(11),
primary key(cnpj)
);

create table Aeronave(
operador_id int,
piloto_id int,
fiscal_de_patio_id int,
plano_de_voo_id int,
cnpj_companhia_aerea char(14),
matricula int(11) not null,
tipo varchar(20),
quantidade_de_lugares int(11),
potencia_do_motor varchar(10),
primary key(matricula),
constraint fk_plaaeronave foreign key (plano_de_voo_id) references Plano_de_voo(id_plano_de_voo),
constraint fk_compaeronave foreign key (cnpj_companhia_aerea) references Companhia_aerea(cnpj),
constraint fk_operaeronave foreign key (operador_id) references operador_aereo(id_operador_aereo),
constraint fk_piloaeronave foreign key (piloto_id) references Piloto(id_piloto),
constraint fk_fiscaeronave foreign key (fiscal_de_patio_id) references Fiscal_de_patio(id_fiscal_de_patio)
);

create table Setor(
centro_de_controle_de_area_id int,
controlador_id int,
numero_de_identificacao int(11) not null,
area_do_espaco_aereo int(11),
tipo varchar(20),
primary key(numero_de_identificacao),
constraint fk_compsetor foreign key (centro_de_controle_de_area_id) references centro_de_controle_de_area(id_centro_de_controles_aerea)
);


create table r_entre_cs(
setor_id int,
controlador_id int,
constraint fk_cs1 foreign key (setor_id) references setor (numero_de_identificacao),
constraint fk_cs2 foreign key (controlador_id) references controlador(id_controlador)
);