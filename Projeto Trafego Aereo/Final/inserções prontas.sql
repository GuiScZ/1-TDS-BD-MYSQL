Insert Into pessoa (nome, cpf, telefone) values
('J.Gabriel', '95041832048', '996341509'), 
('Leo', '51820733726', '994820071'),
('Guilherme', '78913370204', '992099531'),
('Juliano', '75645696891', '981139498'),
('Tomas', '46996880203', '996819232'), 
('Marcelo', '55475884587', '997589601'),
('Ryan', '80405257058', '995224359'), 
('Gabriel.S', '46408155812', '981403702'),
('Tales', '72275016040', '981210602'), 
('Paulo', '52891970446', '996888461');


Insert Into Aeroporto (nome, endereco, capacidade, quantidade_de_pontes, torre_de_controle) values
('Aeroporto Internacional de São Paulo-Guarulhos', 'Guarulhos, SP', '12000000', '22', 'T1'),
('Aeroporto Internacional de Campinas', 'Campinas, SP', '25000000', '28', 'T2'),
('Aeroporto Internacional do Rio de Janeiro-Galeão', 'Rio de Janeiro, RJ', '27000000', '26', 'T3'),
('Aeroporto Internacional de Natal', 'São Gonçalo do Amarante, RN', '6200000', '8', 'T4'),
('Aeroporto Internacional do Recife-Guararapes', 'Recife, PE', '16500000', '11', 'T5');

Insert Into operador_aereo (nome_aeroporto, turno, cpf_pessoa, salario, portoes_de_servico) values
('Aeroporto Internacional de São Paulo-Guarulhos', 'Manhã', '78913370204', '4100', '16'),
('Aeroporto Internacional de Campinas', 'Noite', '75645696891', '4100', '14');

Insert Into Centro_de_controle_de_area (endereco, quantidade_de_controladores) values
('SP', '10'),('SP', '12'),
('RJ', '14'),('RN', '16'),
('PE', '8');

Insert Into Controlador (centro_de_controle_de_aerea_id, nome_aeroporto, cpf_pessoa, turno) values
('3', 'Aeroporto Internacional do Rio de Janeiro-Galeão', '46996880203', 'Tarde'),
('4', 'Aeroporto Internacional de Natal', '55475884587', 'Noite');

Insert Into Piloto (cpf_pessoa, licenca, disponibilidade) values
('80405257058', '102047', '220000'),
('46408155812', '054024', '120000');

Insert Into Plano_de_voo (destino, horario_de_chegada, origem, horario_de_partida) values
('Natal, RN', '014500', 'São Paulo', '223000'),
('Recife, PE', '154000', 'São Paulo', '123000');

Insert Into incidente (descricao, grau_de_perigo) values
('Turbulência', 'Aceitável'),
('Falta de combustível', 'Aceitável'),
('Explosão da turbina', 'Tolerável'),
('Sabotagem nos motores', 'Perigoso'),
('Terrorismo', 'Perigoso');

Insert Into Companhia_aerea (nome, cnpj, quantidade_de_avioes, quantidade_de_pilotos) values
('GOLLOG', '07575651000159', '8', '26'),
('LATAM Cargo', '02012862000160', '6', '24'),
('TOTAL Cargo', '12149289000194', '12', '30');

insert into r_entre_pi values(1, 1), (2, 2);

Insert Into Aeronave (operador_id, piloto_id, plano_de_voo_id, cnpj_companhia_aerea, 
matricula, tipo, quantidade_de_lugares, potencia_do_motor) values
('1', '1', '1', '07575651000159', 'RA-YNE', 'Boeing 777-300ER', '550', '175.000'),
('2', '2', '2', '02012862000160', 'AZ-PQZ', 'Airbus A380', '525', '308.430');

Insert Into fiscal_de_patio (cpf_pessoa, matricula_ae, area_de_atuacao, disponibilidade) values
('95041832048','RA-YNE', '2', '120000'),
('51820733726','AZ-PQZ', '1', '180000');

Insert Into Setor (centro_de_controle_de_area_id, numero_de_identificacao, area_do_espaco_aereo, tipo) values
('1', '01', '8000', 'Superior'),
('2', '02', '8100', 'Superior');

insert into r_entre_cs values(01, 1), (02, 2);

select *from pessoa;

drop table setor;
