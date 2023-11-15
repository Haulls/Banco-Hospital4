DROP DATABASE IF EXISTS hospital;
CREATE DATABASE IF NOT EXISTS hospital;
USE hospital;

DROP TABLE IF EXISTS medicos;
CREATE TABLE medicos (
	medicos_id INT AUTO_INCREMENT PRIMARY KEY,
	medicos_nome VARCHAR(24) NOT NULL,
	sobrenome VARCHAR(24) NOT NULL,
    especialidade VARCHAR(100) NOT NULL
);


select * from medicos;
ALTER TABLE medicos
ADD COLUMN em_atividade BOOLEAN;

UPDATE medicos
SET em_atividade = FALSE
WHERE medicos_id IN (3, 7); 

UPDATE medicos
SET em_atividade = TRUE
WHERE medicos_id NOT IN (3, 7); 


DROP TABLE IF EXISTS pacientes;
CREATE TABLE pacientes (
	paciente_id  INT AUTO_INCREMENT PRIMARY KEY,
	paciente_nome VARCHAR(24) NOT NULL,
	sobrenome VARCHAR(24) NOT NULL,
    nascimento VARCHAR(12) NOT NULL,
    endereco VARCHAR(48)  NOT NULL,
    telefone VARCHAR (24) NOT NULL,
    email VARCHAR (128) NOT NULL,
    CPF varchar(11)  NOT NULL,
    RG VARCHAR(7) NOT NULL,
    FOREIGN KEY (medicos_id) REFERENCES medicos (medicos_id),
    FOREIGN KEY (especialidades_id) REFERENCES medicos(especialidade),
    FOREIGN KEY (convenio_id) REFERENCES convenio (convenio_id),
    FOREIGN KEY (medicamento) REFERENCES remedio (medicamento)
);


DROP TABLE IF EXISTS consultas;
CREATE TABLE consultas (

consultas_id INT AUTO_INCREMENT PRIMARY KEY,
data date not null,
hora   varchar(23) NOT NULL,
valor DECIMAL(8,8) NOT NULL,


FOREIGN KEY (paciente_id) REFERENCES paciente (paciente_id),
FOREIGN KEY (convenio_id) REFERENCES convenio (convenio_id),
FOREIGN KEY (medico_id) REFERENCES medico (medico_id),
FOREIGN KEY (especialidade) REFERENCES medico(especialidade),
FOREIGN KEY (remedio_id) REFERENCES remedio(remedio_id)
);


DROP TABLE IF EXISTS convenio;
CREATE TABLE convenio (
 convenio_id INT AUTO_INCREMENT PRIMARY KEY,
 CNPJ INT NOT NULL,
 tempo_carencia DATE NOT NULL
);

DROP TABLE IF EXISTS remedio;
CREATE TABLE remedio (
remedio_id INT AUTO_INCREMENT PRIMARY KEY,
medicamento VARCHAR(100) NOT NULL,
instrucoes VARCHAR (1000) NOT NULL
);

DROP TABLE IF EXISTS internacao;
CREATE TABLE internacao (
internacao_id INT AUTO_INCREMENT PRIMARY KEY,
data_prev_alta DATE NOT NULL,
data_alta DATE NOT NULL,
procedimento VARCHAR(10000) NOT NULL,

FOREIGN KEY (enfermeiro_id) REFERENCES enfermeiro (enfermeiro_id),
FOREIGN KEY (enfermeiro_nome) REFERENCES enfermeiro (enfermeiro_nome),
FOREIGN KEY (quarto_id) REFERENCES quarto (quarto_id),
FOREIGN KEY (medico_id) REFERENCES medico (medico_id),
FOREIGN KEY (paciente_id) REFERENCES paciente (paciente_id),
FOREIGN KEY (paciente_nome) REFERENCES paciente (paciente_nome)
);


DROP TABLE IF EXISTS enfermeiro;
CREATE TABLE enfermeiro (
enfermeiro_id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(24) NOT NULL,
sobrenome VARCHAR(24) NOT NULL,
cpf decimal(11) NOT NULL,
CRE VARCHAR (100) NOT NULL

);


