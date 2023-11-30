# Sistema-Clinica-Pediatrica
Projeto de Sistema para Clínica Pediátrica


Projeto de Sistema para Clínica Pediátrica

Será realizado um projeto de implementação de um sistema de uma clínica pediátrica, incluindo seu banco de dados. Pois é necessário ter um melhor acompanhamento de cada paciente assim como o tratamento realizado e o especialista que o acompanha. Neste sistema, estarão armazenadas informações sobre cada paciente e de cada médico da clínica. Para cada paciente, o banco de dados deverá conter os dados da criança e seu responsável, sendo que um responsável pode ter nenhum ou várias crianças cadastradas, mas cada criança deve estar ligada obrigatoriamente a um responsáveis podendo ter mais de um responsável, deve conter também a etnia daquela criança e ela deve pertencer a nenhuma ou uma etnia. A etnia pode pertencer a nenhuma ou a várias crianças. Cada criança pode realizar várias consultas e um tratamento pode conter apenas uma criança. Não haverá limites de consultas para o tratamento, porém a consulta deve pertencer a um tratamento. Um médico pediatra deve atender a muitas consultas e uma consulta deve conter um médico pediatra. Além de dados dos pacientes, o banco de dados deverá conter dados sobre os médicos e dos tratamentos. Cada médico terá um identificador único e cada paciente com seus dados.


1. Identificação de Entidades:
No contexto da clínica pediátrica, identifiquei as seguintes entidades principais:

Paciente
Médico
Consulta
Tratamento
Responsável
Etnia





2. Relacionamentos:
Paciente - Responsável:
Muitos para Muitos (M:N), pois um responsável pode ter várias crianças, e uma criança pode ter vários responsáveis.
Paciente - Consulta:
Um para Muitos (1:N), já que um paciente pode ter várias consultas, mas cada consulta está associada a apenas um paciente.
Tratamento - Paciente:
Um para Um (1:1), uma vez que um tratamento contém apenas uma criança.
Consulta - Médico:
Um para Muitos (1:N), pois um médico pode atender a várias consultas, mas cada consulta é realizada por apenas um médico.
Etnia - Paciente:
Muitos para Muitos (M:N), pois uma etnia pode estar associada a várias crianças, e uma criança pode pertencer a várias etnias.

3. Atributos, Tipo de Dados e tamanho Proposto:

Paciente:
ID_Paciente (Chave Primária, INT)
Nome (VARCHAR(255))
Data de Nascimento (DATE)
Endereço (Multivalorado):
Tipo (ENUM: Casa, Apartamento, Trabalho) - Obrigatório escolher um
Logradouro (VARCHAR(255))
Número (VARCHAR(20))
Complemento (VARCHAR(100))
Bairro (VARCHAR(100))
Cidade (VARCHAR(100))
Estado (CHAR(2))
CEP (CHAR(8))
Telefone de Contato:
Celular (VARCHAR(15)) - Considerando o formato com DDD (ex: +55 11 98765-4321)
Fixo (VARCHAR(14)) - Considerando o formato com DDD (ex: +55 11 1234-5678)
E-mail (VARCHAR(255))

Médico:
ID_Médico (Chave Primária, INT)
Nome (VARCHAR(255))
Especialidade (VARCHAR(100))
CPF (CHAR(11)) - Considerando o CPF no formato brasileiro, com 11 dígitos.
Endereço (Multivalorado):
Tipo (ENUM: Casa, Apartamento, Trabalho) - Obrigatório escolher um
Logradouro (VARCHAR(255))
Número (VARCHAR(20))
Complemento (VARCHAR(100))
Bairro (VARCHAR(100))
Cidade (VARCHAR(100))
Estado (CHAR(2))
CEP (CHAR(8))

Telefone de Contato:
Celular (VARCHAR(15)) - Considerando o formato com DDD (ex: +55 11 98765-4321)
Fixo (VARCHAR(14)) - Considerando o formato com DDD (ex: +55 11 1234-5678)
E-mail (VARCHAR(255))

Consulta:
ID_Consulta (Chave Primária, INT)
Data (DATE)
Descrição (TEXT)
ID_Paciente (Chave Estrangeira, INT)
ID_Médico (Chave Estrangeira, INT)

Tratamento:
ID_Tratamento (Chave Primária, INT)
Descrição (TEXT)
ID_Paciente (Chave Estrangeira, INT)

Responsável:
ID_Responsável (Chave Primária, INT)
Nome (VARCHAR(255))
CPF (CHAR(11)) - Considerando o CPF no formato brasileiro, com 11 dígitos.
Endereço (Multivalorado):
Tipo (ENUM: Casa, Apartamento, Trabalho) - Obrigatório escolher um
Logradouro (VARCHAR(255))
Número (VARCHAR(20))
Complemento (VARCHAR(100))
Bairro (VARCHAR(100))
Cidade (VARCHAR(100))
Estado (CHAR(2))
CEP (CHAR(8))

Telefone de Contato:
Celular (VARCHAR(15)) - Considerando o formato com DDD (ex: +55 11 98765-4321)
Fixo (VARCHAR(14)) - Considerando o formato com DDD (ex: +55 11 1234-5678)
E-mail (VARCHAR(255))

Etnia:
ID_Etnia (Chave Primária, INT)
Descrição (VARCHAR(100))

4. Cardinalidade:

Paciente - Responsável:
M:N
Paciente - Consulta:
1:N
Tratamento - Paciente:
1:1
Consulta - Médico:
1:N
Etnia - Paciente:
M:N


