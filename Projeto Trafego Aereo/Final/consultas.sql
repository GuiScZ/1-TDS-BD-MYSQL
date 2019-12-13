use trafegoaereo;

drop database trafegoaereo;


-- Aeronave por matrícula
select ar.matricula, ar.tipo, ar.quantidade_de_lugares, ar.potencia_do_motor
from Aeronave as ar
join fiscal_de_patio as f on ar.matricula = f.matricula_ae;
 
-- pessoa por cpf
select p.nome, p.cpf, p.telefone
from pessoa as p
left join piloto as pi on p.cpf = pi.cpf_pessoa;

-- Piloto pela sua disponibilidade
select p.nome, pi.licenca, pi.disponibilidade
from piloto as pi
join pessoa as p on p.cpf = pi.cpf_pessoa
where pi.disponibilidade = '220000' or pi.disponibilidade = '120000';
 
-- controladores por setor
select p.nome, p.cpf, p.telefone, c.turno, s.area_do_espaco_aereo, s.tipo, s.numero_de_identificacao
from Pessoa as p, controlador as c, setor as s, r_entre_cs as rcs
where p.cpf= c.cpf_pessoa and rcs. setor_id = numero_de_identificacao and rcs.controlador_id = id_controlador; 

-- incidentes por plano de vôo
select pl.origem, pl.destino, pl.horario_de_partida, pl.horario_de_chegada, inc.descricao, inc.grau_de_perigo
from r_entre_pi as rpi
join plano_de_voo as pl on pl.id_plano_de_voo = rpi.plano_de_voo_id
join incidente as inc on inc.id_incidente = rpi.incidente_id; 

-- plano de vôo pelo indentificador
select a.matricula, a.tipo, a.quantidade_de_lugares, a.potencia_do_motor, 
pl.origem, pl.destino, pl.horario_de_partida, pl.horario_de_chegada
from plano_de_voo as pl
join aeronave as a on a.plano_de_voo_id = pl.id_plano_de_voo; 

-- fiscal de pátio pela disponibilidade
select p.nome, f.area_de_atuacao, f.disponibilidade
from pessoa as p
join fiscal_de_patio as f on f.cpf_pessoa = p.cpf
where f.disponibilidade = '120000' or f.disponibilidade = '180000'; 

-- plano de vôo pelo horário de chegada
select pl.origem, pl.destino, pl.horario_de_partida, pl.horario_de_chegada, a.tipo
from aeronave as a
join plano_de_voo as pl on pl.id_plano_de_voo = a.plano_de_voo_id
where pl.horario_de_chegada = '014500' or pl.horario_de_chegada = '154000';

-- plano de vôo pelo destino
select pl.origem, pl.destino, pl.horario_de_partida, pl.horario_de_chegada, a.tipo
from aeronave as a
join plano_de_voo as pl on pl.id_plano_de_voo = a.plano_de_voo_id
where pl.destino = 'Natal, RN' or pl.destino = 'Recife, PE';

-- plano de vôo com mais incidentes ou sem nenhum incidentes
select pl.origem, pl.destino, pl.horario_de_partida, pl.horario_de_chegada
from r_entre_pi as rpi
join plano_de_voo as pl on pl.id_plano_de_voo = rpi.plano_de_voo_id
join incidente as inc on inc.id_incidente  = rpi.incidente_id
where inc.id_incidente is null or inc.id_incidente is not null;