DROP TABLE IF EXISTS quarto;
CREATE TABLE quarto (
quarto_id INT AUTO_INCREMENT PRIMARY KEY,
data_hora DATE NOT NULL,
quarto_numero DECIMAL(9)NOT NULL,


foreign key (medico_id) references medico (medico_id),
foreign key (paciente_id) references paciente(paciente_id)
); 

DROP TABLE IF EXISTS quarto_tipo;
CREATE TABLE quarto_tipo (

tipo_quarto_id INT AUTO_INCREMENT PRIMARY KEY,
descrição VARCHAR(100) NOT NULL,
valor_diaria DECIMAL(10,8) NOT NULL,

foreign key (quarto_id) references quarto(quarto_id)
);



INSERT INTO medicos (medico_id, medico_nome,sobrenome,especialidade) VALUES ('1', 'Carlos', 'Alberto','Pediatria');
INSERT INTO medicos (medico_id, medico_nome,sobrenome,especialidade) VALUES ('2', 'Daniel', 'Ribeiro','Clínica Geral');
INSERT INTO medicos (medico_id, medico_nome,sobrenome,especialidade) VALUES ('3', 'Ricardo', 'Gomes','gastrenterologia ');
INSERT INTO medicos (medico_id, medico_nome,sobrenome,especialidade) VALUES ('4', 'Gabriel', 'Alencar','dermatologia');
INSERT INTO medicos (medico_id, medico_nome,sobrenome,especialidade) VALUES ('5', 'Guilherme', 'Coelho','Cardiologia');
INSERT INTO medicos (medico_id, medico_nome,sobrenome,especialidade) VALUES ('6', 'João', 'Barroso','Plástica');
INSERT INTO medicos (medico_id, medico_nome,sobrenome,especialidade) VALUES ('7', 'Ligia', 'Turenen','Endoscopia');
INSERT INTO medicos (medico_id, medico_nome,sobrenome,especialidade) VALUES ('8', 'Emanuel', 'Santos','Geriatria');
INSERT INTO medicos (medico_id, medico_nome,sobrenome,especialidade) VALUES ('9', 'Simone', 'Salvador','Infectologia');
INSERT INTO medicos (medico_id, medico_nome,sobrenome,especialidade) VALUES ('10', 'Emilly', 'Martins','Patologia');

