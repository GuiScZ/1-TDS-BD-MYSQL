USE trafegoaereo;

create database trafegoaereo;

CREATE table Pessoa(
nome varchar(60),
cpf char(11) not null,
telefone int(11),
primary key(cpf)
);

Insert Into pessoa (nome, cpf, telefone) values
('Arthur', '95041832048', '996341509'), ('Matheus', '51820733726', '994820071'),
('Lucas', '78913370204', '992099531'), ('Sérgio', '75645696891', '981139498'),
('Elias', '46996880203', '996819232'), ('Eduardo', '55475884587', '997589601'),
('Ryan', '80405257058', '995224359'), ('José', '46408155812', '981403702'),
('Fábio', '72275016040', '981210602'), ('Márcio', '52891970446', '996888461');

select * from pessoa;

create table fiscal_de_patio(
id_fiscal_de_patio int auto_increment,
cpf_pessoa char (11),
area_de_atuacao int (1),
disponibilidade time,
primary key (id_fiscal_de_patio),
constraint fk_pesfiscal foreign key (cpf_pessoa) references Pessoa (cpf)
);

Insert Into fiscal_de_patio (cpf_pessoa, area_de_atuacao, disponibilidade) values
('95041832048', '2', '120000'),
('51820733726', '1', '180000');

select * from fiscal_de_patio;

create table Aeroporto(
nome varchar(100) not null,
endereco varchar(60),
capacidade int(11),
quantidade_de_pontes int(11),
torre_de_controle varchar(60),
primary key(nome)
);

Insert Into Aeroporto (nome, endereco, capacidade, quantidade_de_pontes, torre_de_controle) values
('Aeroporto Internacional de São Paulo-Guarulhos', 'Guarulhos, SP', '12000000', '22', 'T1'),
('Aeroporto Internacional de Campinas', 'Campinas, SP', '25000000', '28', 'T2'),
('Aeroporto Internacional do Rio de Janeiro-Galeão', 'Rio de Janeiro, RJ', '27000000', '26', 'T3'),
('Aeroporto Internacional de Natal', 'São Gonçalo do Amarante, RN', '6200000', '8', 'T4'),
('Aeroporto Internacional do Recife-Guararapes', 'Recife, PE', '16500000', '11', 'T5');

select * from Aeroporto;

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

Insert Into operador_aereo (nome_aeroporto, turno, cpf_pessoa, salario, portoes_de_servico) values
('Aeroporto Internacional de São Paulo-Guarulhos', 'Manhã', '78913370204', '4100', '16'),
('Aeroporto Internacional de Campinas', 'Noite', '75645696891', '4100', '14');

select * from operador_aereo;

create table Centro_de_controle_de_area(
id_centro_de_controles_aerea int,
endereco varchar(60),
quantidade_de_controladores int(11),
primary key (id_centro_de_controles_aerea)
);

Insert Into Centro_de_controle_de_area (id_centro_de_controles_aerea, endereco, quantidade_de_controladores) values
('1', 'SP', '10'),
('2', 'SP', '12'),
('3', 'RJ', '14'),
('4', 'RN', '16'),
('5', 'PE', '8');

select * from Centro_de_controle_de_area;

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

Insert Into controlador (centro_de_controle_de_aerea_id, nome_aeroporto, cpf_pessoa, turno) values
('3', 'Aeroporto Internacional do Rio de Janeiro-Galeão', '46996880203', 'Tarde'),
('4', 'Aeroporto Internacional de Natal', '55475884587', 'Noite');

select * from controlador;

create table Piloto(
id_piloto int auto_increment,
cpf_pessoa char (11),
licenca varchar (60),
disponibilidade time,
primary key (id_piloto),
constraint fk_pespiloto foreign key (cpf_pessoa) references Pessoa (cpf)
);

Insert Into Piloto (cpf_pessoa, licenca, disponibilidade) values
('80405257058', '102047', '220000'),
('46408155812', '054024', '120000');

select * from Piloto;

create table Plano_de_voo(
id_plano_de_voo int auto_increment,
destino varchar(20),
horario_de_chegada time,
origem varchar(60),
horario_de_partida time,
primary key (id_plano_de_voo)
);

Insert Into Plano_de_voo (destino, horario_de_chegada, origem, horario_de_partida) values
('Natal, RN', '014500', 'São Paulo', '223000'),
('Recife, PE', '154000', 'São Paulo', '123000');

select * from Plano_de_voo;

create table incidente(
id_incidente int auto_increment,
plano_de_voo_id int,
descricao varchar(255),
grau_de_perigo varchar(10),
primary key (id_incidente),
constraint fk_plaincidente foreign key (plano_de_voo_id) references Plano_de_voo (id_plano_de_voo)
);

Insert Into incidente (descricao, grau_de_perigo) values
('Turbulência', 'Aceitável'),
('Falta de combustível', 'Aceitável'),
('Explosão da turbina', 'Tolerável'),
('Sabotagem nos motores', 'Perigoso'),
('Terrorismo', 'Perigoso');

select * from incidente;

create table Companhia_aerea(
nome varchar(100),
cnpj char(14)not null,
quantidade_de_avioes int(11),
quantidade_de_pilotos int(11),
primary key(cnpj)
);

Insert Into Companhia_aerea (nome, cnpj, quantidade_de_avioes, quantidade_de_pilotos) values
('GOLLOG', '07575651000159', '8', '26'),
('LATAM Cargo', '02012862000160', '6', '24'),
('TOTAL Cargo', '12149289000194', '12', '30');

select * from Companhia_aerea;

create table Aeronave(
operador_id int,
piloto_id int,
fiscal_de_patio_id int,
plano_de_voo_id int,
cnpj_companhia_aerea char(14),
matricula varchar(6) not null,
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

Insert Into Aeronave (operador_id, piloto_id, fiscal_de_patio_id, plano_de_voo_id, cnpj_companhia_aerea, matricula, tipo, quantidade_de_lugares, potencia_do_motor) values
('1', '1', '1','1', '07575651000159', 'RA-YNE', 'Boeing 777-300ER', '550', '175.000'),
('2', '2', '2','2', '02012862000160', 'AZ-PQZ', 'Airbus A380', '525', '308.430');

select * from Aeronave;

create table Setor(
centro_de_controle_de_area_id int,
controlador_id int,
numero_de_identificacao int(11) not null,
area_do_espaco_aereo int(11),
tipo varchar(20),
primary key(numero_de_identificacao),
constraint fk_contsetor foreign key (controlador_id) references controlador(id_controlador),
constraint fk_compsetor foreign key (centro_de_controle_de_area_id) references centro_de_controle_de_area(id_centro_de_controles_aerea)
);

Insert Into Setor (centro_de_controle_de_area_id, controlador_id, numero_de_identificacao, area_do_espaco_aereo, tipo) values
('1', '1', '01', '8000', 'Superior'),
('2', '2', '02', '8100', 'Superior');

select * from Setor;