INSERT INTO paciente(paciente_id,paciente_nome,sobrenome,nascimento,endereco,telefone,email,cpf,rg,medico_id,especialidade,convenio_id,medicamento) VALUES ('1','Roberto','Carlos',17/10/1993,'R. Braz Leme, 39','963059340','robertocarlos122@gmail.com','344.406.000-93','10.267.265-9','10','Patologia','2','Amoxicilina,Amantadina');
INSERT INTO paciente(paciente_id,paciente_nome,sobrenome,nascimento,endereco,telefone,email,cpf,rg,medico_id,especialidade,convenio_id,medicamento) VALUES ('2','Daniel','Junior',16/12/1993,' Rua Afonso Pena, 492','(82) 2812-9178','danieljunior2122@gmail.com','888.973.400-08','29.825.531-5','3','gastrenterologia','2','Carboplatina,Carvedilol ');
INSERT INTO paciente(paciente_id,paciente_nome,sobrenome,nascimento,endereco,telefone,email,cpf,rg,medico_id,especialidade,convenio_id,medicamento) VALUES ('3','Guilherme','Pimentel',12/10/1993,'Rua Maria do Carmo Araújo da Silveira, 390','(55) 3713-8712','guicoelho2@gmail.com','091.823.690-89','49.922.039-0','3','gastrenterologia','2','Abacavir,Adefovir');
INSERT INTO paciente(paciente_id,paciente_nome,sobrenome,nascimento,endereco,telefone,email,cpf,rg,medico_id,especialidade,convenio_id,medicamento) VALUES ('4','Guilherme','Knip',2/2/2002,'Travessa Gilberto Giffoni, 500','(83) 2453-1855','knip22@gmail.com','320.878.450-34','21.445.256-6','10','Patologia','3','Belzutifano,Benztropina');
INSERT INTO paciente(paciente_id,paciente_nome,sobrenome,nascimento,endereco,telefone,email,cpf,rg,medico_id,especialidade,convenio_id,medicamento) VALUES ('5','Caio','Henrique',3/11/2000,'Rua Girassol, 312','(95) 2821-1468','caiohen@gmail.com','387.772.430-21','17.825.594-4','4','dermatologia','2','Carboplatina,Carvedilol ');
INSERT INTO paciente(paciente_id,paciente_nome,sobrenome,nascimento,endereco,telefone,email,cpf,rg,medico_id,especialidade,convenio_id,medicamento) VALUES ('6','Pedro','Santos',14/12/2001,'Rua Manoel Gomes Pimentel, 1032','(97) 3227-3878','pedrossantos@gmail.com','761.573.200-01','11.343.534-4','4','dermatologia','5','Amantadina');
INSERT INTO paciente(paciente_id,paciente_nome,sobrenome,nascimento,endereco,telefone,email,cpf,rg,medico_id,especialidade,convenio_id,medicamento) VALUES ('7','Kayque','moital',5/8/1999,'Rua Safira, 567','(96) 2208-0253','moital@gmail.com','867.983.100-01','42.796.543-3','10','Patologia','6','Abacavir,Adefovir');
INSERT INTO paciente(paciente_id,paciente_nome,sobrenome,nascimento,endereco,telefone,email,cpf,rg,medico_id,especialidade,convenio_id,medicamento) VALUES ('8','João','Barroso',12/7/2003,'Rua C, 39','(69) 2533-3937','barrosojoao@gmail.com','507.385.460-89','24.759.189-0','5','Cardiologia','4','Amoxicilina,Amantadina');
INSERT INTO paciente(paciente_id,paciente_nome,sobrenome,nascimento,endereco,telefone,email,cpf,rg,medico_id,especialidade,convenio_id,medicamento) VALUES ('9','Enzo','Bernardo',5/3/1996,'Rua Enfermeira Maria Germana Bezerra, 432','(87) 2123-6288','enzobernardoo@gmail.com','398.191.510-07','10.778.173-6','6','Plástica','5','Captopril');
INSERT INTO paciente(paciente_id,paciente_nome,sobrenome,nascimento,endereco,telefone,email,cpf,rg,medico_id,especialidade,convenio_id,medicamento) VALUES ('10','Matheus','Carlos',1/6/1993,'Avenida Pedro Vitali, 120','(47) 2546-9942','CarlosMatheus@gmail.com','985.392.440-47','46.261.258-2','6','Plástica','5','Abacavir,Adefovir');
INSERT INTO paciente(paciente_id,paciente_nome,sobrenome,nascimento,endereco,telefone,email,cpf,rg,medico_id,especialidade,convenio_id,medicamento) VALUES ('11','Camilly','Ferreira',7/9/2004,'2ª Travessa Nova, 322','(63) 2145-3780','caca23@gmail.com','600.100.120-01','36.995.503-1','7','Endoscopia','6','Belzutifano,Benztropina');
INSERT INTO paciente(paciente_id,paciente_nome,sobrenome,nascimento,endereco,telefone,email,cpf,rg,medico_id,especialidade,convenio_id,medicamento) VALUES ('12','Emilly','Manuela',14/11/2001,'Estrada do ABC, 411','(48) 2897-9517','pandinha@gmail.com','291.460.290-10','46.172.868-0','7','Endoscopia','1','Amoxicilina,Amantadina');
INSERT INTO paciente(paciente_id,paciente_nome,sobrenome,nascimento,endereco,telefone,email,cpf,rg,medico_id,especialidade,convenio_id,medicamento) VALUES ('13','Ligia','Santos',11/9/2005,'Beco Sete, 3','(84) 2881-5196','ligiaS@gmail.com','609.853.460-86','46.164.167-7','2','Clínica Geral','2','Carboplatina,Carvedilol');
INSERT INTO paciente(paciente_id,paciente_nome,sobrenome,nascimento,endereco,telefone,email,cpf,rg,medico_id,especialidade,convenio_id,medicamento) VALUES ('14','Luiza','Silva',29/4/2005,'Rua das Avencas, 41','(61) 3731-5689','luiza2020@gmail.com','071.521.060-29','30.049.138-4','9','Infectologia','4','Amoxicilina,Amantadina');
INSERT INTO paciente(paciente_id,paciente_nome,sobrenome,nascimento,endereco,telefone,email,cpf,rg,medico_id,especialidade,convenio_id,medicamento) VALUES ('15','Gustavo','Bizarria',3/10/2003,'Rua Belmira Ferreira, 32','(96) 2141-6187','gubizarria@gmail.com','126.241.100-97','24.605.164-4','9','Infectologia''4','Calcitonina,Cantaridina');


INSERT INTO consultas(consultas_id, data,hora, valor, paciente_id, convenio_id,medico_id, especialidade, remedio_id) VALUES ('1','21:10','30/11/2021','1.000,00','1','2','3','gastrenterologia','1');
INSERT INTO consultas(consultas_id, data,hora, valor, paciente_id, convenio_id,medico_id, especialidade, remedio_id) VALUES ('2','11:00','20/11/2021','600,00', '2','2','4','dermatologia','2 ');
INSERT INTO consultas(consultas_id, data,hora, valor, paciente_id, convenio_id,medico_id, especialidade, remedio_id) VALUES ('3','13:20','2/9/2021','1.000,00','3', '2','3','gastrenterologia','3');
INSERT INTO consultas(consultas_id, data,hora, valor, paciente_id, convenio_id,medico_id, especialidade, remedio_id) VALUES ('4','15:30','20/8/2021','900,00', '4','3','4','dermatologia','4');
INSERT INTO consultas(consultas_id, data,hora, valor, paciente_id, convenio_id,medico_id, especialidade, remedio_id) VALUES ('5','16:10','21/7/2021','1.000,00','3','2','8','Geriatria','3');
INSERT INTO consultas(consultas_id, data,hora, valor, paciente_id, convenio_id,medico_id, especialidade, remedio_id) VALUES ('6','7:10','19/10/2020','1.000,00','5','2','9','Infectologia','2 ');
INSERT INTO consultas(consultas_id, data,hora, valor, paciente_id,convenio_id,medico_id, especialidade, remedio_id) VALUES ('7','17:20','23/9/2020','1.000,00','8','8','8','Geriatria','1');
INSERT INTO consultas(consultas_id, data,hora, valor, paciente_id,convenio_id,medico_id, especialidade, remedio_id) VALUES ('8','23:10','1/8/2020','1.000,00','9','9','9','Infectologia','2');
INSERT INTO consultas(consultas_id, data,hora, valor, paciente_id,convenio_id,medico_id, especialidade, remedio_id) VALUES ('9','00:10','5/7/2020','1.000,00','10','2','6','Plástica','3');
INSERT INTO consultas(consultas_id, data,hora, valor, paciente_id,convenio_id,medico_id, especialidade, remedio_id) VALUES ('10','10:10','10/7/2020','1.000,00','11','7','5','Cardiologia','4');
INSERT INTO consultas(consultas_id, data,hora, valor, paciente_id,convenio_id,medico_id, especialidade, remedio_id) VALUES ('11','8:45','15/7/2020','1.000,00','12','7','6','Plástica','1');
INSERT INTO consultas(consultas_id, data,hora, valor, paciente_id,convenio_id,medico_id, especialidade, remedio_id) VALUES ('12','9:10','23/11/2021','1.000,00','13','2','5','Cardiologia','2');
INSERT INTO consultas(consultas_id, data,hora, valor, paciente_id,convenio_id,medico_id, especialidade, remedio_id) VALUES ('13','11:32','24/10/2021','1.000,00','14','4','2','Clínica Geral','1');
INSERT INTO consultas(consultas_id, data,hora, valor, paciente_id,convenio_id,medico_id, especialidade, remedio_id) VALUES ('14','22:45','3/10/2021','1.000,00','15','4','1','Pediatria','5');
INSERT INTO consultas(consultas_id, data,hora, valor, paciente_id,convenio_id,medico_id, especialidade, remedio_id) VALUES ('15','20:20','1/9/2021','1.000,00','6','2','2','Clínica Geral','Amantadina');
INSERT INTO consultas(consultas_id, data,hora, valor, paciente_id,convenio_id,medico_id, especialidade, remedio_id) VALUES ('16','21:10','30/11/2017','1.000,00','1','2','1','Pediatria','3');
INSERT INTO consultas(consultas_id, data,hora, valor, paciente_id,convenio_id,medico_id, especialidade, remedio_id) VALUES ('17','01:10','2/11/2017','1.000,00','4','3','2','Clínica Geral','4');
INSERT INTO consultas(consultas_id, data,hora, valor, paciente_id,convenio_id,medico_id, especialidade, remedio_id) VALUES ('18','06:10','1/10/2017','1.000,00','3','5','2','5','Cardiologia','2 ');
INSERT INTO consultas(consultas_id, data,hora, valor, paciente_id,convenio_id,medico_id, especialidade, remedio_id) VALUES ('19','14:10','7/9/2017','1.000,00','9','9','3','gastrenterologia','1');
INSERT INTO consultas(consultas_id, data,hora, valor, paciente_id,convenio_id,medico_id, especialidade, remedio_id) VALUES ('20','15:10','17/10/2016','1.000,00','15','4','5','Cardiologia','5');

INSERT INTO convenio(convenio_id, convenio_nome, cnpj, tempo_carencia) VALUES ('1', 'SulAmérica','41.428.405/0001-02', '24H');
INSERT INTO convenio(convenio_id, convenio_nome, cnpj, tempo_carencia) VALUES ('2', 'NotreDame Intermédica','12.464.461/0001-02', '24H');
INSERT INTO convenio(convenio_id, convenio_nome, cnpj, tempo_carencia) VALUES ('3', 'Assim Saúde','67.380.781/0001-68', '24H');
INSERT INTO convenio(convenio_id, convenio_nome, cnpj, tempo_carencia) VALUES ('4', 'Prevent Senior','67.226.280/0001-21', '24H');
INSERT INTO convenio(convenio_id, convenio_nome, cnpj, tempo_carencia) VALUES ('5', 'Central Nacional Unimed (CNU)','88.382.493/0001-12', '24H');
INSERT INTO convenio(convenio_id, convenio_nome, cnpj, tempo_carencia) VALUES ('6', 'São Francisco Saúde','43.036.779/0001-08', '24H');

INSERT INTO remedio(remedio_id,medicamento,instrucoes) VALUES ('1'',Amoxicilina,Amantadina', '1 pílula ao dia');
INSERT INTO remedio(remedio_id,medicamento,instrucoes) VALUES ('2','Carboplatina,Carvedilol', '1 pílula ao dia');
INSERT INTO remedio(remedio_id,medicamento,instrucoes) VALUES ('3','Abacavir,Adefovir','1 pílula ao dia');
INSERT INTO remedio(remedio_id,medicamento,instrucoes) VALUES ('4','Amoxicilina,Amantadina', '1 pílula ao dia');
INSERT INTO remedio(remedio_id,medicamento,instrucoes) VALUES ('5','Calcitonina,Cantaridina','1 pílula ao dia');


INSERT INTO  internacao(internacao_id,data_prev_alta, data_alta, procedimento, enfermeiro_id,enfermeiro_nome, quarto_id,medico_id,paciente_id,paciente_nome) VALUES ('1','17/10/21', '18/10/21','Cirurgia','1','Jéssica','1','1','1','Roberto');
INSERT INTO  internacao(internacao_id,data_prev_alta, data_alta, procedimento, enfermeiro_id,enfermeiro_nome, quarto_id,medico_id,paciente_id,paciente_nome) VALUES ('2','20/10/21', '22/10/21','Cirurgia','2','Roberta','2','2','1','Daniel');
INSERT INTO  internacao(internacao_id,data_prev_alta, data_alta, procedimento, enfermeiro_id,enfermeiro_nome, quarto_id,medico_id,paciente_id,paciente_nome) VALUES ('3','20/5/21', '27/5/21','Internação','3','Daniel','1','1','1','Roberto'); 
INSERT INTO  internacao(internacao_id,data_prev_alta, data_alta, procedimento, enfermeiro_id,enfermeiro_nome, quarto_id,medico_id,paciente_id,paciente_nome) VALUES ('4','20/10/21', '22/10/21','Cirurgia','2','Roberta','2','2','1','Daniel'); 
INSERT INTO  internacao(internacao_id,data_prev_alta, data_alta, procedimento, enfermeiro_id,enfermeiro_nome, quarto_id,medico_id,paciente_id,paciente_nome) VALUES ('5','25/10/2017', '1/11/2017','Cirurgia','4','Caroline','7','10','5','Caio'); 
INSERT INTO  internacao(internacao_id,data_prev_alta, data_alta, procedimento, enfermeiro_id,enfermeiro_nome, quarto_id,medico_id,paciente_id,paciente_nome) VALUES ('6','10/1/21', '2/2/21','Cirurgia','5','Fernanda','3','7','15','Gustavo');
INSERT INTO  internacao(internacao_id,data_prev_alta, data_alta, procedimento, enfermeiro_id,enfermeiro_nome, quarto_id,medico_id,paciente_id,paciente_nome) VALUES ('7','17/4/2019', '25/4/21','Internação','6','Gustavo','4','9','9','Enzo');

INSERT INTO enfermeiro (enfermeiro_id, nome, sobrenome, CPF, CRE) VALUES ('1', 'Jessica', 'teixeira','869.581.380-07','5580 7187 7855 0768');
INSERT INTO enfermeiro (enfermeiro_id, nome, sobrenome, CPF, CRE) VALUES ('2', 'Roberta', 'Messia','150.451.660-50','5125 3114 4965 3948');
INSERT INTO enfermeiro (enfermeiro_id, nome, sobrenome, CPF, CRE) VALUES ('3', 'Daniel', 'Dos anjos','218.926.790-00','5400 7999 1243 6062');
INSERT INTO enfermeiro (enfermeiro_id, nome, sobrenome, CPF, CRE) VALUES ('4', 'Caroline', 'araujo','484.672.340-24','5287 2653 9732 3017');
INSERT INTO enfermeiro (enfermeiro_id, nome, sobrenome, CPF, CRE) VALUES ('5', 'Fernanda',' araujo','324.472.980-05','5580 7187 7855 0768');
INSERT INTO enfermeiro (enfermeiro_id, nome, sobrenome, CPF, CRE) VALUES ('6', 'gustavo', 'araujo','743.080.150-14', '2788 1852 5729');
INSERT INTO enfermeiro (enfermeiro_id, nome, sobrenome, CPF, CRE) VALUES ('7', 'Antonio', 'Dos Santos','869.581.380-07','5386 5400 6015 6344');

INSERT INTO quarto(quarto_id,data_hora,medico_id,paciente_id) VALUES ('1','1', '27/10/2017,18:15','1','10~');
INSERT INTO quarto(quarto_id,data_hora,medico_id,paciente_id) VALUES ('2','2', '22/6/2017,06:15','9','5');
INSERT INTO quarto(quarto_id,data_hora,medico_id,paciente_id) VALUES ('3', '3','27/10/2017,17:15','8','6');
INSERT INTO quarto(quarto_id,data_hora,medico_id,paciente_id) VALUES ('4','4', '27/10/2017,02:02','7','7');
INSERT INTO quarto(quarto_id,data_hora,medico_id,paciente_id) VALUES ('5','5', '27/10/2017,10:20','3','8');
INSERT INTO quarto(quarto_id,data_hora,medico_id,paciente_id) VALUES ('6', '6','27/10/2017,20:30','2','9');
INSERT INTO quarto(quarto_id,data_hora,medico_id,paciente_id) VALUES ('7', '7','18/5/2017,10:15','5','15');

INSERT INTO quarto_tipo(tipo_quarto_id,descrição,valor_diaria, quarto_id) VALUES ('1', 'apartamento', '500,00',' 1');
INSERT INTO quarto_tipo(tipo_quarto_id,descrição,valor_diaria, quarto_id) VALUES ('2', 'Quarto Duplo', '1000,00', '2');
INSERT INTO quarto_tipo(tipo_quarto_id,descrição,valor_diaria, quarto_id) VALUES ('3', 'Enfermaria', '300,00', '4');
INSERT INTO quarto_tipo(tipo_quarto_id,descrição,valor_diaria, quarto_id) VALUES ('4', 'apartamento', '500,00', 3);
INSERT INTO quarto_tipo(tipo_quarto_id,descrição,valor_diaria, quarto_id) VALUES ('5', 'apartamento conjunto', '600,00', '5');
INSERT INTO quarto_tipo(tipo_quarto_id,descrição,valor_diaria, quarto_id) VALUES ('6', 'apartamento', '500,00', '3');
INSERT INTO quarto_tipo(tipo_quarto_id,descrição,valor_diaria, quarto_id) VALUES ('7', 'Enfermaria', '300,00', '4');











































